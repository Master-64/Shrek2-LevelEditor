//================================================================================
// locker.
//================================================================================

class locker extends ShPropsStatic
  Config(User);

struct MaxMin
{
  var() int Max;
  var() int Min;
};

var() Class<Actor> GoodieToSpawn;
var() MaxMin Limits;
var() float StartVelMultiplier;
var() float Delay;
var int CurrentNum;
var int RandomNums;

function Vector StartVelocity()
{
}

function SpawnGoodie()
{
}

defaultproperties
{
     GoodieToSpawn=Class'SHGame.Coin'
	 Limits=(Max=5,Min=2)
     StartVelMultiplier=100.000000
     Delay=0.200000
     bSHPropsStaticCouldBeAttacked=True
     bCanBeBaseForPawns=True
     Mesh=SkeletalMesh'EnvAnims.lockers_single'
     CollisionRadius=30.000000
     CollisionHeight=65.000000
	 bAlignBottom=False
	 bBlocksCamera=True
}
