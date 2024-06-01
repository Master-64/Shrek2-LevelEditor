//=============================================================================
// GubarTesselatedSheetBuilder: Builds a tesselated sheet
// Credits to Gubar for the original brush builder
// Ported to UE2 by Master_64
//=============================================================================
class GubarTesselatedSheetBuilder extends BrushBuilder;

enum ESheetAxis
{
	AX_Horizontal,
	AX_XAxis,
	AX_YAxis
};

var() float Height;
var() float Width;
var() GubarTesselatedSheetBuilder.ESheetAxis Axis;
var() name GroupName;

event bool Build()
{

	if((Height <= float(0)) || Width <= float(0))
	{
		return BadParameters();
	}
	BeginBrush(false, GroupName);

	if(Axis == 0)
	{
		Vertex3f(Width / float(2), Height / float(2), 0);
		Vertex3f(Width / float(2), -Height / float(2), 0);
		Vertex3f(-Width / float(2), -Height / float(2), 0);
		Vertex3f(-Width / float(2), Height / float(2), 0);
	}
	else
	{

		if(Axis == 1)
		{
			Vertex3f(0, Width / float(2), Height / float(2));
			Vertex3f(0, Width / float(2), -Height / float(2));
			Vertex3f(0, -Width / float(2), -Height / float(2));
			Vertex3f(0, -Width / float(2), Height / float(2));
		}
		else
		{
			Vertex3f(Width / float(2), 0, Height / float(2));
			Vertex3f(-Width / float(2), 0, Height / float(2));
			Vertex3f(-Width / float(2), 0, -Height / float(2));
			Vertex3f(Width / float(2), 0, -Height / float(2));
		}
	}
	Poly3i(1, 0, 1, 2, 'Sheet', 264);
	Poly3i(1, 3, 2, 0, 'Sheet', 264);
	return EndBrush();
}

defaultproperties
{
	Height=256
	Width=256
	BitmapFilename="BBTesselatedSheet"
	ToolTip="Gubar's Tesselated Sheet"
}