//=============================================================================
// MaxGBeveledCylinderBuilder: Builds a beveled cylinder brush.
// Credits to MaxG for the original brush builder
// Ported to UE2 by Master_64
//=============================================================================
class MaxGBeveledCylinderBuilder extends BrushBuilder;

var() float Height;
var() float BottomWidth, BottomBreadth;
var() float CapWidth, CapBreadth;

var() int Sides;
var() name GroupName;
var() bool AlignToSide;

function BuildCylinder( int Direction, bool AlignToSide, int Sides, float Height, float BottomWidth, float BottomBreadth, float CapWidth, float CapBreadth )
{
	local int n,i,j,q,Ofs, bottom_left, top_left, bottom_right, top_right;

	if( AlignToSide )
	{
		BottomWidth /= cos(pi / Sides);
		BottomBreadth /= cos(pi / Sides);
		CapWidth /= cos(pi / Sides);
		CapBreadth /= cos(pi / Sides);
		Ofs = 1;
	}

	BottomWidth /= 2.0;
	BottomBreadth /= 2.0;
	CapWidth /= 2.0;
	CapBreadth /= 2.0;

	for (i = 0; i < Sides; i += 1 )
	{
		Vertex3f( BottomWidth * sin((2 * i + Ofs) * pi / Sides), BottomBreadth * cos((2 * i + Ofs) * pi / Sides), 0 );
	}

	for (i = 0; i < Sides; i += 1 )
	{
		Vertex3f( CapWidth * sin((2 * i + Ofs) * pi / Sides), CapBreadth * cos((2 * i + Ofs) * pi / Sides), Height );
	}

	n = GetVertexCount();

	for ( i = 0; i < (n / 2); i += 1 )
	{
		bottom_left = i;
		top_left = i + (n / 2);
		bottom_right = (i + 1) % (n / 2);
		top_right = ( (top_left + 1) % (n / 2) ) + (n / 2);

		Poly3i(Direction, bottom_left, top_left, bottom_right, 'Wall');
		
		Poly3i(Direction, top_left, top_right, bottom_right, 'Wall');
	}
}

function bool Build()
{
	local int i, j, k, n;

	if( Sides < 3 )
		return BadParameters();

	if ( FMin(BottomBreadth, BottomWidth) <= 0 || FMin(CapBreadth, CapWidth) <= 0 )
	{
		return BadParameters();
	}

	BeginBrush( false, GroupName );

	BuildCylinder( +1, AlignToSide, Sides, Height, BottomWidth, BottomBreadth, CapWidth, CapBreadth);

	n = GetVertexCount();

	PolyBegin(1, 'Bottom');
	for (i = 0; i < (n / 2); i++)
	{
		Polyi(i);
	}
	PolyEnd();

	PolyBegin(-1, 'Cap');
	for (i = (n / 2); i < n; i++)
	{
		Polyi(i);
	}
	PolyEnd();
	
	return EndBrush();
}

event ResetBuilder()
{	
	// Reset everything to default
	Height			= default.Height;
	Sides			= default.Sides;
	AlignToSide		= default.AlignToSide;
	BottomBreadth = default.BottomBreadth;
	BottomWidth = default.BottomWidth;
	CapBreadth = default.CapBreadth;
	CapWidth = default.CapWidth;
}

defaultproperties
{
	Height=256
	BottomBreadth=256
	BottomWidth=256
	CapBreadth=128
	CapWidth=128
	Sides=8
	GroupName=BeveledCylinder
	AlignToSide=true
	BitmapFilename="BBBeveledCylinder"
	ToolTip="MaxG's Beveled Cylinder"
}
