//================================================================================
// PotionHEA.
//================================================================================

class PotionHEA extends SHPickupUnlit;

defaultproperties
{
     bBounceIntoPlace=True
     PickupFXClass=Class'SHGame.SpMove_Explod'
     AmbientFXClass=Class'SHGame.SpMove_Twirl'
     InventoryType=Class'SHGame.PotionHEACollection'
     PickupMessage="You picked up a Potion HEA."
     PickupSound=Sound'items.pickup_coin03'
     StaticMesh=StaticMesh'4_FGM_PIB_SM.HEA_potion'
     Event="PotionHEA"
     CollisionRadius=12.000000
     CollisionHeight=19.000000
	 DrawType=DT_StaticMesh
}
