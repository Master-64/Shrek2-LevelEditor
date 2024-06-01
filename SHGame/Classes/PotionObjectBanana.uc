//================================================================================
// PotionObjectBanana.
//================================================================================

class PotionObjectBanana extends PotionFun
  Config(User);

var() Class<PotionBanana> impactClass;
var PotionBanana impactObject;
var PotionBanana objectList[15];
var int randNumObjects;
var int ObjectCounter;
var float ObjectYaw;
var float ObjectPitch;
var float ObjectRoll;
var Rotator objectRotation;

defaultproperties
{
     impactClass=Class'SHGame.PotionBanana'
}
