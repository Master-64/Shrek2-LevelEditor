//================================================================================
// PotionObjectOrange.
//================================================================================

class PotionObjectOrange extends PotionFun
  Config(User);

var() Class<PotionOrange> impactClass;
var PotionOrange impactObject;
var PotionOrange objectList[15];
var int randNumObjects;
var int ObjectCounter;
var float ObjectYaw;
var float ObjectPitch;
var float ObjectRoll;
var Rotator objectRotation;

defaultproperties
{
     impactClass=Class'SHGame.PotionOrange'
}
