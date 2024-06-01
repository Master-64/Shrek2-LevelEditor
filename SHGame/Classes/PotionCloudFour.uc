//================================================================================
// PotionCloudFour.
//================================================================================

class PotionCloudFour extends PotionFun
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
     impactOneClass=Class'SHGame.Cherry_Trail'
     impactTwoClass=Class'SHGame.Cherry_Trail'
     impactThreeClass=Class'SHGame.Cherry_Trail'
     impactFourClass=Class'SHGame.Cherry_Trail'
}
