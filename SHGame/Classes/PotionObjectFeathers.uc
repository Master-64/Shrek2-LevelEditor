//================================================================================
// PotionObjectFeathers.
//================================================================================

class PotionObjectFeathers extends PotionFun
  Config(User);

var() Class<PotionFeathers> impactClass;
var PotionFeathers impactObject;
var PotionFeathers objectList[40];
var int randNumObjects;
var int ObjectCounter;
var float ObjectYaw;
var float ObjectPitch;
var float ObjectRoll;
var Rotator objectRotation;

defaultproperties
{
     impactClass=Class'SHGame.PotionFeathers'
}
