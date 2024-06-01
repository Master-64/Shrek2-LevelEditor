//================================================================================
// SavePointFairycontroller.
//================================================================================

class SavePointFairycontroller extends AIController;

var Vector Destination;
var Vector HeroPursuitHeightOffset;
var int HeroPursuitDistanceOffset;
var int HeroSaveDistance;
var int DestroyDistance;
var string SavePointName;
var int CurrentTimeTillDestroy;
var int MaxTimeTillDestroy;

function StopCreatureMoving()
{
}

function StopHeroMoving()
{
}

function SetDestination()
{
}

function Vector ChooseDestination()
{
}

function OnSaveGame()
{
}

defaultproperties
{
     HeroPursuitHeightOffset=(Z=130.000000)
     HeroPursuitDistanceOffset=90
     HeroSaveDistance=300
     DestroyDistance=2000
     MaxTimeTillDestroy=3
}
