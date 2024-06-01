//================================================================================
// PotionCloudThree.
//================================================================================

class PotionCloudThree extends PotionFun
  Config(User);

var() Class<Emitter> impactOneClass;
var() Class<Emitter> impactTwoClass;
var Emitter impactOne;
var Emitter impactTwo;

defaultproperties
{
     impactOneClass=Class'SHGame.SPotion_A'
     impactTwoClass=Class'SHGame.SPotion_B'
}
