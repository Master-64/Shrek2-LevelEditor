//=============================================================================
// DaidTerrainBuilder: Randomly builds a terrain brush
// Credits to Daid for the original brush builder
// Ported to UE2 by Master_64
//=============================================================================
class DaidTunnelBuilder extends BrushBuilder;

var() float Height;
var() float OuterRadius;
var() int Sides;
var() int StepsNum;
var() name GroupName;
var() bool MergeCoplanars;
var() int RandXExtra;
var() int RandYExtra;

function BuildCylinder(int Direction, int Sides, float Height, float Radius, int Steps)
{
	local int i, j;

	j = 0;
	J0x07:


	if(j < (Steps + 1))
	{
		i = 0;
		J0x20:


		if(i < Sides)
		{
			Vertex3f(Radius * Sin(2.0 * i * Pi / Sides) + RandRange( -RandXExtra,RandXExtra),Radius * Cos(2.0 * i * Pi / Sides) + RandRange( -RandYExtra,RandYExtra),j * Height / 2);
			++ i;

			goto J0x20;
		}
		++ j;

		goto J0x07;
	}
	j = 0;
	J0xD2:


	if(j < Steps)
	{
		i = 0;
		J0xE8:


		if(i < Sides)
		{

			if((i + 1) == Sides)
			{
				Poly3i(Direction, ((i - Sides) + 1) + (j * Sides), i + (j * Sides), (i + Sides) + (j * Sides), 'Wall');
				Poly3i(Direction, (i + 1) + (j * Sides), ((i - Sides) + 1) + (j * Sides), (i + Sides) + (j * Sides), 'Wall');

				goto J0x273;
			}
			Poly3i(Direction, (i + 1) + (j * Sides), i + (j * Sides), (i + Sides) + (j * Sides), 'Wall');
			Poly3i(Direction, ((i + Sides) + 1) + (j * Sides), (i + 1) + (j * Sides), (i + Sides) + (j * Sides), 'Wall');
			J0x273:

			++ i;

			goto J0xE8;
		}
		++ j;

		goto J0xD2;
	}
	return;
}

function bool Build()
{
	local int i, j, k;


	if(Sides < 3)
	{
		return BadParameters();
	}

	if((Height <= float(0)) || OuterRadius <= float(0))
	{
		return BadParameters();
	}
	BeginBrush(MergeCoplanars, GroupName);
	BuildCylinder(1, Sides, Height, OuterRadius, StepsNum);
	PolyBegin(1, 'Cap');
	i = 0;
	J0x73:


	if(i < Sides)
	{
		Polyi(i);
		++ i;

		goto J0x73;
	}
	PolyEnd();
	PolyBegin(-1, 'Cap');
	i = 0;
	J0xB4:


	if(i < Sides)
	{
		Polyi((Sides * StepsNum) + i);
		++ i;

		goto J0xB4;
	}
	PolyEnd();
	return EndBrush();
}

defaultproperties
{
	Height=128
	OuterRadius=128
	Sides=8
	StepsNum=4
	GroupName=RandomTunnel
	MergeCoplanars=true
	RandXExtra=32
	RandYExtra=32
	BitmapFilename="BBRandomTunnel"
	ToolTip="Daid's Random Tunnel"
}