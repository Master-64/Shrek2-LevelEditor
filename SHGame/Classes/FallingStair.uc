//================================================================================
// FallingStair.
//================================================================================

class FallingStair extends ShPropsStatic
  Config(User);

var() name StaticAnimName;
var() name ShakingAnimName;
var() name FallingAnimName;
var() name FallenAnimName;
var() name ResetAnimName;
var float fCurrResetTime;
var float fCurrShakingTime;
var() float ShakingTime;
var() float ResetTime;

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

defaultproperties
{
     StaticAnimName="Static"
     ShakingAnimName="shake_loop"
     FallingAnimName="Fall"
     FallenAnimName="static_fallen"
     ResetAnimName="Reset"
     ShakingTime=10.000000
     ResetTime=60.000000
     bCanBeBaseForPawns=True
     Mesh=SkeletalMesh'EnvAnims.stair_break2'
     CollisionRadius=140.000000
     CollisionHeight=10.000000
	 bAlignBottom=False
}
