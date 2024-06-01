//================================================================================
// PickableTreeTwo.
//================================================================================

class PickableTreeTwo extends PickableTree
  Placeable
  Config(User);

defaultproperties
{
     DestroyTreeEmitter=Class'SHGame.Cookie_Bits'
     TreeRootsEmitter=Class'SHGame.Pull_TreeB'
     TreeRootsBone="root_joint"
     TreeRootsEmitterDelay=0.100000
     Mesh=SkeletalMesh'EnvAnims.tree_2'
     CollisionRadius=60.000000
     CollisionHeight=200.000000
}
