//=============================================================================
// MaxGCircleSheetBuilder: Builds a circle sheet brush.
// Credits to MaxG for the original brush builder
// Ported to UE2 by Master_64
//=============================================================================
class MaxGCircleSheetBuilder extends BrushBuilder;

var() float OuterWidth, OuterHeight;
var() float InnerWidth, InnerHeight;
var() int Sides;
var() name GroupName;
var() bool Hollow;
var() bool AlignToSide;

function BuildCircle( int Direction, bool AlignToSide, int Sides, float Width, float Height )
{
	local int n,i,j,q,Ofs;
	
	if( AlignToSide )
	{
		Width /= cos(pi / Sides);
		Height /= cos(pi / Sides);
		Ofs = 1;
	}

	Width /= 2.0;
	Height /= 2.0;

	// Vertices.
	for( i = 0; i < Sides; i++ )
		for( j= -1; j < 2; j += 2 )
			Vertex3f( Width * sin((2 * i + Ofs) * pi / Sides), Height * cos((2 * i + Ofs) * pi / Sides), 0);

	n = GetVertexCount();

	
}

function bool Build()
{
	local int i, j, n;

	if( Sides < 3 )
		return BadParameters();
	if( OuterWidth <= 0 || OuterHeight <= 0 )
		return BadParameters();

	if (Hollow)
	{
		if ( ( FMin(InnerHeight, InnerWidth) <= 0 ) )
		{
			return BadParameters();
		}

		if ( FMax(InnerHeight, InnerWidth) >= FMin(OuterWidth, OuterHeight) )
		{
			return BadParameters();
		}
	}

	BeginBrush( false, GroupName );
	BuildCircle( +1, AlignToSide, Sides, OuterWidth, OuterHeight );

	n = GetVertexCount();

	if (Hollow)
	{
		BuildCircle( -1, AlignToSide, Sides, InnerWidth, InnerHeight );
		for( j=-1; j<2; j+=2 )
			for( i=0; i<Sides; i++ )
				Poly4i( j, i * 2 + (1 - j) / 2, ((i + 1) % Sides) * 2 + (1 - j) / 2, ((i + 1) % Sides) * 2 + (1 - j) / 2 + Sides * 2, i * 2 + (1 - j) / 2 + Sides * 2, 'Cap', 0x00000108 );
	}
	else
	{
		// PF_TwoSided|PF_NotSolid.
		PolyBegin( j, 'Cap', 0x00000108);
		for( i = 0; i < n; i++ )
		{
			Polyi(i); 
		}
		PolyEnd();
	}

	return EndBrush();
}

event ResetBuilder()
{	
	// Reset everything to default
	OuterWidth		= default.OuterWidth;
	OuterHeight		= default.OuterHeight;
	InnerHeight = default.InnerHeight;
	InnerWidth = default.InnerWidth;
	Sides			= default.Sides;
	AlignToSide		= default.AlignToSide;
	Hollow		= default.Hollow;
}

defaultproperties
{
	OuterHeight=256
	OuterWidth=256
	InnerHeight=128
	InnerWidth=128
	Sides=8
	GroupName=Circle
	AlignToSide=true
	Hollow=False
	BitmapFilename="BBCircleSheet"
	ToolTip="MaxG's Circle Sheet"
}
