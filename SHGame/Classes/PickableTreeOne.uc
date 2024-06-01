//================================================================================
// PickableTreeOne.
//================================================================================

class PickableTreeOne extends PickableTree
  Placeable
  Config(User);

defaultproperties
{
     DestroyTreeEmitter=Class'SHGame.Cookie_Bits'
     TreeRootsEmitter=Class'SHGame.Pull_TreeA'
     TreeRootsBone="root_joint"
     TreeRootsEmitterDelay=0.100000
     Mesh=SkeletalMesh'EnvAnims.tree_1'
     CollisionRadius=60.000000
     CollisionHeight=150.000000
}
