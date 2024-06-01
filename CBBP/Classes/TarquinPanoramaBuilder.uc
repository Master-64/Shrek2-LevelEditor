//=============================================================================
// TarquinPanoramaBuilder: Builds a cylinder but that has a wedge cut out of it
// Credits to Tarquin for the original brush builder
// Ported to UE2 by Master_64
//=============================================================================
class TarquinPanoramaBuilder extends BrushBuilder;

var() float Height;
var() float PanelWidth;
var() float Radius;
var() int Sides;
var() int PanelsPerSide;
var() bool AlignToSide;
var() name GroupName;

function bool Build()
{
	local int i, j, k;
	local Vector BaseVector, SideVector, HeightVector;
	local Rotator SpinTransformation;


	if((Sides < 3) || PanelsPerSide < 1)
	{
		return BadParameters("Must have at least three sides and one panel per side.");
	}

	if(Height <= float(0))
	{
		return BadParameters("Height must be positive.");
	}

	if((PanelWidth < float(0)) || Radius < float(0))
	{
		return BadParameters("PanelWidth or Radius may not be negative.");
	}

	if(!(PanelWidth == float(0)) ^^ (Radius == float(0)))
	{
		return BadParameters("Set either the PanelWidth, or the Radius. Whichever you want the builder to ignore, set to zero. You cannot set both!");
	}

	if(Radius > float(0))
	{
		BaseVector.X = Radius;
	}
	else
	{
		BaseVector.X = ((PanelWidth * float(PanelsPerSide)) / float(2)) / Sin(3.141593 / float(Sides));
	}
	HeightVector.Z = Height;
	SpinTransformation.Yaw = 65536 / Sides;

	if(AlignToSide)
	{

		if(Radius > float(0))
		{
			BaseVector.X /= Cos(3.141593 / float(Sides));
		}
		BaseVector = BaseVector >> (SpinTransformation / float(2));
	}
	SideVector = ((BaseVector >> SpinTransformation) - BaseVector) / float(PanelsPerSide);
	BeginBrush(false, GroupName);
	k = 0;
	J0x267:


	if(k < 2)
	{
		j = 0;
		J0x27A:


		if(j < Sides)
		{
			i = 0;
			J0x290:


			if(i < PanelsPerSide)
			{
				Vertexv((float(k) * HeightVector) + ((BaseVector + (float(i) * SideVector)) >> (SpinTransformation * float(j))));
				++ i;

				goto J0x290;
			}
			++ j;

			goto J0x27A;
		}
		++ k;

		goto J0x267;
	}
	i = 0;
	J0x301:


	if(i < (Sides * PanelsPerSide))
	{
		Poly4i(1, i, i + (Sides * PanelsPerSide), int(float(i + 1) % float(Sides * PanelsPerSide)) + (Sides * PanelsPerSide), int(float(i + 1) % float(Sides * PanelsPerSide)), 'panorama', 264);
		++ i;

		goto J0x301;
	}
	return EndBrush();
}

defaultproperties
{
	Height=128
	PanelWidth=128
	Sides=4
	PanelsPerSide=2
	AlignToSide=true
	GroupName=panorama
	BitmapFilename="BBTarquinPanorama"
	ToolTip="Tarquin's Panorama Builder"
}