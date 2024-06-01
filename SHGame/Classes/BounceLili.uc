//================================================================================
// BounceLili.
//================================================================================

class BounceLili extends SHBounceSheet
  Config(User);

defaultproperties
{
     BouncerEmitter=Class'SHGame.Bounce_A'
     BounceSound=Sound'items.boing_lily'
	 MountAction=MA_StepUpOnlyMount
	 MaterialType=MTYPE_Leaf
     Mesh=SkeletalMesh'EnvAnims.lilypad_platform'
     CollisionRadius=85.000000
     CollisionHeight=12.000000
	 CollideType=CT_Cylinder
}
