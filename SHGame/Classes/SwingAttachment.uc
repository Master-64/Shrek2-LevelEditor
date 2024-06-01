//================================================================================
// SwingAttachment.
//================================================================================

class SwingAttachment extends ShPropsStatic
  Config(User);

var() bool bInstantDeath;
var() int DamageAmount;

function Bump(Actor Other)
{
}

defaultproperties
{
     Physics=PHYS_Trailer
     bActorShadows=True
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
	 bAlignBottom=False
}
