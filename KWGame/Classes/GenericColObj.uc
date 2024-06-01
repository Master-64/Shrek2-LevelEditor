//================================================================================
// GenericColObj.
//================================================================================

class GenericColObj extends KWPawn
  Config(User);

function Touch(Actor Other)
{
}

function Bump(Actor Other)
{
}

defaultproperties
{
     bCanBePickedUp=True
     CollisionRadius=20.000000
     CollisionHeight=20.000000
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
	 Physics=PHYS_Trailer
}
