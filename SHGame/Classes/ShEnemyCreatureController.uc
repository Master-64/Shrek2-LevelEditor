//================================================================================
// ShEnemyCreatureController.
//================================================================================

class ShEnemyCreatureController extends AIController;

var int CurrentTimeTillDestroy;
var int MaxTimeTillDestroy;
var int DestroyDistance;

function StopMoving()
{
}

function PerformAttack()
{
}

function SpawnCollectible(class<Actor> aClass)
{
}

function Vector StartVelocity()
{
}

defaultproperties
{
     MaxTimeTillDestroy=3
     DestroyDistance=4000
}
