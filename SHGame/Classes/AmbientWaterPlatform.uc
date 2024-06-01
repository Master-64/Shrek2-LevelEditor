//================================================================================
// AmbientWaterPlatform.
//================================================================================

class AmbientWaterPlatform extends AmbientPlant
  Placeable
  Config(User);

defaultproperties
{
     AmbPlantBounceAnimName="jump_on"
	 MaterialType=MTYPE_Wood
     Mesh=SkeletalMesh'EnvAnims.platform_water'
     CollisionRadius=65.000000
	 CollisionWidth=70.00
     CollisionHeight=15.000000
	 CollideType=CT_Box
}
