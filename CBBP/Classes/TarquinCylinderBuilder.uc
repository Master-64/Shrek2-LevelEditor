//=============================================================================
// TarquinCylinderBrush: Builds a cylinder but that has a wedge cut out of it
// Credits to Tarquin for the original brush builder
// Ported to UE2 by Master_64
//=============================================================================
class TarquinCylinderBuilder extends BrushBuilder;

enum EAlignStyle
{
	AL_Plain,
	AL_Side,
	AL_Caps
};

var() float Height;
var() float OuterRadius;
var() float InnerRadius;
var() int Sides;
var() int SidesUsed;
var() bool Hollow;
var() bool TriangulateCaps;
var() TarquinCylinderBuilder.EAlignStyle AlignType;
var() name GroupName;

function BuildCirclet(int sgn, TarquinCylinderBuilder.EAlignStyle Align, int Sides, int Panels, float Height, float Radius, name item, bool Complete)
{
	local int N, i, j, Ofs;
	local float NonApothem;

	N = GetVertexCount();

	if(Complete)
	{

		if(Align != 0)
		{
			Radius /= Cos(3.141593 / float(Sides));
			Ofs = 1;
		}
		j = -1;
		J0x4E:


		if(j < 2)
		{
			i = 0;
			J0x61:


			if(i < Panels)
			{
				Vertex3f(Radius * Cos((((2 * float(i)) + float(Ofs)) * 3.141593) / float(Sides)), Radius * Sin((((2 * float(i)) + float(Ofs)) * 3.141593) / float(Sides)), (float(j) * Height) / float(2));
				++ i;

				goto J0x61;
			}
			j += 2;

			goto J0x4E;
		}		
	}
	else
	{

		if(Align != 2)
		{

			if(Align == 1)
			{
				Radius /= Cos(3.141593 / float(Sides));
				Ofs = 1;
			}
			j = -1;
			J0x14C:


			if(j < 2)
			{
				i = 0;
				J0x15F:


				if(i < (Panels + 1))
				{
					Vertex3f(Radius * Cos((((2 * float(i)) + float(Ofs)) * 3.141593) / float(Sides)), Radius * Sin((((2 * float(i)) + float(Ofs)) * 3.141593) / float(Sides)), (float(j) * Height) / float(2));
					++ i;

					goto J0x15F;
				}
				j += 2;

				goto J0x14C;
			}			
		}
		else
		{
			j = -1;
			J0x20F:


			if(j < 2)
			{
				NonApothem = Radius / Cos(3.141593 / float(Sides));
				Vertex3f(Radius, 0, (float(j) * Height) / float(2));
				i = 1;
				J0x263:


				if(i < Panels)
				{
					Vertex3f(NonApothem * Cos((((2 * float(i)) - float(1)) * 3.141593) / float(Sides)), NonApothem * Sin((((2 * float(i)) - float(1)) * 3.141593) / float(Sides)), (float(j) * Height) / float(2));
					++ i;

					goto J0x263;
				}
				Vertex3f(Radius * Cos(((2 * float(Panels - 1)) * 3.141593) / float(Sides)), Radius * Sin(((2 * float(Panels - 1)) * 3.141593) / float(Sides)), (float(j) * Height) / float(2));
				j += 2;

				goto J0x20F;
			}
		}
	}

	if(Complete)
	{
		i = 0;
		J0x378:


		if(i < Panels)
		{
			Poly4i(sgn, N + i, int(float(N) + (float(i + 1) % float(Sides))), int(float(N + Panels) + (float(i + 1) % float(Sides))), (N + Panels) + i, item);
			++ i;

			goto J0x378;
		}		
	}
	else
	{

		if(Align == 2)
		{
			i = 0;
			J0x41D:


			if(i < Panels)
			{
				Poly4i(sgn, N + i, N + (i + 1), ((N + Panels) + 1) + (i + 1), ((N + Panels) + 1) + i, item);
				++ i;

				goto J0x41D;
			}
		}
		else
		{
			i = 0;
			J0x49A:


			if(i < Panels)
			{
				Poly4i(sgn, N + i, int(float(N) + (float(i + 1) % float(Sides))), int(float((N + Panels) + 1) + (float(i + 1) % float(Sides))), ((N + Panels) + 1) + i, item);
				++ i;

				goto J0x49A;
			}
		}
	}
	return;
}

function bool Build()
{
	local int i, j, N, InnerPanels, OuterPanels, PoleS;

	local TarquinCylinderBuilder.EAlignStyle InnerAlign, OuterAlign;
	local bool Complete;


	if(Sides < 3)
	{
		return BadParameters("Must have at least 3 sides.");
	}

	if((Height <= float(0)) || OuterRadius <= float(0))
	{
		return BadParameters("Dimensions must be positive.");
	}

	if(Hollow && InnerRadius >= OuterRadius)
	{
		return BadParameters("OuterRadius must be greater than InnerRadius.");
	}

	if(Hollow && InnerRadius <= float(0))
	{
		return BadParameters("InnerRadius must be positive.");
	}
	InnerAlign = AlignType;
	OuterAlign = AlignType;

	if((SidesUsed >= Sides) || SidesUsed == 0)
	{
		InnerPanels = Sides;
		OuterPanels = Sides;
		Complete = true;
	}
	else
	{
		InnerPanels = SidesUsed;
		OuterPanels = SidesUsed;

		if(InnerAlign == 2)
		{
			++ InnerPanels;
		}

		if(OuterAlign == 2)
		{
			++ OuterPanels;
		}
	}
	BeginBrush(false, GroupName);
	N = GetVertexCount();
	BuildCirclet(1, OuterAlign, Sides, OuterPanels, Height, OuterRadius, 'outerwall', Complete);

	if(Hollow)
	{
		BuildCirclet(-1, InnerAlign, Sides, InnerPanels, Height, InnerRadius, 'innerwall', Complete);
	}

	if(!Hollow && TriangulateCaps || !Complete && !TriangulateCaps && SidesUsed == (Sides / 2))
	{
		PoleS = GetVertexCount();
		Vertex3f(0, 0, -Height / float(2));
		Vertex3f(0, 0, Height / float(2));
	}

	if(!Hollow && Complete)
	{

		if(TriangulateCaps)
		{
			j = 0;
			J0x2C2:


			if(j < 2)
			{
				i = 0;
				J0x2D5:


				if(i < OuterPanels)
				{
					Poly3i((-2 * j) + 1, (j * OuterPanels) + i, PoleS + j, int(float(j * OuterPanels) + (float(i + 1) % float(OuterPanels))), 'Cap');
					++ i;

					goto J0x2D5;
				}
				++ j;

				goto J0x2C2;
			}
		}
		else
		{
			j = 0;
			J0x360:


			if(j < 2)
			{
				PolyBegin((2 * j) - 1, 'Cap');
				i = 0;
				J0x38A:


				if(i < Sides)
				{
					Polyi((j * Sides) + i);
					++ i;

					goto J0x38A;
				}
				PolyEnd();
				++ j;

				goto J0x360;
			}
		}
	}
	else
	{

		if(!Hollow)
		{

			if(TriangulateCaps || SidesUsed > (Sides / 2))
			{
				j = 0;
				J0x3FF:


				if(j < 2)
				{
					i = 0;
					J0x412:


					if(i < OuterPanels)
					{
						Poly3i((-2 * j) + 1, (j * (OuterPanels + 1)) + i, PoleS + j, ((j * (OuterPanels + 1)) + i) + 1, 'Cap');
						++ i;

						goto J0x412;
					}
					++ j;

					goto J0x3FF;
				}
			}
			else
			{
				j = 0;
				J0x494:


				if(j < 2)
				{
					PolyBegin((2 * j) - 1, 'Cap');
					i = 0;
					J0x4BE:


					if(i < (OuterPanels + 1))
					{
						Polyi((j * (OuterPanels + 1)) + i);
						++ i;

						goto J0x4BE;
					}

					if(TriangulateCaps || SidesUsed != (Sides / 2))
					{
						Polyi(PoleS + j);
					}
					PolyEnd();
					++ j;

					goto J0x494;
				}
			}

			if(!TriangulateCaps && SidesUsed == (Sides / 2))
			{
				Poly4i(1, 0, (OuterPanels + 1) + 0, (2 * OuterPanels) + 1, OuterPanels, 'End');
			}
			else
			{
				Poly4i(1, 0, (OuterPanels + 1) + 0, PoleS + 1, PoleS, 'End');
				Poly4i(-1, OuterPanels, (2 * OuterPanels) + 1, PoleS + 1, PoleS, 'End');
			}
		}
		else
		{

			if(!Complete)
			{
				j = 0;
				J0x5EA:


				if(j < 2)
				{
					i = 0;
					J0x5FD:


					if(i < OuterPanels)
					{
						Poly4i((-2 * j) + 1, ((j * (OuterPanels + 1)) + i) + 1, (j * (OuterPanels + 1)) + i, ((2 * (OuterPanels + 1)) + (j * (OuterPanels + 1))) + i, (((2 * (OuterPanels + 1)) + (j * (OuterPanels + 1))) + i) + 1, 'Cap');
						++ i;

						goto J0x5FD;
					}
					++ j;

					goto J0x5EA;
				}
				Poly4i(1, 0, OuterPanels + 1, 3 * (OuterPanels + 1), 2 * (OuterPanels + 1), 'End');
				Poly4i(1, (3 * (OuterPanels + 1)) - 1, (4 * (OuterPanels + 1)) - 1, (2 * (OuterPanels + 1)) - 1, (1 * (OuterPanels + 1)) - 1, 'End');
			}
			else
			{
				j = 0;
				J0x732:


				if(j < 2)
				{
					i = 0;
					J0x745:


					if(i < OuterPanels)
					{
						Poly4i((-2 * j) + 1, int(float(j * OuterPanels) + (float(i + 1) % float(OuterPanels))), (j * OuterPanels) + i, ((2 * OuterPanels) + (j * OuterPanels)) + i, int(float((2 * OuterPanels) + (j * OuterPanels)) + (float(i + 1) % float(OuterPanels))), 'Cap');
						++ i;

						goto J0x745;
					}
					++ j;

					goto J0x732;
				}
			}
		}
	}
	return EndBrush();
}

defaultproperties
{
	Height=256
	OuterRadius=256
	InnerRadius=128
	Sides=8
	GroupName=Cylinder
	BitmapFilename="BBTarquinCylinder"
	ToolTip="Tarquin's Partial Cylinder"
}