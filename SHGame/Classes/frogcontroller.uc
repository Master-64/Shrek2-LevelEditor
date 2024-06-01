//================================================================================
// frogcontroller.
//================================================================================

class frogcontroller extends KWAIController;

var() float WakeUpDistance;
var() float RunFromHeroDistance;
var() float SearchForWaterDistance;
var bool RunFromHero;
var bool bUseWaterMarker;
var Vector ClosestwmLocation;
var Vector Destination;
var int WanderDistance;

function PlayCritterWaiting(optional float tweenTime)
{
}

function StopFrogMoving()
{
}

function Init()
{
}

defaultproperties
{
     WakeUpDistance=1024.000000
     RunFromHeroDistance=512.000000
     SearchForWaterDistance=1024.000000
     WanderDistance=56
     AmbientGlow=65
}
