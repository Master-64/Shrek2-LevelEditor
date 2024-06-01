//================================================================================
// PotionBottleFour.
//================================================================================

class PotionBottleFour extends PotionBottles
  Config(User);

defaultproperties
{
     DestroyEmitterName=Class'SHGame.Potion4a'
     bSpawnPotionTimerOnBlowUp=True
     bPotionBeginOnBlowUp=True
	 BreakSounds(0)=Sound'Items.potion_throw'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.Potion_Bottles.potion_4'
     CollisionRadius=7.000000
     CollisionHeight=12.000000
	 DrawType=DT_StaticMesh
}
