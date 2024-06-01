//=============================================================================
// TarquinExtrudeBuilder: Builds basically anything
// Credits to Tarquin for the original brush builder
// Ported to UE2 by Master_64
//=============================================================================
class TarquinExtrudeBuilder extends BrushBuilder;

const ArraySize = 16;
const UUCircle = 65536.0f;
const ZeroVect = vect(0,0,0);
const SheetPolyFlags = 0x00000108;

enum EExtrudeType
{
	EX_Translational,
	EX_Tangential,
	EX_ThirdWay
};

enum EShapeSource
{
	SO_Vectors,
	SO_pSquare,
	SO_pCircle,
	SO_MrPointy
};

enum EPathSource
{
	SO_Vect_Abs,
	SO_Vect_Rel
};

enum EMaths
{
	MA_Matrix,
	MA_Quaternion
};

enum ECommands
{
	C_None,
	C_ShowShape,
	C_ShowJoints,
	C_ResetShape,
	C_ResetPath,
	C_ScaleShape,
	C_MoveShape,
	C_RotShape,
	C_ConvPath,
	C_MakeArc,
	C_MakeMirror
};

enum ECommandReturn
{
	CR_Stop,
	CR_BuildStop,
	CR_Continue
};

struct Matrix3x3
{
	var() float a11;
	var() float a12;
	var() float a13;
	var() float a21;
	var() float a22;
	var() float a23;
	var() float a31;
	var() float a32;
	var() float a33;
};

struct Quat
{
	var() float W;
	var() float X;
	var() float Y;
	var() float Z;
};

var() Vector ShapePoints[16];
var() Vector PathPoints[16];
var() float ShapeFactor;
var() float PathFactor;
var() TarquinExtrudeBuilder.EExtrudeType ExtrudeType;
var() TarquinExtrudeBuilder.EShapeSource ShapeSource;
var() TarquinExtrudeBuilder.EPathSource PathSource;
var() float PresetMetrics[6];
var() bool ClosedPath;
var() bool MergeCoplanars;
var() bool SheetPolys;
var() bool InvisibleFinal;
var() Vector Randomiser;
var() Vector RandomiserCaps;
var() TarquinExtrudeBuilder.EMaths Maths;
var() name GroupName;
var() TarquinExtrudeBuilder.ECommands _COMMAND;
var() float _Parameters[3];
var bool LevelsOnly;

final operator(16) Quat Multiply_QuatQuat(Quat Q1, Quat Q2)
{
	local Vector v1, V2, Vp;
	local Quat Qp;

	v1 = eVect(Q1.X, Q1.Y, Q1.Z);
	V2 = eVect(Q2.X, Q2.Y, Q2.Z);
	Qp.W = (Q1.W * Q2.W) - (v1 Dot V2);
	Vp = ((Q1.W * V2) + (Q2.W * v1)) - (v1 Cross V2);
	Qp.X = Vp.X;
	Qp.Y = Vp.Y;
	Qp.Z = Vp.Z;
	return Qp;
}

function Quat RotationToQuat(Vector Axis, float Theta)
{
	local Quat Q;
	local float L;

	Axis = Normal(Axis);
	Q.W = Cos(Theta / float(2));
	Q.X = Axis.X * Sin(Theta / float(2));
	Q.Y = Axis.Y * Sin(Theta / float(2));
	Q.Z = Axis.Z * Sin(Theta / float(2));
	L = Sqrt((((Q.W ** float(2)) + (Q.X ** float(2))) + (Q.Y ** float(2))) + (Q.Z ** float(2)));
	Q.W /= L;
	Q.X /= L;
	Q.Y /= L;
	Q.Z /= L;
	return Q;
}

function Matrix3x3 QuatToMatrix(Quat Q)
{
	local Matrix3x3 M;
	local float W, X, Y, Z;

	W = Q.W;
	X = Q.X;
	Y = Q.Y;
	Z = Q.Z;
	M.a11 = (1 - (float(2) * (Y ** float(2)))) - (float(2) * (Z ** float(2)));
	M.a12 = ((2 * X) * Y) - ((float(2) * Z) * W);
	M.a13 = ((2 * X) * Z) + ((float(2) * Y) * W);
	M.a21 = ((2 * X) * Y) + ((float(2) * Z) * W);
	M.a22 = (1 - (float(2) * (X ** float(2)))) - (float(2) * (Z ** float(2)));
	M.a23 = ((2 * Y) * Z) - ((float(2) * X) * W);
	M.a31 = ((2 * X) * Z) - ((float(2) * Y) * W);
	M.a32 = ((2 * Y) * Z) + ((float(2) * X) * W);
	M.a33 = (1 - (float(2) * (X ** float(2)))) - (float(2) * (Y ** float(2)));
	return M;
}

function Matrix3x3 defMatrix9f(float a11, float a12, float a13, float a21, float a22, float a23, float a31, float a32, float a33)
{
	local Matrix3x3 theMatrix;

	theMatrix.a11 = a11;
	theMatrix.a12 = a12;
	theMatrix.a13 = a13;
	theMatrix.a21 = a21;
	theMatrix.a22 = a22;
	theMatrix.a23 = a23;
	theMatrix.a31 = a31;
	theMatrix.a32 = a32;
	theMatrix.a33 = a33;
	return theMatrix;
}

static final operator(16) Vector Multiply_Matrix3x3Vector(Matrix3x3 M, Vector V)
{
	local Vector Mv, R1, R2, R3;

	R1.X = M.a11;
	R1.Y = M.a12;
	R1.Z = M.a13;
	R2.X = M.a21;
	R2.Y = M.a22;
	R2.Z = M.a23;
	R3.X = M.a31;
	R3.Y = M.a32;
	R3.Z = M.a33;
	Mv.X = R1 Dot V;
	Mv.Y = R2 Dot V;
	Mv.Z = R3 Dot V;
	return Mv;
}

function Coords DipBasisRelative(float Theta, float Phi, Coords inBasis)
{
	local Matrix3x3 DipMatrix;
	local Coords transBasis;

	DipMatrix = defMatrix9f((sin2(Phi)) + ((cos2(Phi)) * Cos(Theta)), (-Sin(Phi) * Cos(Phi)) + ((Cos(Phi) * Sin(Phi)) * Cos(Theta)), Sin(Theta) * Cos(Phi), (-Cos(Phi) * Sin(Phi)) + ((Sin(Phi) * Cos(Phi)) * Cos(Theta)), (cos2(Phi)) + ((sin2(Phi)) * Cos(Theta)), Sin(Theta) * Sin(Phi), -Sin(Theta) * Cos(Phi), -Sin(Theta) * Sin(Phi), Cos(Theta));
	transBasis.XAxis = DipMatrix Multiply_Matrix3x3Vector inBasis.XAxis;
	transBasis.YAxis = DipMatrix Multiply_Matrix3x3Vector inBasis.YAxis;
	transBasis.ZAxis = DipMatrix Multiply_Matrix3x3Vector inBasis.ZAxis;
	return transBasis;
}

function Coords DipBasis(float Theta, float Phi)
{
	local Coords theBasis;

	theBasis.XAxis.X = (sin2(Phi)) + ((cos2(Phi)) * Cos(Theta));
	theBasis.XAxis.Y = (-Cos(Phi) * Sin(Phi)) + ((Sin(Phi) * Cos(Phi)) * Cos(Theta));
	theBasis.XAxis.Z = -Sin(Theta) * Cos(Phi);
	theBasis.YAxis.X = (-Sin(Phi) * Cos(Phi)) + ((Cos(Phi) * Sin(Phi)) * Cos(Theta));
	theBasis.YAxis.Y = (cos2(Phi)) + ((sin2(Phi)) * Cos(Theta));
	theBasis.YAxis.Z = -Sin(Theta) * Sin(Phi);
	theBasis.ZAxis.X = Sin(Theta) * Cos(Phi);
	theBasis.ZAxis.Y = Sin(Theta) * Sin(Phi);
	theBasis.ZAxis.Z = Cos(Theta);
	return theBasis;
}

function Vector changeBasis(Vector R, Vector e1B, Vector e2B, Vector e3B)
{
	local Matrix3x3 Q;

	Q = defMatrix9f(e1B.X, e2B.X, e3B.X, e1B.Y, e2B.Y, e3B.Y, e1B.Z, e2B.Z, e3B.Z);
	return Q Multiply_Matrix3x3Vector R;
}

function Coords defCoords(Vector O, Vector i, Vector j, Vector k)
{
	local Coords theCoords;

	theCoords.Origin = O;
	theCoords.XAxis = i;
	theCoords.YAxis = j;
	theCoords.ZAxis = k;
	return theCoords;
}

function Plane defPlane4f(float X, float Y, float Z, float W)
{
	local Plane planePi;

	planePi.X = X;
	planePi.Y = Y;
	planePi.Z = Z;
	planePi.W = W;
	return planePi;
}

function Plane defPlanevf(Vector N, float W)
{
	N = Normal(N);
	return defPlane4f(N.X, N.Y, N.Z, W);
}

function Vector PlaneNormal(Plane planePi)
{
	local Vector N;

	N.X = planePi.X;
	N.Y = planePi.Y;
	N.Z = planePi.Z;
	return N;
}

function Vector ProjectToPlane(Vector R, Vector V, Plane planePi)
{
	local float mu;


	if(((PlaneNormal(planePi)) Dot V) == float(0))
	{
		return R;
	}
	mu = (planePi.W - ((PlaneNormal(planePi)) Dot R)) / ((PlaneNormal(planePi)) Dot V);
	return R + (mu * V);
}

function Vector eVect(float X, float Y, float Z)
{
	local Vector V;

	V.X = X;
	V.Y = Y;
	V.Z = Z;
	return V;
}

function bool PutPreset_Square(out int Ns)
{
	local float A, B, rx, ry;

	A = PresetMetrics[0];
	B = PresetMetrics[1];
	rx = PresetMetrics[2];
	ry = PresetMetrics[3];

	if(A == float(0))
	{
		A = 1;
	}

	if(B == float(0))
	{
		B = 1;
	}
	ResetShape();
	ShapePoints[0] = eVect(rx, ry, 0);
	ShapePoints[1] = eVect(rx + A, ry, 0);
	ShapePoints[2] = eVect(rx + A, ry + B, 0);
	ShapePoints[3] = eVect(rx, ry + B, 0);
	Ns = 4;
	return true;
}

function bool PutPreset_Circle(out int Ns)
{
	local int i, Ofs, Sides, SidesUsed, iPush, iPartial;

	local float rx, ry, R;

	Sides = int(PresetMetrics[0]);
	SidesUsed = int(PresetMetrics[1]);

	if(Sides == 0)
	{
		Sides = 8;
	}

	if((SidesUsed == 0) || SidesUsed >= Sides)
	{
		SidesUsed = Sides;
	}
	else
	{
		iPartial = 1;
	}
	rx = PresetMetrics[2];
	ry = PresetMetrics[3];
	Ofs = int(bool(PresetMetrics[4]));
	R = 1;

	if(Ofs == 1)
	{
		R /= Cos(3.141593 / float(Sides));
	}

	if((!ClosedPath && SidesUsed > (Sides / 2)) && SidesUsed != Sides)
	{
		BadParameters("Partial circle may not be concave unless the path is looped.");
		return false;
	}
	ResetShape();

	if(!(SidesUsed == Sides) || SidesUsed == (Sides / 2))
	{
		iPush = 1;
		ShapePoints[0] = vect(0, 0, 0);
	}
	i = 0;
	J0x183:


	if(i < (SidesUsed + iPartial))
	{
		ShapePoints[i + iPush].X = rx + (R * Cos((((2 * float(i)) + float(Ofs)) * 3.141593) / float(Sides)));
		ShapePoints[i + iPush].Y = ry + (R * Sin((((2 * float(i)) + float(Ofs)) * 3.141593) / float(Sides)));
		++ i;

		goto J0x183;
	}
	Ns = (SidesUsed + iPartial) + iPush;
	return true;
}

function ResetShape()
{
	local int i;

	i = 0;
	J0x07:


	if(i < 16)
	{
		ShapePoints[i] = vect(0, 0, 0);
		++ i;

		goto J0x07;
	}
	return;
	return;
}

function Vertex3fC(float A, float B, float C, Coords Axes)
{
	Vertexv(((Axes.Origin + (A * Axes.XAxis)) + (B * Axes.YAxis)) + (C * Axes.ZAxis));
	return;
}

function float Sgn(float theValue)
{

	if(theValue == float(0))
	{
		return 0;
	}
	return theValue / Abs(theValue);
}

static final operator(18) float mod_FloatFloat(float A, float B)
{

	if((A % B) >= float(0))
	{
		return A % B;
	}
	else
	{
		return (A % B) + B;
	}
}

function float sin2(float Alpha)
{
	return Square(Sin(Alpha));
}

function float cos2(float Alpha)
{
	return Square(Cos(Alpha));
}

function float Rad2Deg(float theAngle)
{
	return (theAngle * 180) / 3.141593;
}

function float Deg2Rad(float theAngle)
{
	return (theAngle * 3.141593) / 180;
}

function bool SafePoly4i(int direction, int p0, int P1, int P2, int p3, optional name ItemName, optional int PolyFlags)
{

	if(isCoplanar4v(GetVertex(p0), GetVertex(P1), GetVertex(P2), GetVertex(p3)))
	{
		Poly4i(direction, p0, P1, P2, p3, ItemName, PolyFlags);
		return true;
	}
	else
	{
		Poly3i(direction, p0, P1, P2, ItemName, PolyFlags);
		Poly3i(direction, P2, p3, p0, ItemName, PolyFlags);
		return false;
	}
}

function DressTube(int Ofs, int LevelOfs, int Panels, int Levels, bool Looped, bool Closed, bool Triangulated, int Sgn, optional name ItemName, optional int PolyFlags)
{
	local int i, j, iPartial, iNonLooped, TrackJump;

	iPartial = int(!Closed);
	iNonLooped = int(!Looped);
	TrackJump = (Panels + iPartial) + LevelOfs;
	j = 0;
	J0x40:


	if(j < (Levels - iNonLooped))
	{
		i = 0;
		J0x5D:


		if(i < Panels)
		{

			if(!Triangulated)
			{
				SafePoly4i(Sgn, int(float(Ofs + (j * TrackJump)) + (float(i + 1) % float(Panels + iPartial))), int((float(Ofs) + ((float(j + 1) % float(Levels)) * float(TrackJump))) + (float(i + 1) % float(Panels + iPartial))), int((float(Ofs) + ((float(j + 1) % float(Levels)) * float(TrackJump))) + float(i)), (Ofs + (j * TrackJump)) + i, ItemName, PolyFlags);

				goto J0x296;
			}
			Poly3i(Sgn, int(float(Ofs + (j * TrackJump)) + (float(i + 1) % float(Panels + iPartial))), int((float(Ofs) + ((float(j + 1) % float(Levels)) * float(TrackJump))) + (float(i + 1) % float(Panels + iPartial))), (Ofs + (j * TrackJump)) + i, ItemName, PolyFlags);
			Poly3i(Sgn, int((float(Ofs) + ((float(j + 1) % float(Levels)) * float(TrackJump))) + (float(i + 1) % float(Panels + iPartial))), int((float(Ofs) + ((float(j + 1) % float(Levels)) * float(TrackJump))) + float(i)), (Ofs + (j * TrackJump)) + i, ItemName, PolyFlags);
			J0x296:

			++ i;

			goto J0x5D;
		}
		++ j;

		goto J0x40;
	}
	return;
	return;
}

function LogPoly4i(int direction, int p0, int P1, int P2, int p3, optional name ItemName, optional int PolyFlags)
{
	Poly4i(direction, p0, P1, P2, p3, ItemName, PolyFlags);
	Log((((((("poly:" $ string(p0)) $ ",") $ string(P1)) $ ",") $ string(P2)) $ ",") $ string(p3));
	return;
}

function LogPoly3i(int direction, int p0, int P1, int P2, optional name ItemName, optional int PolyFlags)
{
	Poly3i(direction, p0, P1, P2, ItemName, PolyFlags);
	Log((((("poly:" $ string(p0)) $ ",") $ string(P1)) $ ",") $ string(P2));
	return;
}

function bool isCoplanar4v(Vector r0, Vector R1, Vector R2, Vector R3)
{
	local Vector A, B, C;

	A = R1 - r0;
	B = R2 - r0;
	C = R3 - r0;

	if(((A Cross B) Dot C) == float(0))
	{
		return true;
	}
}

function bool isCoplanar4i(int i0, int i1, int i2, int i3)
{
	return isCoplanar4v(GetVertex(i0), GetVertex(i1), GetVertex(i2), GetVertex(i3));
}

function BuildPointy(Coords theBasis)
{
	local int N, i, j;
	local float S;

	N = GetVertexCount();
	S = ShapeFactor;
	Vertex3fC(0, 0, 0, theBasis);
	j = -1;
	J0x3C:


	if(j < 2)
	{
		i = -3;
		J0x53:


		if(i <= 3)
		{
			Vertex3fC(float(i) * S, float(j) * S, 0, theBasis);
			i += 2;

			goto J0x53;
		}
		i = -1;
		J0xA2:


		if(i <= 1)
		{
			Vertex3fC(float(i) * S, float(j * 3) * S, 0, theBasis);
			i += 2;

			goto J0xA2;
		}
		Vertex3fC(3 * S, (float(j) * 2.5) * S, 0, theBasis);
		j += 2;

		goto J0x3C;
	}
	Vertex3fC(0, 5 * S, 0, theBasis);
	Vertex3fC(9 * S, 0, 0, theBasis);
	Poly5i(1, N + 0, N + 9, N + 8, N + 1, N + 2, 'negX', 264);
	Poly5i(1, N + 0, N + 2, N + 5, N + 6, N + 3, 'negY', 264);
	Poly5i(1, N + 0, N + 3, N + 4, N + 11, N + 10, 'PosX', 264);
	Poly5i(1, N + 0, N + 10, N + 13, N + 12, N + 9, 'PosY', 264);
	Poly3i(1, N + 12, N + 13, N + 15, 'tipY', 264);
	Poly5i(1, N + 4, N + 7, N + 16, N + 14, N + 11, 'tipX', 264);
	return;
	return;
}

function Poly5i(int direction, int p0, int P1, int P2, int p3, int p4, optional name ItemName, optional int PolyFlags)
{
	PolyBegin(direction, ItemName, PolyFlags);
	Polyi(p0);
	Polyi(P1);
	Polyi(P2);
	Polyi(p3);
	Polyi(p4);
	PolyEnd();
	return;
	return;
}

function TarquinExtrudeBuilder.ECommandReturn CommandModule()
{
	local int i;


	if(_COMMAND == 3)
	{
		ResetShape();
		_COMMAND = C_None;
		return CR_Stop;
	}

	if(_COMMAND == 4)
	{
		i = 0;
		J0x38:


		if(i < 16)
		{
			PathPoints[i] = vect(0, 0, 0);
			++ i;

			goto J0x38;
		}
		_COMMAND = C_None;
		return CR_Stop;
	}

	if(_COMMAND == 2)
	{
		LevelsOnly = true;
		return CR_Continue;
	}

	if(_COMMAND == 5)
	{

		if(_Parameters[0] != float(0))
		{
			i = 0;
			J0xB3:


			if(i < 16)
			{
				ShapePoints[i].X *= _Parameters[0];
				++ i;

				goto J0xB3;
			}
		}

		if(_Parameters[1] != float(0))
		{
			i = 0;
			J0xF8:


			if(i < 16)
			{
				ShapePoints[i].Y *= _Parameters[1];
				++ i;

				goto J0xF8;
			}
		}
		CommandShowShape(NumNonZeroElements(ShapePoints));
		_COMMAND = C_None;
		return CR_BuildStop;
	}

	if(_COMMAND == 6)
	{
		i = 0;
		J0x15A:


		if(i < 16)
		{
			ShapePoints[i].X += _Parameters[0];
			ShapePoints[i].Y += _Parameters[1];
			++ i;

			goto J0x15A;
		}
		CommandShowShape(NumNonZeroElements(ShapePoints));
		_COMMAND = C_None;
		return CR_BuildStop;
	}

	if(_COMMAND == 7)
	{
		i = 0;
		J0x1D5:


		if(i < 16)
		{
			ShapePoints[i] = eVect((ShapePoints[i].X * Cos(Deg2Rad(_Parameters[0]))) - (ShapePoints[i].Y * Sin(Deg2Rad(_Parameters[0]))), (ShapePoints[i].X * Sin(Deg2Rad(_Parameters[0]))) + (ShapePoints[i].Y * Cos(Deg2Rad(_Parameters[0]))), 0);
			++ i;

			goto J0x1D5;
		}
		CommandShowShape(NumNonZeroElements(ShapePoints));
		_COMMAND = C_None;
		return CR_BuildStop;
	}

	if(_COMMAND == 8)
	{

		if(PathSource == 1)
		{
			i = 1;
			J0x2CD:


			if(i < (NumNonZeroElements(PathPoints)))
			{
				PathPoints[i] = PathPoints[i] + PathPoints[i - 1];
				++ i;

				goto J0x2CD;
			}
			PathSource = SO_Vect_Abs;
		}
		else
		{

			if(PathSource == 0)
			{
				i = (NumNonZeroElements(PathPoints)) - 1;
				J0x342:


				if(i > 0)
				{
					PathPoints[i] = PathPoints[i] - PathPoints[i - 1];
					-- i;

					goto J0x342;
				}
				PathSource = SO_Vect_Rel;
			}
			else
			{
				Log("C_ConvertPath did not understand the value of PathSource");
			}
		}
		_COMMAND = C_None;
		return CR_Stop;
	}

	if(_COMMAND == 9)
	{
		_COMMAND = C_None;
		return CommandMakeArc();
	}

	if(_COMMAND == 10)
	{
		CommandMakeMirror();
		_COMMAND = C_None;
		return CR_Continue;
	}
	BadParameters("command option not recognized");
	return CR_Stop;
}

function CommandShowShape(int Ns)
{
	local int i;

	BeginBrush(false, GroupName);
	PolyBegin(1, 'Sheet', 264);
	i = 0;
	J0x24:


	if(i < Ns)
	{
		Vertexv(ShapeFactor * ShapePoints[i]);
		Polyi(i);
		++ i;

		goto J0x24;
	}
	PolyEnd();
	return;
	return;
}

function TarquinExtrudeBuilder.ECommandReturn CommandMakeArc()
{
	local Vector StartRadius, EndRadius, Origin, StartApothem, EndApothem;

	local int N, i, Sides, Ofs;
	local float Alpha;

	N = NumNonZeroElements(PathPoints);

	if(N < 3)
	{
		BadParameters("Must have at least 3 path points to define an arc.");
		return CR_Stop;
	}

	if(_Parameters[0] != float(0))
	{
		Sides = int(_Parameters[0]);
	}
	else
	{
		Sides = 8;
	}
	Alpha = (2 * 3.141593) / float(Sides);

	if(_Parameters[1] == float(0))
	{
		BadParameters("MakeArc command: set the value of _Parameters[1] to the number of sides.");
		return CR_Stop;
	}

	if(PathSource == 1)
	{
		StartRadius = -PathPoints[N - 2];
		EndRadius = PathPoints[N - 1];
	}
	else
	{

		if(PathSource == 0)
		{
			StartRadius = PathPoints[N - 3] - PathPoints[N - 2];
			EndRadius = PathPoints[N - 1] - PathPoints[N - 2];
		}
		else
		{
			return CR_Stop;
		}
	}
	Origin = PathPoints[N - 2];

	if(_Parameters[2] != float(0))
	{
		Ofs = 1;
		StartApothem = StartRadius;
		EndApothem = EndRadius;
		StartRadius /= Cos(3.141593 / float(Sides));
		EndRadius /= Cos(3.141593 / float(Sides));
	}
	i = 1;
	J0x216:


	if(float(i) < (_Parameters[1] + float(1)))
	{
		PathPoints[(N - 3) + i] = ((StartRadius * Cos((float(i) * Alpha) - ((float(Ofs) * Alpha) * 0.5))) + (EndRadius * Sin((float(i) * Alpha) - ((float(Ofs) * Alpha) * 0.5)))) + Origin;
		Log((("i:" $ string(i)) $ ", pp: ") $ string((N - 3) + i));
		++ i;

		goto J0x216;
	}

	if(Ofs == 1)
	{
		PathPoints[(N - 3) + i] = ((StartApothem * Cos(float(i - 1) * Alpha)) + (EndApothem * Sin(float(i - 1) * Alpha))) + Origin;
	}
	return CR_Continue;
}

function CommandMakeMirror()
{
	local int i, N, Ofs;
	local Vector MirrorNormal;

	N = NumNonZeroElements(PathPoints);

	if(PathSource == 1)
	{
		MirrorNormal = Normal(PathPoints[N - 1]);
	}
	else
	{
		MirrorNormal = Normal(PathPoints[N - 1] - PathPoints[N - 2]);
	}

	if(_Parameters[0] == float(0))
	{
		Ofs = 1;
	}
	else
	{

		if(_Parameters[0] == float(2))
		{

			if(PathSource == 1)
			{
				PathPoints[N - 1] *= float(2);
			}
			else
			{
				PathPoints[N - 1] += (PathPoints[N - 1] - PathPoints[N - 2]);
			}
		}
	}
	i = 0;
	J0xE7:


	if(i < (N - 2))
	{
		PathPoints[(N + i) - Ofs] = ((float(2) * (PathPoints[(N - 2) - i] Dot MirrorNormal)) * MirrorNormal) - PathPoints[(N - 2) - i];
		Log("writing PP:" $ string(N + i));
		++ i;

		goto J0xE7;
	}

	if(PathSource == 0)
	{
		i = N - Ofs;
		J0x1A1:


		if(i < (((N + N) - 3) - Ofs))
		{
			PathPoints[i] = (PathPoints[i - 1] + PathPoints[i]) - PathPoints[i + 1];
			++ i;

			goto J0x1A1;
		}
		PathPoints[((N + N) - 3) - Ofs] = PathPoints[((N + N) - 4) - Ofs] + PathPoints[((N + N) - 3) - Ofs];
	}
	return;
	return;
}

function int GetShapeDirection(int Ns)
{
	local Vector RelativePoints[16];
	local Rotator VectorAngles[16];
	local float RelativeAngles[16], AngleSum;
	local int i;

	i = 1;
	J0x07:


	if(i < (Ns + 1))
	{
		RelativePoints[int(float(i) % float(Ns))] = ShapePoints[int(float(i) % float(Ns))] - ShapePoints[i - 1];
		Log((("v[" $ string(i)) $ "]=") $ string(RelativePoints[int(float(i) % float(Ns))]));
		++ i;

		goto J0x07;
	}
	i = 0;
	J0x9C:


	if(i < Ns)
	{
		VectorAngles[i] = rotator(RelativePoints[i]);
		Log("abs angles: " $ string(VectorAngles[i]));
		++ i;

		goto J0x9C;
	}
	i = 0;
	J0xF4:


	if(i < Ns)
	{
		RelativeAngles[i] = float(VectorAngles[i].Yaw - VectorAngles[int(float(i - 1) mod_FloatFloat float(Ns))].Yaw);
		RelativeAngles[i] = RelativeAngles[i] mod_FloatFloat 65536;

		if(RelativeAngles[i] >= (65536 / float(2)))
		{
			RelativeAngles[i] -= 65536;
		}
		Log("rel angles: " $ string(RelativeAngles[i]));
		++ i;

		goto J0xF4;
	}
	i = 1;
	J0x1C6:


	if(i < Ns)
	{

		if((Sgn(RelativeAngles[i - 1])) != (Sgn(RelativeAngles[i])))
		{
			BadParameters(("Your current shape is concave. " $ "This may cause problems with an extruded non-looped brush or ") $ "a disc made with the ShowShape command. ");
		}
		++ i;

		goto J0x1C6;
	}
	i = 0;
	J0x2A4:


	if(i < Ns)
	{
		AngleSum += RelativeAngles[i];
		++ i;

		goto J0x2A4;
	}
	Log("Angle Sum: " $ string(AngleSum));
	Log("Angle Sum mod: " $ string(AngleSum % 65536));
	return int(Sgn(AngleSum));
}

function int NumNonZeroElements(Vector VectorArray[16])
{
	local int i;

	i = 1;
	J0x07:


	if(i < 16)
	{

		if(VectorArray[i] == vect(0, 0, 0))
		{
			return i;
		}
		++ i;

		goto J0x07;
	}
	return 16;
}

function GetAngles(out float Theta, out float Phi, Coords theBasis, Vector vectorW)
{
	local Vector Wflat;

	vectorW = Normal(vectorW);

	if((vectorW Dot theBasis.ZAxis) == float(-1))
	{
		Log("vector dips directly down: bad!");
	}
	Theta = Acos(vectorW Dot theBasis.ZAxis);
	Wflat = ProjectToPlane(vectorW, theBasis.ZAxis, defPlanevf(theBasis.ZAxis, 0));

	if(Theta == float(0))
	{
		Phi = 0;
	}
	else
	{
		Phi = Acos(Normal(Wflat) Dot theBasis.XAxis);

		if((Normal(Wflat) Dot theBasis.YAxis) < float(0))
		{
			Phi = -Phi;
		}
	}
	Log("W=" $ string(vectorW));
	Log("Wflat=" $ string(Wflat));
	Log((((("[W]b =" $ string(vectorW Dot theBasis.XAxis)) $ ",") $ string(vectorW Dot theBasis.YAxis)) $ ",") $ string(vectorW Dot theBasis.ZAxis));
	Log((((("[Wf]b =" $ string(Wflat Dot theBasis.XAxis)) $ ",") $ string(Wflat Dot theBasis.YAxis)) $ ",") $ string(Wflat Dot theBasis.ZAxis));
	Log("Wflat dot Xaxis=" $ string(Wflat Dot theBasis.XAxis));
	Log((("Theta,Phi:" $ string(Rad2Deg(Theta))) $ ", ") $ string(Rad2Deg(Phi)));
	return;
	return;
}

function BuildTangential(Vector vectorS[16], int Ns, Vector vectorP[16], int Np, bool Looped)
{
	local int i, j;
	local float Theta, Phi;
	local Vector segmentL[16];
	local Plane CrossSection[16];
	local Plane Incident[16];
	local Coords StandardBasis;
	local array<Coords> Basis, ProjBasis;
	local Quat QuaternionRotation;
	local Matrix3x3 RotationMatrix;

	StandardBasis = defCoords(vect(0, 0, 0), vect(1, 0, 0), vect(0, 1, 0), vect(0, 0, 1));
	i = 0;
	J0x47:


	if(i < Np)
	{
		vectorP[i] *= PathFactor;
		++ i;

		goto J0x47;
	}
	i = 0;
	J0x79:


	if(i < Ns)
	{
		vectorS[i] *= ShapeFactor;
		++ i;

		goto J0x79;
	}

	if(PathSource == 1)
	{
		i = 1;
		J0xBB:


		if(i < Np)
		{
			vectorP[i] = vectorP[i] + vectorP[i - 1];
			++ i;

			goto J0xBB;
		}
	}
	i = 0;
	J0x102:


	if(i < Np)
	{
		segmentL[i] = vectorP[int(float(i + 1) % float(Np))] - vectorP[i];
		CrossSection[i] = defPlanevf(segmentL[i], 0);
		++ i;

		goto J0x102;
	}
	i = 0;
	J0x178:


	if(i < Np)
	{
		Incident[i] = defPlanevf(Normal(segmentL[int(float(i - 1) mod_FloatFloat float(Np))]) + Normal(segmentL[i]), 0);
		++ i;

		goto J0x178;
	}

	if(Maths == 0)
	{
		GetAngles(Theta, Phi, StandardBasis, segmentL[0]);
		Basis[0] = DipBasisRelative(Theta, Phi, StandardBasis);
		i = 1;
		J0x228:


		if(i < Np)
		{
			Log("-------- basis " $ string(i));
			GetAngles(Theta, Phi, Basis[i - 1], segmentL[i]);
			Basis[i] = DipBasis(Theta, Phi);
			Basis[i].XAxis = changeBasis(Basis[i].XAxis, Basis[i - 1].XAxis, Basis[i - 1].YAxis, Basis[i - 1].ZAxis);
			Basis[i].YAxis = changeBasis(Basis[i].YAxis, Basis[i - 1].XAxis, Basis[i - 1].YAxis, Basis[i - 1].ZAxis);
			Basis[i].ZAxis = changeBasis(Basis[i].ZAxis, Basis[i - 1].XAxis, Basis[i - 1].YAxis, Basis[i - 1].ZAxis);
			++ i;

			goto J0x228;
		}
	}
	else
	{
		GetAngles(Theta, Phi, StandardBasis, segmentL[0]);
		QuaternionRotation = RotationToQuat(vect(0, 0, 1) Cross segmentL[0], Theta);
		Basis[0] = DipBasisRelative(Theta, Phi, StandardBasis);
		i = 1;
		J0x42C:


		if(i < Np)
		{

			if(ExtrudeType == 1)
			{
				GetAngles(Theta, Phi, Basis[i - 1], segmentL[i]);
				QuaternionRotation = QuaternionRotation Multiply_QuatQuat (RotationToQuat(segmentL[i - 1] Cross segmentL[i], Theta));
				RotationMatrix = QuatToMatrix(QuaternionRotation);
			}
			else
			{

				if(ExtrudeType == 2)
				{
					GetAngles(Theta, Phi, Basis[0], segmentL[i]);
					RotationMatrix = QuatToMatrix(QuaternionRotation Multiply_QuatQuat (RotationToQuat(segmentL[0] Cross segmentL[i], Theta)));
				}
			}
			Basis[i].XAxis = RotationMatrix Multiply_Matrix3x3Vector StandardBasis.XAxis;
			Basis[i].YAxis = RotationMatrix Multiply_Matrix3x3Vector StandardBasis.YAxis;
			Basis[i].ZAxis = RotationMatrix Multiply_Matrix3x3Vector StandardBasis.ZAxis;
			++ i;

			goto J0x42C;
		}
	}
	i = 0;
	J0x5AA:


	if(i < Np)
	{
		ProjBasis[i].XAxis = ProjectToPlane(Basis[i].XAxis, Basis[i].ZAxis, Incident[i]);
		ProjBasis[i].YAxis = ProjectToPlane(Basis[i].YAxis, Basis[i].ZAxis, Incident[i]);
		ProjBasis[i].ZAxis = Basis[i].ZAxis;
		++ i;

		goto J0x5AA;
	}

	if(!Looped)
	{
		ProjBasis[0] = Basis[0];
		ProjBasis[Np - 1] = Basis[Np - 2];
		Log("first and last proj bases set for non-loop: 0, " $ string(Np - 1));
	}
	i = 0;
	J0x6E6:


	if(i < Np)
	{
		Log((("Basis X " $ string(i)) $ ": ") $ string(Basis[i].XAxis));
		Log((("Proj  X " $ string(i)) $ ": ") $ string(ProjBasis[i].XAxis));
		++ i;

		goto J0x6E6;
	}
	i = 0;
	J0x764:


	if(i < Np)
	{
		ProjBasis[i].Origin = vectorP[i];
		++ i;

		goto J0x764;
	}

	if(ShapeSource == 3)
	{
		i = 0;
		J0x7B0:


		if(i < Np)
		{
			Log("pointy:" $ string(ProjBasis[i].XAxis));
			BuildPointy(ProjBasis[i]);
			++ i;

			goto J0x7B0;
		}
	}
	else
	{
		j = 0;
		J0x803:


		if(j < (Np - int(InvisibleFinal)))
		{
			i = 0;
			J0x823:


			if(i < Ns)
			{

				if((j == 0) || ClosedPath && j == ((Np - int(InvisibleFinal)) - 1))
				{
					Vertex3fC(vectorS[i].X * (float(1) + (FRand() * RandomiserCaps.X)), vectorS[i].Y * (float(1) + (FRand() * RandomiserCaps.Y)), vectorS[i].Z + ((FRand() * RandomiserCaps.Z) * VSize(segmentL[j])), ProjBasis[j]);

					goto J0xA48;
				}

				if(!ClosedPath && j == ((Np - int(InvisibleFinal)) - 1))
				{
					Vertex3fC(vectorS[i].X * (float(1) + (FRand() * RandomiserCaps.X)), vectorS[i].Y * (float(1) + (FRand() * RandomiserCaps.Y)), vectorS[i].Z + ((FRand() * RandomiserCaps.Z) * VSize(segmentL[j - 1])), ProjBasis[j]);

					goto J0xA48;
				}
				Vertex3fC(vectorS[i].X * (float(1) + (FRand() * Randomiser.X)), vectorS[i].Y * (float(1) + (FRand() * Randomiser.Y)), vectorS[i].Z + ((FRand() * Randomiser.Z) * (VSize(segmentL[j - 1]) + VSize(segmentL[j]))), ProjBasis[j]);
				J0xA48:

				++ i;

				goto J0x823;
			}
			++ j;

			goto J0x803;
		}
	}
	return;
	return;
}

function bool Build()
{
	local int i, j, PolyDirection, NumShapePoints, NumPathPoints;

	local bool PresetOK;
	local TarquinExtrudeBuilder.ECommandReturn CommandReturn;

	LevelsOnly = false;

	if((_COMMAND != 0) && _COMMAND != 1)
	{
		CommandReturn = CommandModule();

		if(CommandReturn == 0)
		{
			return false;
		}

		if(CommandReturn == 1)
		{
			return EndBrush();
		}
	}
	PresetOK = true;

	if(ShapeSource == 1)
	{
		PresetOK = PutPreset_Square(NumShapePoints);
	}

	if(ShapeSource == 2)
	{
		PresetOK = PutPreset_Circle(NumShapePoints);
	}

	if(!PresetOK)
	{
		return false;
	}

	if(ShapeSource == 0)
	{
		NumShapePoints = NumNonZeroElements(ShapePoints);
	}

	if(_COMMAND == 1)
	{

		if(ShapeSource == 3)
		{
			return BadParameters("MrPointy doesn't like being revealed!" $ "Choose another shape source.");
		}
		CommandShowShape(NumShapePoints);
		return EndBrush();
	}
	NumPathPoints = NumNonZeroElements(PathPoints);
	Log("Num Shape=" $ string(NumShapePoints));
	Log("Num Path=" $ string(NumPathPoints));

	if(ShapeSource != 3)
	{

		if(SheetPolys && NumShapePoints < 2)
		{
			return BadParameters("A sheet extrusion must have at least 2 shape points.");
		}

		if(!SheetPolys && NumShapePoints < 3)
		{
			return BadParameters("Must have at least 3 shape points.");
		}
	}

	if(ClosedPath)
	{

		if(NumPathPoints < 3)
		{
			return BadParameters("A closed path must have at least 3 path points.");
		}

		if(InvisibleFinal)
		{
			return BadParameters("A closed path can't have Invisible Final option set.");
		}
	}
	else
	{

		if(NumPathPoints < (2 + int(InvisibleFinal)))
		{
			return BadParameters("Must have at least 2 path points.");
		}
	}
	i = 0;
	J0x31C:


	if(i < NumShapePoints)
	{
		j = 0;
		J0x332:


		if(j < NumShapePoints)
		{

			if((ShapePoints[i] == ShapePoints[j]) && i != j)
			{
				return BadParameters("Shape points must be distinct.");
			}
			++ j;

			goto J0x332;
		}
		++ i;

		goto J0x31C;
	}

	if(PathSource != 1)
	{
		i = 0;
		J0x3BF:


		if(i < NumPathPoints)
		{
			j = 0;
			J0x3D5:


			if(j < NumPathPoints)
			{

				if((PathPoints[i] == PathPoints[j]) && i != j)
				{
					return BadParameters("Path points must be distinct.");
				}
				++ j;

				goto J0x3D5;
			}
			++ i;

			goto J0x3BF;
		}
	}

	if(ShapeSource == 0)
	{
		PolyDirection = GetShapeDirection(NumShapePoints);
	}
	else
	{
		PolyDirection = 1;
	}
	BeginBrush(MergeCoplanars, GroupName);

	if(ExtrudeType == 0)
	{
		j = 0;
		J0x49D:


		if(j < NumPathPoints)
		{
			i = 0;
			J0x4B3:


			if(i < NumShapePoints)
			{
				Vertexv((ShapeFactor * ShapePoints[i]) + (PathFactor * PathPoints[j]));
				++ i;

				goto J0x4B3;
			}
			++ j;

			goto J0x49D;
		}		
	}
	else
	{

		if((ExtrudeType == 1) || ExtrudeType == 2)
		{
			BuildTangential(ShapePoints, NumShapePoints, PathPoints, NumPathPoints, ClosedPath);
		}
	}

	if((ShapeSource != 3) && LevelsOnly == false)
	{

		if(SheetPolys)
		{
			DressTube(0, 0, NumShapePoints, NumPathPoints - int(InvisibleFinal), ClosedPath, true, false, PolyDirection, 'Sides', 264);
		}
		else
		{
			DressTube(0, 0, NumShapePoints, NumPathPoints - int(InvisibleFinal), ClosedPath, true, false, PolyDirection, 'Sides');
		}

		if(!ClosedPath && !SheetPolys)
		{
			j = 0;
			J0x5F1:


			if(j < 2)
			{
				PolyBegin(((2 * j) - 1) * PolyDirection, 'Cap');
				i = 0;
				J0x622:


				if(i < NumShapePoints)
				{
					Polyi(((j * ((NumPathPoints - 1) - int(InvisibleFinal))) * NumShapePoints) + i);
					++ i;

					goto J0x622;
				}
				PolyEnd();
				++ j;

				goto J0x5F1;
			}
		}
	}

	if((ShapeSource != 3) && LevelsOnly == true)
	{
		j = 0;
		J0x69D:


		if(j < NumPathPoints)
		{
			PolyBegin(1, 'Level', 264);
			i = 0;
			J0x6C4:


			if(i < NumShapePoints)
			{
				Polyi((j * NumShapePoints) + i);
				++ i;

				goto J0x6C4;
			}
			PolyEnd();
			++ j;

			goto J0x69D;
		}
	}
	Log("vertices built:" $ string(GetVertexCount()));
	return EndBrush();
}

defaultproperties
{
	ShapeFactor=64
	PathFactor=64
	ExtrudeType=1
	ShapeSource=1
	MergeCoplanars=true
	Maths=1
	GroupName=Extrude
	BitmapFilename="BBTarquinExtrude"
	ToolTip="Tarquin's Extrude Builder"
}