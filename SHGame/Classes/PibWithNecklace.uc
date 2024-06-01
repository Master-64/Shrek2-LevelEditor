//================================================================================
// PibWithNecklace.
//================================================================================

class PibWithNecklace extends PIB
  Config(User);

var name NecklaceAttachBone;
var Vector NecklaceAttachOffset;
var Rotator NecklaceAttachRotation;

defaultproperties
{
     NecklaceAttachBone="body_spine4_joint"
     NecklaceAttachRotation=(Pitch=-16235)
}
