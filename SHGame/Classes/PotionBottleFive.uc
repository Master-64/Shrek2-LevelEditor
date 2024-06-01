//================================================================================
// PotionBottleFive.
//================================================================================

class PotionBottleFive extends PotionBottles
  Config(User);

defaultproperties
{
     DestroyEmitterName=Class'SHGame.Potion5a'
     bSpawnPotionTimerOnBlowUp=True
     bPotionBeginOnBlowUp=True
	 BreakSounds(0)=Sound'Items.potion_throw'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.Potion_Bottles.potion_5'
     CollisionRadius=9.000000
     CollisionHeight=12.000000
	 DrawType=DT_StaticMesh
}
