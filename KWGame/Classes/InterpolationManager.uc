//================================================================================
// InterpolationManager.
//================================================================================

class InterpolationManager extends Info;

var KWInterpolationPoint Dest;
var KWInterpolationPoint Last;
var float PhysAlpha;
var float PhysRate;
var float RemainingPause;
var float StartPause;
var int PauseNum;
var Vector MaxOffset;
var Vector MinOffset;
var Vector MaxOffsetNonPenalty;
var Vector MinOffsetNonPenalty;
var Vector TurnRateX;
var Vector TurnRateZ;
var Vector OldDesiredX;
var Vector OldDesiredZ;
var bool bInstantMove;

function Destroyed()
{
}

function SetPause(float f)
{
}

function Init(KWInterpolationPoint D, float rate, bool bJumpToStart, optional KWInterpolationPoint L)
{
}

function FinishedInterpolation()
{
}

function InstantMove()
{
}

function SetStartParameters()
{
}

defaultproperties
{
}
