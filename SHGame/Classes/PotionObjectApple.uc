//================================================================================
// PotionObjectApple.
//================================================================================

class PotionObjectApple extends PotionFun
  Config(User);

var() Class<PotionApple> impactClass;
var PotionApple impactObject;
var PotionApple objectList[15];
var int randNumObjects;
var int ObjectCounter;
var float ObjectYaw;
var float ObjectPitch;
var float ObjectRoll;
var Rotator objectRotation;

defaultproperties
{
     impactClass=Class'SHGame.PotionApple'
}
