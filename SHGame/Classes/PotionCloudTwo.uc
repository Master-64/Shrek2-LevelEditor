//================================================================================
// PotionCloudTwo.
//================================================================================

class PotionCloudTwo extends PotionFun
  Config(User);

var() Class<Emitter> impactOneClass;
var() Class<Emitter> impactTwoClass;
var Emitter impactOne;
var Emitter impactTwo;

defaultproperties
{
     impactOneClass=Class'SHGame.Potbot_Explo'
     impactTwoClass=Class'SHGame.Potion_Cloud'
}
