//================================================================================
// BounceLeaf.
//================================================================================

class BounceLeaf extends SHBounceSheet
  Config(User);

defaultproperties
{
     BouncerEmitter=Class'SHGame.Bounce_A'
     BounceSound=Sound'items.boing_leaf'
	 MaterialType=MTYPE_Leaf
     Mesh=SkeletalMesh'EnvAnims.SpringLeaf'
     CollisionRadius=95.000000
	 CollisionWidth=55.00
     CollisionHeight=12.000000
}
