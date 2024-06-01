//================================================================================
// PotionBottleEight.
//================================================================================

class PotionBottleEight extends PotionBottles
  Config(User);

defaultproperties
{
     DestroyEmitterName=Class'SHGame.Potion8a'
     bSpawnPotionTimerOnBlowUp=True
     bPotionBeginOnBlowUp=True
	 BreakSounds(0)=Sound'Items.potion_throw'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.Potion_Bottles.potion_8'
     CollisionRadius=4.000000
     CollisionHeight=12.000000
	 DrawType=DT_StaticMesh
}
