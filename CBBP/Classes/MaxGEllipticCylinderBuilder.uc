//=============================================================================
// MaxGEllipticCylinderBuilder: Builds an elliptic cylinder brush.
// Credits to MaxG for the original brush builder
// Ported to UE2 by Master_64
//=============================================================================
class MaxGEllipticCylinderBuilder extends BrushBuilder;

var() float Height, OuterWidth, OuterBreadth, InnerWidth, InnerBreadth;
var() int Sides;
var() name GroupName;
var() bool AlignToSide, Hollow;

function BuildCylinder( int Direction, bool AlignToSide, int Sides, float Height, float Width, float Breadth )
{
	local int n,i,j,q,Ofs;
	n = GetVertexCount();
	if( AlignToSide )
	{
		Width /= cos(pi / Sides);
		Breadth /= cos(pi / Sides);
		Ofs = 1;
	}

	// MaxG: Convert from radius.
	Width /= 2;
	Breadth /= 2;

	// Vertices.
	for( i = 0; i < Sides; i++ )
		for( j= -1; j < 2; j += 2 )
			Vertex3f( Width * sin((2 * i + Ofs) * pi / Sides), Breadth * cos((2 * i + Ofs) * pi / Sides), (j * Height / 2 ));

	// Polys.
	for( i = 0; i < Sides; i++ )
		Poly4i( Direction, n + i * 2, n + i * 2 + 1, n + ( (i * 2 + 3) % (2 * Sides) ), n + ( (i * 2 + 2) % (2 * Sides)), 'Wall' );
}

function bool Build()
{
	local int i,j,k;

	if (Sides < 3)
	{
		return BadParameters();
	}

	if (Height <= 0 || FMin(OuterWidth, OuterBreadth) <= 0)
	{
		return BadParameters();
	}

	if (Hollow)
	{
		if ( FMin(InnerBreadth, InnerWidth) <= 0 )
		{
			return BadParameters();
		}

		if ( FMax(InnerBreadth, InnerWidth) >= FMin(OuterWidth, OuterBreadth) )
		{
			return BadParameters();
		}
	}

	BeginBrush( false, GroupName );
	BuildCylinder( +1, AlignToSide, Sides, Height, OuterWidth, OuterBreadth );
	if( Hollow )
	{
		BuildCylinder( -1, AlignToSide, Sides, Height, InnerWidth, InnerBreadth );
		for( j=-1; j<2; j+=2 )
			for( i=0; i<Sides; i++ )
				Poly4i( j, i * 2 + (1 - j) / 2, ((i + 1) % Sides) * 2 + (1 - j) / 2, ((i + 1) % Sides) * 2 + (1 - j) / 2 + Sides * 2, i * 2 + (1 - j) / 2 + Sides * 2, 'Cap' );
	}
	else
	{
		for( j= -1; j < 2; j +=2 )
		{
			PolyBegin( j, 'Cap' );
			for( i = 0; i < Sides; i++ )
				Polyi( i*2+(1-j)/2 );
			PolyEnd();
		}
	}
	return EndBrush();
}

event ResetBuilder()
{	
	// Reset everything to default
	Height			= default.Height;
	OuterWidth		= default.OuterWidth;
	OuterBreadth		= default.OuterBreadth;
	InnerWidth		= default.InnerWidth;
	InnerBreadth		= default.InnerBreadth;
	Sides			= default.Sides;
	AlignToSide		= default.AlignToSide;
	Hollow			= default.Hollow;
}

defaultproperties
{
	Height=256
	OuterWidth=256
	OuterBreadth=128
	InnerWidth=64
	InnerBreadth=32
	Sides=16
	GroupName=EllipticCylinder
	AlignToSide=true
	Hollow=false
	BitmapFilename="BBEllipticBeveledCylinder"
	ToolTip="MaxG's Elliptic Cylinder"
}
