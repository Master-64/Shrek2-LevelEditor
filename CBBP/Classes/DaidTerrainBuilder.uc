//=============================================================================
// DaidTerrainBuilder: Randomly builds a terrain brush
// Credits to Daid for the original brush builder
// Ported to UE2 by Master_64
//=============================================================================
class DaidTerrainBuilder extends BrushBuilder;

enum EBrushType
{
	BT_Sub,
	BT_Add
};

var() float Height;
var() float Width;
var() float Breadth;
var() int WidthSegments;
var() int DepthSegments;
var() name GroupName;
var() int MinRandomExtra;
var() int MaxRandomExtra;
var() int RandXExtra;
var() int RandYExtra;
var() bool MergeCoplanars;
var() DaidTerrainBuilder.EBrushType BrushType;

function BuildTerrainSub(int Direction, float dx, float dy, float dz, int WidthSeg, int DepthSeg)
{
	local int N, nbottom, i, j, k, X,
		Y, idx;

	local float WidthStep, DepthStep;
	local int ExtraDist;

	N = GetVertexCount();
	i = -1;
	J0x17:


	if(i < 2)
	{
		j = -1;
		J0x2E:


		if(j < 2)
		{
			k = -1;
			J0x45:


			if(k < 2)
			{
				Vertex3f((float(i) * dx) / float(2), (float(j) * dy) / float(2), (float(k) * dz) / float(2));
				k += 2;

				goto J0x45;
			}
			j += 2;

			goto J0x2E;
		}
		i += 2;

		goto J0x17;
	}
	Poly3i(Direction, N + 3, N + 1, N + 5, 'sky');
	Poly3i(Direction, N + 3, N + 5, N + 7, 'sky');
	Poly3i(Direction, N + 0, N + 1, N + 3, 'sky');
	Poly3i(Direction, N + 2, N + 3, N + 7, 'sky');
	Poly3i(Direction, N + 6, N + 7, N + 5, 'sky');
	Poly3i(Direction, N + 4, N + 5, N + 1, 'sky');
	nbottom = GetVertexCount();
	WidthStep = dx / float(WidthSeg);
	DepthStep = dy / float(DepthSeg);
	X = 0;
	J0x1E8:


	if(X < (WidthSeg + 1))
	{
		Y = 0;
		J0x201:


		if(Y < (DepthSeg + 1))
		{

			if((((X == 0) || Y == 0) || X == WidthSeg) || Y == DepthSeg)
			{
				Vertex3f((WidthStep * float(X)) - (dx / float(2)), (DepthStep * float(Y)) - (dy / float(2)), -dz / float(2));

				goto J0x30F;
			}
			Vertex3f(WidthStep * X - dx / 2 + RandRange( -RandXExtra,RandXExtra),DepthStep * Y - dy / 2 + RandRange( -RandYExtra,RandYExtra), -dz / 2 + RandRange(MinRandomExtra,MaxRandomExtra));
			J0x30F:

			++ Y;

			goto J0x201;
		}
		++ X;

		goto J0x1E8;
	}
	X = 0;
	J0x32A:


	if(X < WidthSeg)
	{
		Y = 0;
		J0x340:


		if(Y < DepthSeg)
		{
			Poly3i(-Direction, (nbottom + Y) + ((DepthSeg + 1) * X), (nbottom + Y) + ((DepthSeg + 1) * (X + 1)), ((nbottom + 1) + Y) + ((DepthSeg + 1) * (X + 1)), 'ground');
			Poly3i(-Direction, (nbottom + Y) + ((DepthSeg + 1) * X), ((nbottom + 1) + Y) + ((DepthSeg + 1) * (X + 1)), ((nbottom + 1) + Y) + ((DepthSeg + 1) * X), 'ground');
			++ Y;

			goto J0x340;
		}
		++ X;

		goto J0x32A;
	}
	X = 0;
	J0x44E:


	if(X < WidthSeg)
	{
		Poly3i(-Direction, N + 7, (nbottom + DepthSeg) + ((DepthSeg + 1) * X), (nbottom + DepthSeg) + ((DepthSeg + 1) * (X + 1)), 'sky');
		Poly3i(-Direction, N + 1, nbottom + ((DepthSeg + 1) * (X + 1)), nbottom + ((DepthSeg + 1) * X), 'sky');
		++ X;

		goto J0x44E;
	}
	Y = 0;
	J0x50F:


	if(Y < DepthSeg)
	{
		Poly3i(-Direction, N + 3, nbottom + Y, nbottom + (Y + 1), 'sky');
		Poly3i(-Direction, N + 5, (nbottom + ((DepthSeg + 1) * WidthSeg)) + (Y + 1), (nbottom + ((DepthSeg + 1) * WidthSeg)) + Y, 'sky');
		++ Y;

		goto J0x50F;
	}
	return;
}

function BuildTerrainAdd(int Direction, float dx, float dy, float dz, int WidthSeg, int DepthSeg)
{
	local int N, nbottom, i, j, k, X,
		Y, idx;

	local float WidthStep, DepthStep;
	local int ExtraDist;

	N = GetVertexCount();
	i = -1;
	J0x17:


	if(i < 2)
	{
		j = -1;
		J0x2E:


		if(j < 2)
		{
			k = -1;
			J0x45:


			if(k < 2)
			{
				Vertex3f((float(i) * dx) / float(2), (float(j) * dy) / float(2), -(float(k) * dz) / float(2));
				k += 2;

				goto J0x45;
			}
			j += 2;

			goto J0x2E;
		}
		i += 2;

		goto J0x17;
	}
	Poly3i(Direction, N + 3, N + 1, N + 5, 'sky');
	Poly3i(Direction, N + 3, N + 5, N + 7, 'sky');
	Poly3i(Direction, N + 0, N + 1, N + 3, 'sky');
	Poly3i(Direction, N + 2, N + 3, N + 7, 'sky');
	Poly3i(Direction, N + 6, N + 7, N + 5, 'sky');
	Poly3i(Direction, N + 4, N + 5, N + 1, 'sky');
	nbottom = GetVertexCount();
	WidthStep = dx / float(WidthSeg);
	DepthStep = dy / float(DepthSeg);
	X = 0;
	J0x1EA:


	if(X < (WidthSeg + 1))
	{
		Y = 0;
		J0x203:


		if(Y < (DepthSeg + 1))
		{

			if((((X == 0) || Y == 0) || X == WidthSeg) || Y == DepthSeg)
			{
				Vertex3f((WidthStep * float(X)) - (dx / float(2)), (DepthStep * float(Y)) - (dy / float(2)), dz / float(2));

				goto J0x30D;
			}
			Vertex3f(WidthStep * X - dx / 2 + RandRange( -RandXExtra,RandXExtra),DepthStep * Y - dy / 2 + RandRange( -RandYExtra,RandYExtra),dz / 2 + RandRange(MinRandomExtra,MaxRandomExtra));
			J0x30D:

			++ Y;

			goto J0x203;
		}
		++ X;

		goto J0x1EA;
	}
	X = 0;
	J0x328:


	if(X < WidthSeg)
	{
		Y = 0;
		J0x33E:


		if(Y < DepthSeg)
		{
			Poly3i(-Direction, (nbottom + Y) + ((DepthSeg + 1) * X), (nbottom + Y) + ((DepthSeg + 1) * (X + 1)), ((nbottom + 1) + Y) + ((DepthSeg + 1) * (X + 1)), 'ground');
			Poly3i(-Direction, (nbottom + Y) + ((DepthSeg + 1) * X), ((nbottom + 1) + Y) + ((DepthSeg + 1) * (X + 1)), ((nbottom + 1) + Y) + ((DepthSeg + 1) * X), 'ground');
			++ Y;

			goto J0x33E;
		}
		++ X;

		goto J0x328;
	}
	X = 0;
	J0x44C:


	if(X < WidthSeg)
	{
		Poly3i(-Direction, N + 7, (nbottom + DepthSeg) + ((DepthSeg + 1) * X), (nbottom + DepthSeg) + ((DepthSeg + 1) * (X + 1)), 'sky');
		Poly3i(-Direction, N + 1, nbottom + ((DepthSeg + 1) * (X + 1)), nbottom + ((DepthSeg + 1) * X), 'sky');
		++ X;

		goto J0x44C;
	}
	Y = 0;
	J0x50D:


	if(Y < DepthSeg)
	{
		Poly3i(-Direction, N + 3, nbottom + Y, nbottom + (Y + 1), 'sky');
		Poly3i(-Direction, N + 5, (nbottom + ((DepthSeg + 1) * WidthSeg)) + (Y + 1), (nbottom + ((DepthSeg + 1) * WidthSeg)) + Y, 'sky');
		++ Y;

		goto J0x50D;
	}
	return;
}

event bool Build()
{
	local int TmpInt;


	if(((((Height <= float(0)) || Width <= float(0)) || Breadth <= float(0)) || WidthSegments <= 0) || DepthSegments <= 0)
	{
		return BadParameters();
	}

	if(MinRandomExtra > MaxRandomExtra)
	{
		BadParameters("MinRandomExtra must be lower then MaxRandomExtra. Switching Max and Min. (Min and max can be lower than 0)");
		TmpInt = MinRandomExtra;
		MinRandomExtra = MaxRandomExtra;
		MaxRandomExtra = TmpInt;
	}

	if(RandXExtra < 0)
	{
		return BadParameters("RandXExtra can't be lower than 0");
	}

	if(RandYExtra < 0)
	{
		return BadParameters("RandYExtra can't be lower than 0");
	}
	BeginBrush(MergeCoplanars, GroupName);

	if(BrushType == 0)
	{
		BuildTerrainSub(1, Breadth, Width, Height, WidthSegments, DepthSegments);
	}
	else
	{
		BuildTerrainAdd(-1, Breadth, Width, Height, WidthSegments, DepthSegments);
	}
	return EndBrush();
}

defaultproperties
{
	Height=256
	Width=1024
	Breadth=1024
	WidthSegments=8
	DepthSegments=8
	GroupName=RandomTerrain
	MinRandomExtra=-256
	MaxRandomExtra=-128
	RandXExtra=32
	RandYExtra=32
	MergeCoplanars=true
	BitmapFilename="BBRandomTerrain"
	ToolTip="Daid's Random Terrain"
}