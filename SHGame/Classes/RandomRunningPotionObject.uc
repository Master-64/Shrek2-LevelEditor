//================================================================================
// RandomRunningPotionObject.
//================================================================================

class RandomRunningPotionObject extends RandomRunningObject
  Config(User);

defaultproperties
{
     ControllerClass=Class'SHGame.RandomRunningPotionController'
     bPhysicsAnimUpdate=True
     BaseMovementRate=5.000000
     Mesh=SkeletalMesh'ShrekCharacters.Chicken'
     DrawScale=0.500000
     CollisionRadius=5.000000
     CollisionHeight=13.000000
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
}
