//================================================================================
// PotionObjectCards.
//================================================================================

class PotionObjectCards extends PotionFun
  Config(User);

var() Class<PotionCards> impactClass;
var PotionCards impactObject;
var PotionCards objectList[40];
var int randNumObjects;
var int ObjectCounter;
var float ObjectYaw;
var float ObjectPitch;
var float ObjectRoll;
var Rotator objectRotation;

defaultproperties
{
     impactClass=Class'SHGame.PotionCards'
}
