//================================================================================
// PotionCloudFive.
//================================================================================

class PotionCloudFive extends PotionFun
  Config(User);

var() Class<Emitter> impactOneClass;
var() Class<Emitter> impactTwoClass;
var() Class<Emitter> impactThreeClass;
var() Class<Emitter> impactFourClass;
var Emitter impactOne;
var Emitter impactTwo;
var Emitter impactThree;
var Emitter impactFour;
var float randYaw;
var Rotator EffectRotation;

defaultproperties
{
     impactOneClass=Class'SHGame.Nut_Trail'
     impactTwoClass=Class'SHGame.Nut_Trail'
     impactThreeClass=Class'SHGame.Nut_Trail'
     impactFourClass=Class'SHGame.Nut_Trail'
}
