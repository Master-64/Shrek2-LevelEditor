//================================================================================
// StinkPixiecontroller.
//================================================================================

class StinkPixiecontroller extends Controller;

var Actor CurrentTarget;
var int ApproachDistance;
var int DestroyDistance;
var int CurrentTimeTillDestroy;
var int MaxTimeTillDestroy;

function Vector FindPointInFrontOfTarget()
{
}

function Vector FindPointInFrontOfHero()
{
}

defaultproperties
{
     ApproachDistance=200
     DestroyDistance=2000
     MaxTimeTillDestroy=3
}
