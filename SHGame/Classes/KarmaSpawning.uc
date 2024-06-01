//================================================================================
// KarmaSpawning.
//================================================================================

class KarmaSpawning extends KWKarmaActor
  NotPlaceable;

struct MaxMin
{
  var() int Max;
  var() int Min;
};

var() Class<Actor> GoodieToSpawn[8];
var() MaxMin Limits;
var() float StartVelMultiplier;
var() float Delay;
var() int HitBeforeSpawning;
var() bool bDestroyAfterSpawning;
var int HowManyObjectsToSpawn;
var int CurrentNum;
var int RandomNums;

const MAX_SPAWNED_GOODIES= 8;

function TryToSpawnSomething()
{
}

function Vector StartVelocity()
{
}

function SpawnGoodie()
{
}

defaultproperties
{
     GoodieToSpawn(0)=Class'SHGame.Coin'
	 Limits=(Max=5,Min=2)
     StartVelMultiplier=100.000000
     Delay=0.200000
     HitBeforeSpawning=10
}
