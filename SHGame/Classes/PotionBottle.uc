//================================================================================
// PotionBottle.
//================================================================================

class PotionBottle extends SHPickupUnlit;

defaultproperties
{
     bBounceIntoPlace=True
     PickupFXClass=Class'SHGame.Potbot_Explod'
     AmbientFXClass=Class'SHGame.Potbot_Static'
     bRotating=False
     InventoryType=Class'SHGame.PotionBottleCollection'
     PickupMessage="You picked up a Potion Bottle."
     StaticMesh=StaticMesh'Shrek2_Univ_SM.Potion_BottleShape'
     CollisionRadius=20.000000
     CollisionHeight=21.000000
	 DrawType=DT_StaticMesh
}
