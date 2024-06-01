//================================================================================
// AmbientLily.
//================================================================================

class AmbientLily extends AmbientPlant
  Placeable
  Config(User);

defaultproperties
{
     MountAction=MA_StepUpOnlyMount
	 MaterialType=MTYPE_Leaf
     Mesh=SkeletalMesh'EnvAnims.lilypad_platform_noflower'
     CollisionRadius=85.000000
     CollisionHeight=12.000000
}
