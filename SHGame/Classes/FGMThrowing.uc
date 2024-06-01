//================================================================================
// FGMThrowing.
//================================================================================

class FGMThrowing extends KWPawn
  Config(User);

var BossFGM BossOwner;
var Emitter AttachedEmitter;
var Class<Emitter> ImpactEmitterClass;
var Class<Emitter> ReflectEmitterClass;
var() Sound sfxImpact;
var int ThrowingType;
var() float FDMThrowingLive;

function DestroyEmitterAndItself()
{
}

defaultproperties
{
     sfxImpact=Sound'FGM_Battle.magic_hit'
     FDMThrowingLive=2.000000
	 Physics=PHYS_Falling
     bHidden=True
     CollisionRadius=8.000000
     CollisionHeight=8.000000
}
