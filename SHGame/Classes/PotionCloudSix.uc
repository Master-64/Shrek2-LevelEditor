//================================================================================
// PotionCloudSix.
//================================================================================

class PotionCloudSix extends PotionFun
  Config(User);

var() Class<Emitter> impactOneClass;
var() Class<Emitter> impactTwoClass;
var() Class<Emitter> impactThreeClass;
var Emitter impactOne;
var Emitter impactTwo;
var Emitter impactThree;
var float randYaw;
var Rotator EffectRotation;

function class<Emitter> GetRandomEmitter()
{
}

defaultproperties
{
     impactOneClass=Class'SHGame.Env_BLight'
     impactTwoClass=Class'SHGame.Env_RLight'
     impactThreeClass=Class'SHGame.Env_YLight'
}
