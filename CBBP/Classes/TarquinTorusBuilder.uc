//=============================================================================
// TarquinTorusBuilder: Builds a torus (donut)
// Credits to Tarquin for the original brush builder
// Ported to UE2 by Master_64
//=============================================================================
class TarquinTorusBuilder extends BrushBuilder;

enum EAlignStyle
{
	AL_Plain,
	AL_Side,
	AL_Caps
};

var() float OuterRadius;
var() float TubeThickness;
var() int WheelSides;
var() int WheelSidesUsed;
var() int TubeSides;
var() TarquinTorusBuilder.EAlignStyle WheelAlignType;
var() bool TubeAlignToSide;
var() name GroupName;

function bool Build()
{
	local int i, j, TubeOfs, WheelOfs, XWheelSidesUsed, WheelPartial;

	local float CentrumRadius, TubeRadius, TubeSquishRadius, CACentrumRadius;


	if((TubeSides < 3) || WheelSides < 3)
	{
		return BadParameters("The tube and wheel must have at least three sides");
	}

	if((OuterRadius <= float(0)) || TubeThickness <= float(0))
	{
		return BadParameters("Radius and thickness must be positive");
	}

	if(TubeThickness >= OuterRadius)
	{
		return BadParameters("Thickness must be smaller than Outer Radius");
	}

	if((WheelSidesUsed <= 0) || WheelSidesUsed >= WheelSides)
	{
		XWheelSidesUsed = WheelSides;
	}
	else
	{
		XWheelSidesUsed = WheelSidesUsed;
	}
	WheelPartial = XWheelSidesUsed;
	TubeRadius = TubeThickness / float(2);
	TubeSquishRadius = TubeRadius;
	CentrumRadius = OuterRadius - TubeRadius;
	CACentrumRadius = CentrumRadius;

	if(TubeAlignToSide)
	{
		TubeOfs = 1;
		TubeRadius /= Cos(3.141593 / float(TubeSides));
		TubeSquishRadius /= Cos(3.141593 / float(TubeSides));
	}

	if(WheelAlignType != 0)
	{
		WheelOfs = 1;
		TubeSquishRadius /= Cos(3.141593 / float(WheelSides));
		CentrumRadius /= Cos(3.141593 / float(WheelSides));
	}

	if(XWheelSidesUsed == WheelSides)
	{
		-- WheelPartial;
	}
	BeginBrush(false, GroupName);

	if((WheelAlignType == 2) && XWheelSidesUsed != WheelSides)
	{
		j = 0;
		Log("wheel offset");
		Log(string(WheelOfs));
		i = 0;
		J0x247:


		if(i < TubeSides)
		{
			Vertex3f((CACentrumRadius * Cos(((2 * float(j)) * 3.141593) / float(WheelSides))) + ((TubeRadius * Cos((((2 * float(i)) + float(TubeOfs)) * 3.141593) / float(TubeSides))) * Cos(((2 * float(j)) * 3.141593) / float(WheelSides))), (CACentrumRadius * Sin(((2 * float(j)) * 3.141593) / float(WheelSides))) + ((TubeRadius * Cos((((2 * float(i)) + float(TubeOfs)) * 3.141593) / float(TubeSides))) * Sin(((2 * float(j)) * 3.141593) / float(WheelSides))), TubeRadius * Sin((((2 * float(i)) + float(TubeOfs)) * 3.141593) / float(TubeSides)));
			++ i;

			goto J0x247;
		}
		j = 1;
		J0x393:


		if(j < (WheelPartial + 1))
		{
			i = 0;
			J0x3AC:


			if(i < TubeSides)
			{
				Vertex3f((CentrumRadius * Cos((((2 * float(j)) - float(WheelOfs)) * 3.141593) / float(WheelSides))) + ((TubeSquishRadius * Cos((((2 * float(i)) + float(TubeOfs)) * 3.141593) / float(TubeSides))) * Cos((((2 * float(j)) - float(WheelOfs)) * 3.141593) / float(WheelSides))), (CentrumRadius * Sin((((2 * float(j)) - float(WheelOfs)) * 3.141593) / float(WheelSides))) + ((TubeSquishRadius * Cos((((2 * float(i)) + float(TubeOfs)) * 3.141593) / float(TubeSides))) * Sin((((2 * float(j)) - float(WheelOfs)) * 3.141593) / float(WheelSides))), TubeRadius * Sin((((2 * float(i)) + float(TubeOfs)) * 3.141593) / float(TubeSides)));
				++ i;

				goto J0x3AC;
			}
			++ j;

			goto J0x393;
		}
		j = WheelPartial;
		i = 0;
		J0x531:


		if(i < TubeSides)
		{
			Vertex3f((CACentrumRadius * Cos(((2 * float(j)) * 3.141593) / float(WheelSides))) + ((TubeRadius * Cos((((2 * float(i)) + float(TubeOfs)) * 3.141593) / float(TubeSides))) * Cos(((2 * float(j)) * 3.141593) / float(WheelSides))), (CACentrumRadius * Sin(((2 * float(j)) * 3.141593) / float(WheelSides))) + ((TubeRadius * Cos((((2 * float(i)) + float(TubeOfs)) * 3.141593) / float(TubeSides))) * Sin(((2 * float(j)) * 3.141593) / float(WheelSides))), TubeRadius * Sin((((2 * float(i)) + float(TubeOfs)) * 3.141593) / float(TubeSides)));
			++ i;

			goto J0x531;
		}
		++ WheelPartial;
	}
	else
	{
		j = 0;
		J0x687:


		if(j < (WheelPartial + 1))
		{
			i = 0;
			J0x6A0:


			if(i < TubeSides)
			{
				Vertex3f((CentrumRadius * Cos((((2 * float(j)) - float(WheelOfs)) * 3.141593) / float(WheelSides))) + ((TubeSquishRadius * Cos((((2 * float(i)) + float(TubeOfs)) * 3.141593) / float(TubeSides))) * Cos((((2 * float(j)) - float(WheelOfs)) * 3.141593) / float(WheelSides))), (CentrumRadius * Sin((((2 * float(j)) - float(WheelOfs)) * 3.141593) / float(WheelSides))) + ((TubeSquishRadius * Cos((((2 * float(i)) + float(TubeOfs)) * 3.141593) / float(TubeSides))) * Sin((((2 * float(j)) - float(WheelOfs)) * 3.141593) / float(WheelSides))), TubeRadius * Sin((((2 * float(i)) + float(TubeOfs)) * 3.141593) / float(TubeSides)));
				++ i;

				goto J0x6A0;
			}
			++ j;

			goto J0x687;
		}
		WheelPartial = XWheelSidesUsed;
	}

	if(XWheelSidesUsed == (WheelSides - 1))
	{
		j = 0;
		J0x837:


		if(j < WheelPartial)
		{
			i = 0;
			J0x84D:


			if(i < TubeSides)
			{
				Poly4i(-1, (j * TubeSides) + i, int(float(j * TubeSides) + (float(i + 1) % float(TubeSides))), int(float((j + 1) * TubeSides) + (float(i + 1) % float(TubeSides))), ((j + 1) * TubeSides) + i, 'Wall');
				++ i;

				goto J0x84D;
			}
			++ j;

			goto J0x837;
		}
	}
	else
	{
		Log("wheelPartial:");
		Log(string(WheelPartial));
		j = 0;
		J0x91A:


		if(j < WheelPartial)
		{
			i = 0;
			J0x930:


			if(i < TubeSides)
			{
				Poly4i(-1, (j * TubeSides) + i, int(float(j * TubeSides) + (float(i + 1) % float(TubeSides))), int(float(int(float(j + 1) % float(WheelSides)) * TubeSides) + (float(i + 1) % float(TubeSides))), (int(float(j + 1) % float(WheelSides)) * TubeSides) + i, 'Wall');
				++ i;

				goto J0x930;
			}
			++ j;

			goto J0x91A;
		}
	}

	if(XWheelSidesUsed < WheelSides)
	{
		PolyBegin(1, 'Cap');
		i = 0;
		J0xA15:


		if(i < TubeSides)
		{
			Polyi(i);
			++ i;

			goto J0xA15;
		}
		PolyEnd();
		PolyBegin(-1, 'Cap');
		i = 0;
		J0xA56:


		if(i < TubeSides)
		{
			Polyi((TubeSides * WheelPartial) + i);
			++ i;

			goto J0xA56;
		}
		PolyEnd();
	}
	return EndBrush();
}

defaultproperties
{
	OuterRadius=256
	TubeThickness=64
	WheelSides=8
	TubeSides=8
	WheelAlignType=1
	TubeAlignToSide=true
	GroupName=Torus
	BitmapFilename="BBTarquinTorus"
	ToolTip="Tarquin's Torus"
}