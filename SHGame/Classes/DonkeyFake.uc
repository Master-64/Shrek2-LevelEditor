//================================================================================
// DonkeyFake.
//================================================================================

class DonkeyFake extends shpawn
  Placeable
  Config(User);

var() Actor shrk;
var() Actor dnk;

defaultproperties
{
     Physics=PHYS_None
	 Mesh=SkeletalMesh'ShrekCharacters.Donkey'
     CollisionRadius=24.000000
     CollisionHeight=22.000000
     bCollideActors=False
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
}
