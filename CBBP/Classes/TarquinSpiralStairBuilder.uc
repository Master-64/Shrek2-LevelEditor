//=============================================================================
// TarquinSpiralStairBuilder: Builds a spiral staircase, but has more options
// Credits to Tarquin for the original brush builder
// Ported to UE2 by Master_64
//=============================================================================
class TarquinSpiralStairBuilder extends BrushBuilder;

enum EGoingStyle
{
	STYLE_Steps,
	STYLE_Slope,
	STYLE_Flat
};

var() float StepHeight;
var() float StepThickness;
var() float StepWidth;
var() float InnerRadius;
var() int StepsPerCircle;
var() int NumSteps;
var() name GroupName;
var() bool AntiClockwise;
var() TarquinSpiralStairBuilder.EGoingStyle TopStyle;
var() TarquinSpiralStairBuilder.EGoingStyle BaseStyle;

function bool Build()
{
	local int sgn, i, j, iOffset, iTerminal, TrackJumpLower,
		TrackJumpUpper, TrackOffsetB, TrackOffsetC, TrackOffsetD;

	local bool Edge, Disjoint;
	local Vector InnerVector, FlingVector, StepHeightVector, heightOffset, StepThicknessVector, thicknessOffset;

	local Rotator SpinTransformation;


	if((TopStyle == 2) && BaseStyle == 2)
	{
		return BadParameters("Base and Top may not BOTH be flat. Build a cylinder!");
	}

	if(StepThickness < StepHeight)
	{

		if((TopStyle == 1) || BaseStyle == 1)
		{
			return BadParameters("For stairs with a slope, StepThickness may not be less than StepHeight");
		}

		if((TopStyle == 0) && BaseStyle == 0)
		{
			Disjoint = true;
		}
	}

	if(StepThickness == StepHeight)
	{

		if((TopStyle == 1) && BaseStyle == 1)
		{
			return BadParameters("For stairs with twin slopes, StepThickness must be strictly greater than StepHeight");
		}

		if((TopStyle == 0) && BaseStyle == 0)
		{
			Edge = true;
		}
		else
		{

			if((TopStyle == 1) || BaseStyle == 1)
			{
				Edge = true;
			}
		}
	}

	if(InnerRadius <= float(0))
	{
		return BadParameters("InnerRadius must be positive.");
	}

	if(StepWidth <= float(0))
	{
		return BadParameters("StepWidth must be positive.");
	}

	if(StepsPerCircle < 3)
	{
		return BadParameters("At least 3 steps per circle.");
	}

	if(NumSteps < 1)
	{
		return BadParameters("A staircase with 0 or negative steps is silly!");
	}

	if((NumSteps >= StepsPerCircle) && (float(NumSteps - 1) * StepHeight) <= StepThickness)
	{
		BadParameters("The stairs may intersect themselves. Not recommended, but press OK to build anyway.");
	}

	if((TopStyle == 2) || BaseStyle == 2)
	{

		if(NumSteps == StepsPerCircle)
		{
			BadParameters(("A full circle with a 'flat' option will have co-inciding vertices. " $ "Press OK to build anyway, but subtracting this brush will leave a spare sheet poly. ") $ "If this is vitally important, support may added in a future version.");
		}

		if(NumSteps > StepsPerCircle)
		{
			return BadParameters("Can't have more than a full circle with the flat option.");
		}
	}
	InnerVector.X = InnerRadius;
	FlingVector.X = StepWidth;
	StepHeightVector.Z = StepHeight;
	StepThicknessVector.Z = StepThickness;
	SpinTransformation.Yaw = 65536 / StepsPerCircle;
	sgn = 1;
	Log((("edge= " $ string(Edge)) $ "; disjoint= ") $ string(Disjoint));

	if(AntiClockwise)
	{
		SpinTransformation.Yaw = -SpinTransformation.Yaw;
		sgn = -sgn;
	}
	heightOffset.Z = StepHeightVector.Z;
	thicknessOffset.Z = StepThicknessVector.Z;
	BeginBrush(false, GroupName);
	Log("Start Vertex count:" $ string(GetVertexCount()));

	if((BaseStyle == 0) && !Edge && TopStyle == 1)
	{
		j = 0;
		J0x5FD:


		if(j < 2)
		{
			i = 0;
			J0x610:


			if(i < NumSteps)
			{
				Vertexv(((InnerVector + (float(j) * FlingVector)) >> (SpinTransformation * float(i))) + (StepHeightVector * float(i)));
				Vertexv(((InnerVector + (float(j) * FlingVector)) >> (SpinTransformation * float(i + 1))) + (StepHeightVector * float(i)));
				++ i;

				goto J0x610;
			}
			++ j;

			goto J0x5FD;
		}
		TrackJumpLower = 2;
		TrackOffsetB = NumSteps * 2;
		TrackOffsetC = TrackOffsetB + (NumSteps * 2);
	}
	else
	{

		if(BaseStyle == 2)
		{
			heightOffset.Z = 0;
		}

		if(Edge && TopStyle == 1)
		{
			iOffset = 1;
		}
		else
		{
			iTerminal = 1;
		}
		j = 0;
		J0x733:


		if(j < 2)
		{
			i = 0;
			J0x746:


			if(i < (NumSteps + iTerminal))
			{
				Vertexv(((InnerVector + (float(j) * FlingVector)) >> (SpinTransformation * float(i + iOffset))) + (heightOffset * float(i)));
				++ i;

				goto J0x746;
			}
			++ j;

			goto J0x733;
		}
		TrackJumpLower = 1;
		TrackOffsetB = NumSteps + iTerminal;
		TrackOffsetC = (TrackOffsetB + NumSteps) + iTerminal;
	}
	heightOffset.Z = StepHeightVector.Z;
	thicknessOffset.Z = StepThicknessVector.Z;
	iOffset = 0;
	iTerminal = 0;

	if((TopStyle == 0) && !Edge)
	{
		j = 0;
		J0x842:


		if(j < 2)
		{
			i = 0;
			J0x855:


			if(i < NumSteps)
			{
				Vertexv((((InnerVector + (float(j) * FlingVector)) >> (SpinTransformation * float(i))) + StepThicknessVector) + (StepHeightVector * float(i)));
				Vertexv((((InnerVector + (float(j) * FlingVector)) >> (SpinTransformation * float(i + 1))) + StepThicknessVector) + (StepHeightVector * float(i)));
				++ i;

				goto J0x855;
			}
			++ j;

			goto J0x842;
		}
		TrackJumpUpper = 2;
		TrackOffsetD = TrackOffsetC + (NumSteps * 2);
	}
	else
	{

		if(TopStyle == 1)
		{
			iOffset = -1;
			iTerminal = 1;
		}

		if(TopStyle == 2)
		{
			thicknessOffset.Z = StepThickness + (StepHeight * float(NumSteps - 1));
			heightOffset.Z = 0;

			if(!Edge && BaseStyle == 1)
			{
				iTerminal = 1;
			}
		}
		Log("iTerminal=" $ string(iTerminal));
		j = 0;
		J0x9C9:


		if(j < 2)
		{
			i = 0;
			J0x9DC:


			if(i < (NumSteps + iTerminal))
			{
				Vertexv((((InnerVector + (float(j) * FlingVector)) >> (SpinTransformation * float(i))) + (heightOffset * float(i + iOffset))) + thicknessOffset);
				++ i;

				goto J0x9DC;
			}

			if(Edge && (TopStyle == 0) && BaseStyle == 0)
			{
				Log((("j:" $ string(j)) $ ", iX, V") $ string(GetVertexCount()));
				Vertexv((((InnerVector + (float(j) * FlingVector)) >> (SpinTransformation * float(NumSteps))) + (heightOffset * float(NumSteps - 1))) + thicknessOffset);
				Log("Edge StepStep. Terminal vertex:" $ string((((InnerVector + (float(j) * FlingVector)) >> (SpinTransformation * float(NumSteps))) + (heightOffset * float(NumSteps - 1))) + thicknessOffset));
			}
			++ j;

			goto J0x9C9;
		}

		if(Edge && (TopStyle == 0) && BaseStyle == 0)
		{
			iTerminal = 1;
		}
		TrackJumpUpper = 1;
		TrackOffsetD = (TrackOffsetC + NumSteps) + iTerminal;
	}
	Log((((("B: " $ string(TrackOffsetB)) $ " C: ") $ string(TrackOffsetC)) $ " D: ") $ string(TrackOffsetD));

	if(BaseStyle == 0)
	{

		if(Edge && TopStyle == 1)
		{
			i = 0;
			J0xC09:


			if(i < NumSteps)
			{
				Poly4i(sgn, i, TrackOffsetB + i, TrackOffsetD + i, TrackOffsetC + i, 'basegoing');
				++ i;

				goto J0xC09;
			}
		}
		else
		{
			i = 0;
			J0xC65:


			if(i < (TrackJumpLower * NumSteps))
			{
				Poly4i(sgn, i, i + 1, (TrackOffsetB + i) + 1, TrackOffsetB + i, 'basegoing');
				Log((((((("going: " $ string(i)) $ ",") $ string(i + 1)) $ ",") $ string((TrackOffsetB + i) + 1)) $ ",") $ string(TrackOffsetB + i));
				i += TrackJumpLower;

				goto J0xC65;
			}
		}

		if(Disjoint)
		{
			Log("disjoint riser");
			i = 0;
			J0xD36:


			if(i < NumSteps)
			{
				Poly4i(sgn, (TrackJumpLower * i) + 1, (TrackOffsetC + (TrackJumpUpper * i)) + 1, (TrackOffsetD + (TrackJumpUpper * i)) + 1, (TrackOffsetB + (TrackJumpLower * i)) + 1, 'baseriser');
				Log((((((("riser:" $ string(i + 1)) $ ",") $ string((TrackOffsetC + i) + 1)) $ ",") $ string((TrackOffsetD + i) + 1)) $ ",") $ string((TrackOffsetB + i) + 1));
				++ i;

				goto J0xD36;
			}
		}
		else
		{

			if(Edge && TopStyle == 1)
			{
				i = 0;
				J0xE33:


				if(i < NumSteps)
				{
					Poly4i(sgn, i, (TrackOffsetC + i) + 1, (TrackOffsetD + i) + 1, TrackOffsetB + i, 'baseriser');
					++ i;

					goto J0xE33;
				}
			}
			else
			{
				i = 0;
				J0xE95:


				if(i < ((TrackJumpLower * (NumSteps - 1)) - 1))
				{
					Poly4i(sgn, i + 1, i + 2, (TrackOffsetB + i) + 2, (TrackOffsetB + i) + 1, 'baseriser');
					Log((((((("riser: " $ string(i + 1)) $ ",") $ string(i + 2)) $ ",") $ string((TrackOffsetB + i) + 2)) $ ",") $ string((TrackOffsetB + i) + 1));
					i += TrackJumpLower;

					goto J0xE95;
				}
				Poly4i(sgn, (TrackJumpLower * (NumSteps - 1)) + 1, (TrackOffsetC + (TrackJumpUpper * (NumSteps - 1))) + 1, (TrackOffsetD + (TrackJumpUpper * (NumSteps - 1))) + 1, (TrackOffsetB + (TrackJumpLower * (NumSteps - 1))) + 1, 'baseriser');
				Log((((((("cap: " $ string((TrackJumpLower * (NumSteps - 1)) + 1)) $ ",") $ string((TrackOffsetC + (TrackJumpUpper * (NumSteps - 1))) + 1)) $ ",") $ string((TrackOffsetD + (TrackJumpUpper * (NumSteps - 1))) + 1)) $ ",") $ string((TrackOffsetB + (TrackJumpLower * (NumSteps - 1))) + 1));
			}
		}
	}
	else
	{

		if(BaseStyle == 2)
		{

			if(Edge && TopStyle == 1)
			{
				Poly4i(sgn, 0, TrackOffsetB, TrackOffsetD, TrackOffsetC, 'basegoing');
				i = 1;
				J0x10A1:


				if(i < NumSteps)
				{
					Poly4i(sgn, i - 1, i, TrackOffsetB + i, (TrackOffsetB + i) - 1, 'basegoing');
					++ i;

					goto J0x10A1;
				}
				Poly4i(sgn, TrackJumpLower * (NumSteps - 1), (TrackOffsetC + (TrackJumpUpper * (NumSteps - 1))) + 1, (TrackOffsetD + (TrackJumpUpper * (NumSteps - 1))) + 1, TrackOffsetB + (TrackJumpLower * (NumSteps - 1)), 'baseriser');				
			}
			else
			{
				i = 0;
				J0x1163:


				if(i < NumSteps)
				{
					Poly4i(sgn, i, i + 1, (TrackOffsetB + i) + 1, TrackOffsetB + i, 'basegoing');
					++ i;

					goto J0x1163;
				}
				Poly4i(sgn, (TrackJumpLower * (NumSteps - 1)) + 1, (TrackOffsetC + (TrackJumpUpper * (NumSteps - 1))) + 1, (TrackOffsetD + (TrackJumpUpper * (NumSteps - 1))) + 1, (TrackOffsetB + (TrackJumpLower * (NumSteps - 1))) + 1, 'baseriser');
			}
			Log(string((TrackJumpLower * (NumSteps - 1)) + 1));
			Log(string((TrackOffsetC + (TrackJumpUpper * (NumSteps - 1))) + 1));
			Log(string((TrackOffsetD + (TrackJumpUpper * (NumSteps - 1))) + 1));
			Log(string((TrackOffsetB + (TrackJumpLower * (NumSteps - 1))) + 1));
		}
		else
		{

			if(BaseStyle == 1)
			{
				Log("slope");

				if(!Edge)
				{
					Poly4i(sgn, (TrackJumpLower * (NumSteps - 1)) + 1, (TrackOffsetC + (TrackJumpUpper * (NumSteps - 1))) + 1, (TrackOffsetD + (TrackJumpUpper * (NumSteps - 1))) + 1, (TrackOffsetB + (TrackJumpLower * (NumSteps - 1))) + 1, 'baseriser');
				}
				i = 0;
				J0x1329:


				if(i < NumSteps)
				{
					Poly3i(sgn, i, i + 1, (TrackOffsetB + i) + 1, 'baseslope');
					Poly3i(sgn, i, (TrackOffsetB + i) + 1, TrackOffsetB + i, 'baseslope');
					++ i;

					goto J0x1329;
				}
			}
		}
	}

	if(Edge && (TopStyle == 0) && BaseStyle == 0)
	{
		Log("SIDE: EDGE");
		i = 0;
		J0x13E0:


		if(i < (NumSteps - 1))
		{
			Poly4i(sgn, TrackOffsetB + (i * TrackJumpLower), (TrackOffsetB + (i * TrackJumpLower)) + 1, (TrackOffsetB + (i * TrackJumpLower)) + 2, TrackOffsetD + (i * TrackJumpUpper), 'outerwall');
			++ i;

			goto J0x13E0;
		}
		Poly4i(sgn, TrackOffsetB + ((NumSteps - 1) * TrackJumpLower), (TrackOffsetB + ((NumSteps - 1) * TrackJumpLower)) + 1, (TrackOffsetD + ((NumSteps - 1) * TrackJumpUpper)) + 1, TrackOffsetD + ((NumSteps - 1) * TrackJumpUpper), 'outerwall');		
	}
	else
	{

		if(Edge && TopStyle == 1)
		{
			Log("edge, top = slope");
			Poly3i(sgn, TrackOffsetB, TrackOffsetD + 1, TrackOffsetD, 'outerwall');
			Log((((("OuterWall 1:" $ string(TrackOffsetB)) $ ",") $ string(TrackOffsetD + 1)) $ ",") $ string(TrackOffsetD));

			if(BaseStyle == 2)
			{
				i = 1;
				J0x1571:


				if(i < NumSteps)
				{
					Poly4i(sgn, (TrackOffsetB + i) - 1, TrackOffsetB + i, (TrackOffsetD + i) + 1, TrackOffsetD + i, 'outerwall');
					++ i;

					goto J0x1571;
				}
			}
			else
			{
				i = 1;
				J0x15DA:


				if(i < NumSteps)
				{
					Poly3i(sgn, TrackOffsetB + i, (TrackOffsetD + i) + 1, TrackOffsetD + i, 'outerwall');
					++ i;

					goto J0x15DA;
				}
			}
		}
		else
		{

			if(Edge && BaseStyle == 1)
			{

				if(TopStyle == 2)
				{
					i = 0;
					J0x165F:


					if(i < (NumSteps - 1))
					{
						Poly4i(sgn, TrackOffsetB + i, (TrackOffsetB + i) + 1, (TrackOffsetD + i) + 1, TrackOffsetD + i, 'outerwall');
						++ i;

						goto J0x165F;
					}
				}
				else
				{
					i = 0;
					J0x16CB:


					if(i < (NumSteps - 1))
					{
						Poly3i(sgn, TrackOffsetB + i, (TrackOffsetB + i) + 1, TrackOffsetD + i, 'outerwall');
						++ i;

						goto J0x16CB;
					}
				}
				Poly3i(sgn, (TrackOffsetB + NumSteps) - 1, ((TrackOffsetB + NumSteps) - 1) + 1, (TrackOffsetD + NumSteps) - 1, 'outerwall');
			}
			else
			{
				i = 0;
				J0x1768:


				if(i < NumSteps)
				{
					Poly4i(sgn, TrackOffsetB + (i * TrackJumpLower), (TrackOffsetB + (i * TrackJumpLower)) + 1, (TrackOffsetD + (i * TrackJumpUpper)) + 1, TrackOffsetD + (i * TrackJumpUpper), 'outerwall');
					++ i;

					goto J0x1768;
				}
			}
		}
	}

	if(TopStyle == 0)
	{

		if(Edge)
		{
			i = 0;
			J0x1803:


			if(i < (NumSteps - 1))
			{
				Poly4i(sgn, (i + 1) * TrackJumpLower, TrackOffsetC + i, TrackOffsetD + i, TrackOffsetB + ((i + 1) * TrackJumpLower), 'topgoing');
				++ i;

				goto J0x1803;
			}
			i = 0;
			J0x1873:


			if(i < NumSteps)
			{
				Poly4i(sgn, TrackOffsetB + (i * TrackJumpLower), TrackOffsetD + i, TrackOffsetC + i, i * TrackJumpLower, 'topriser');
				++ i;

				goto J0x1873;
			}

			if(BaseStyle == 0)
			{
				Poly4i(sgn, ((TrackOffsetC + NumSteps) - 1) + 1, (TrackOffsetC + NumSteps) - 1, (TrackOffsetD + NumSteps) - 1, ((TrackOffsetD + NumSteps) - 1) + 1, 'topgoing');
			}
			else
			{
				Poly4i(sgn, (NumSteps - 1) + 1, (TrackOffsetC + NumSteps) - 1, (TrackOffsetD + NumSteps) - 1, ((TrackOffsetB + NumSteps) - 1) + 1, 'topgoing');
			}
		}
		else
		{
			i = 0;
			J0x198D:


			if(i < NumSteps)
			{
				Poly4i(sgn, (TrackOffsetC + (2 * i)) + 1, TrackOffsetC + (2 * i), TrackOffsetD + (2 * i), (TrackOffsetD + (2 * i)) + 1, 'topgoing');
				++ i;

				goto J0x198D;
			}

			if(Disjoint)
			{
				i = 0;
				J0x1A0C:


				if(i < NumSteps)
				{
					Poly4i(sgn, TrackOffsetB + (2 * i), TrackOffsetD + (2 * i), TrackOffsetC + (2 * i), 2 * i, 'topriser');
					++ i;

					goto J0x1A0C;
				}
			}
			else
			{
				Poly4i(sgn, TrackOffsetB, TrackOffsetD, TrackOffsetC, 0, 'topriser');
				i = 1;
				J0x1A98:


				if(i < NumSteps)
				{
					Poly4i(sgn, (TrackOffsetD + (2 * i)) - 1, TrackOffsetD + (2 * i), TrackOffsetC + (2 * i), (TrackOffsetC + (2 * i)) - 1, 'topriser');
					++ i;

					goto J0x1A98;
				}
			}
		}
	}
	else
	{

		if(TopStyle == 2)
		{
			Poly4i(sgn, TrackOffsetB, TrackOffsetD, TrackOffsetC, 0, 'topriser');
			i = 0;
			J0x1B41:


			if(i < (NumSteps - 1))
			{
				Poly4i(sgn, TrackOffsetC + i, TrackOffsetD + i, (TrackOffsetD + i) + 1, (TrackOffsetC + i) + 1, 'topgoing');
				++ i;

				goto J0x1B41;
			}

			if(Edge && BaseStyle == 1)
			{
				Poly4i(sgn, (TrackOffsetC + NumSteps) - 1, (TrackOffsetD + NumSteps) - 1, TrackOffsetB + NumSteps, NumSteps, 'topgoing');
			}
			else
			{
				Poly4i(sgn, (TrackOffsetC + NumSteps) - 1, (TrackOffsetD + NumSteps) - 1, TrackOffsetD + NumSteps, TrackOffsetC + NumSteps, 'topgoing');
			}
		}
		else
		{

			if(!Edge)
			{
				Poly4i(sgn, TrackOffsetB, TrackOffsetD, TrackOffsetC, 0, 'topriser');
			}
			i = 0;
			J0x1C7B:


			if(i < NumSteps)
			{
				i = 0;
				J0x1C91:


				if(i < NumSteps)
				{
					Poly3i(sgn, TrackOffsetC + i, TrackOffsetD + i, (TrackOffsetC + i) + 1, 'topgoing');
					Poly3i(sgn, TrackOffsetD + i, (TrackOffsetD + i) + 1, (TrackOffsetC + i) + 1, 'topgoing');
					++ i;

					goto J0x1C91;
				}
				++ i;

				goto J0x1C7B;
			}
		}
	}

	if(Edge && (TopStyle == 0) && BaseStyle == 0)
	{
		Log("SIDE: EDGE");
		i = 0;
		J0x1D67:


		if(i < (NumSteps - 1))
		{
			Poly4i(-sgn, 0 + (i * TrackJumpLower), (0 + (i * TrackJumpLower)) + 1, (0 + (i * TrackJumpLower)) + 2, TrackOffsetC + (i * TrackJumpUpper), 'innerwall');
			++ i;

			goto J0x1D67;
		}
		Poly4i(-sgn, 0 + ((NumSteps - 1) * TrackJumpLower), (0 + ((NumSteps - 1) * TrackJumpLower)) + 1, (TrackOffsetC + ((NumSteps - 1) * TrackJumpUpper)) + 1, TrackOffsetC + ((NumSteps - 1) * TrackJumpUpper), 'innerwall');
	}
	else
	{

		if(Edge && TopStyle == 1)
		{
			Log("edge, top = slope");
			Poly3i(-sgn, 0, TrackOffsetC + 1, TrackOffsetC, 'innerwall');
			Log((((("OuterWall 1:" $ string(0)) $ ",") $ string(TrackOffsetC + 1)) $ ",") $ string(TrackOffsetC));

			if(BaseStyle == 2)
			{
				i = 1;
				J0x1EE2:


				if(i < NumSteps)
				{
					Poly4i(-sgn, (0 + i) - 1, 0 + i, (TrackOffsetC + i) + 1, TrackOffsetC + i, 'innerwall');
					++ i;

					goto J0x1EE2;
				}
			}
			else
			{
				i = 1;
				J0x1F45:


				if(i < NumSteps)
				{
					Poly3i(-sgn, 0 + i, (TrackOffsetC + i) + 1, TrackOffsetC + i, 'innerwall');
					++ i;

					goto J0x1F45;
				}
			}
		}
		else
		{

			if(Edge && BaseStyle == 1)
			{

				if(TopStyle == 2)
				{
					i = 0;
					J0x1FC8:


					if(i < (NumSteps - 1))
					{
						Poly4i(-sgn, 0 + i, (0 + i) + 1, (TrackOffsetC + i) + 1, TrackOffsetC + i, 'innerwall');
						++ i;

						goto J0x1FC8;
					}
				}
				else
				{
					i = 0;
					J0x202E:


					if(i < (NumSteps - 1))
					{
						Poly3i(-sgn, 0 + i, (0 + i) + 1, TrackOffsetC + i, 'innerwall');
						++ i;

						goto J0x202E;
					}
				}
				Poly3i(-sgn, (0 + NumSteps) - 1, ((0 + NumSteps) - 1) + 1, (TrackOffsetC + NumSteps) - 1, 'innerwall');
			}
			else
			{
				i = 0;
				J0x20BF:


				if(i < NumSteps)
				{
					Poly4i(-sgn, 0 + (i * TrackJumpLower), (0 + (i * TrackJumpLower)) + 1, (TrackOffsetC + (i * TrackJumpUpper)) + 1, TrackOffsetC + (i * TrackJumpUpper), 'innerwall');
					++ i;

					goto J0x20BF;
				}
			}
		}
	}
	return EndBrush();
}

defaultproperties
{
	StepHeight=16
	StepThickness=32
	StepWidth=128
	InnerRadius=64
	StepsPerCircle=8
	NumSteps=8
	GroupName=SpiralStairs
	BitmapFilename="BBTarquinSpiral"
	ToolTip="Tarquin's Spiral Stairs"
}