//================================================================================
// GridMover.
//================================================================================

class GridMover extends KWMover;

var() float MoveIncrement;
var() float OmniGridSize;
var() bool bOmniGridMover;
var bool bDoingInterpolation;
var float fMoveTime;

function int myRound(float f)
{
}

function DecideDirection(Actor Other)
{
}

defaultproperties
{
     MoveIncrement=64.000000
     OmniGridSize=2.000000
     StayOpenTime=0.000000
     InitialState="BumpMove"
     bCollideWorld=True
     bProjTarget=True
}
