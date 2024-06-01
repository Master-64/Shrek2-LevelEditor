//================================================================================
// ConveyorPotion.
//================================================================================

class ConveyorPotion extends Potion
  Config(User);

var() Class<Emitter> fxClass;
var() int TimesLanded;
var() int LandingsTillDestroyed;
var bool bKillByDestroyer;

function StopMoving()
{
}

defaultproperties
{
     ControllerClass=Class'SHGame.ConveyorPotionController'
	 Physics=PHYS_Walking
     CollisionHeight=14.000000
	 bAlignBottom=False
}
