//================================================================================
// BreakableObject.
//================================================================================

class BreakableObject extends ShPropsStatic
  NotPlaceable
  Config(User);

struct MaxMin
{
  var() int Max;
  var() int Min;
};

var() Class<Emitter> HitFXClass;
var() Sound HitSound;
var() Class<Actor> GoodieToSpawn;
var() MaxMin Limits;
var() float StartVelMultiplier;
var() float Delay;
var() bool bSpecialAttackOnly;
var() int InitialHealth;
var() int DamageToPlayer;
var() float ExplodingRadius;
var() int ExplodingDamage;
var() bool bBreakableJustOnEvent;
var() bool bDisableGoodieVelocity;
var CrushedObject CrushedObjectSample;
var() Texture CrushedTexture;
var() Class<BreakableRubble> CrushedRubbleClass;
var BreakableRubble CrushedRubbleSample;
var int CurrentNum;
var int RandomNums;
var bool bExploding;
var int WasDestroyed;

function Died(Controller Killer, class<DamageType> DamageType, Vector HitLocation)
{
}

function Trigger(Actor Other, Pawn EventInstigator)
{
}

function Vector StartVelocity()
{
}

function Vector StartPosition()
{
}

function SpawnGoodie()
{
}

function JumpOffPawn()
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function DoExtraStuff()
{
}

function SayBumpLine()
{
}

defaultproperties
{
     StartVelMultiplier=100.000000
     Delay=0.200000
     InitialHealth=1
     DamageToPlayer=8
     ExplodingRadius=300.000000
     ExplodingDamage=1
     bSHPropsStaticCouldBeAttacked=True
     bCanBeBaseForPawns=True
	 DrawType=DT_StaticMesh
}
