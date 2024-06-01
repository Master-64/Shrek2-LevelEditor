//================================================================================
// BigStairsThree.
//================================================================================

class BigStairsThree extends FallingObject
  Placeable
  Config(User);

defaultproperties
{
     StaticAnimName="Static"
     ShakingAnimName="BreakOff"
     FallingAnimName="Fall"
     FallingObjectClass=Class'SHGame.BigStairsThree'
     DestroyObjectEmitter=Class'SHGame.Dust_Fall'
	 DestroyObjectSound=Sound'Shrek.punch_GROUND_SHAKE'
     ShakingTime=1.000000
     Mesh=SkeletalMesh'EnvAnims.stairs_big_break3'
     CollisionRadius=40.000000
	 CollisionWidth=130.00
     CollisionHeight=16.000000
	 CollideType=CT_Box
	 bAlignBottom=False
}
