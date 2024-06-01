//================================================================================
// Prisoner.
//================================================================================

class Prisoner extends SHCharacter
  NotPlaceable
  Config(User);

var() name PrisonerIdleAnim;
var() bool bCanLookAtPlayer;

defaultproperties
{
     NeckRotElement=RE_RollNeg
     Mesh=SkeletalMesh'ShrekCharacters.Prisoner'
     CollisionRadius=100.000000
     CollisionHeight=35.000000
     bBlockActors=False
     bBlockPlayers=False
}
