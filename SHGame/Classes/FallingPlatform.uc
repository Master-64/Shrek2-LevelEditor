//================================================================================
// FallingPlatform.
//================================================================================

class FallingPlatform extends FallingObject
  Placeable
  Config(User);

defaultproperties
{
     StaticAnimName="Static"
     ShakingAnimName="BreakOff"
     FallingAnimName="Fall"
     FallingObjectClass=Class'SHGame.FallingPlatform'
     DestroyObjectEmitter=Class'SHGame.Dust_Fall'
	 DestroyObjectSound=Sound'Shrek.punch_GROUND_SHAKE'
	 BreakBoneNames(0)="joint1"
	 BreakBoneNames(1)="joint2"
	 BreakBoneNames(2)="joint3"
	 BreakBoneNames(3)="joint4"
	 BreakBoneNames(4)="joint5"
     ShakingTime=1.000000
     Mesh=SkeletalMesh'EnvAnims.stairs_break1'
     CollisionRadius=120.000000
	 CollisionWidth=110.00
     CollisionHeight=20.000000
	 CollideType=CT_Box
	 bAlignBottom=False
}
