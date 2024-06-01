//================================================================================
// Batcontroller.
//================================================================================

class Batcontroller extends ShEnemyCreatureController;

var Vector TempDestination;
var float SleepTime;
var Vector attackLocation;
var Vector LastHeroLoc;
var Rotator LastHeroRot;
var Actor ActorToAvoid;
var Actor lastavoidedactor;
var int Timesavoidingsameactor;
var Vector HitNormal;
var Vector vside;

function Vector FindRandomTurn()
{
}

function bool CanTraceToHero()
{
}

function DestroyPawn()
{
}

function Vector ChooseDestination()
{
}

function Vector ChooseHoverDestination()
{
}

function ChooseToIdlePursueGoAway()
{
}

function InvalidateAtPotionStart()
{
}

defaultproperties
{
     SleepTime=2.000000
}
