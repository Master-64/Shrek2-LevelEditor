//================================================================================
// PotionCloudOne.
//================================================================================

class PotionCloudOne extends PotionFun
  Config(User);

var() Class<Emitter> impactOneClass;
var() Class<Emitter> impactTwoClass;
var Emitter impactOne;
var Emitter impactTwo;

defaultproperties
{
     impactOneClass=Class'SHGame.LPotion_A'
     impactTwoClass=Class'SHGame.LPotion_B'
}
