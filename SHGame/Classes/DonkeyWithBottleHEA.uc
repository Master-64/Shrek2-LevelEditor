//================================================================================
// DonkeyWithBottleHEA.
//================================================================================

class DonkeyWithBottleHEA extends Donkey
  Config(User);

var() Vector BottleAttachOffset;
var() Rotator BottleAttachRotation;

defaultproperties
{
     BottleAttachRotation=(Roll=-19000)
	 bIsMainPlayer=False
}
