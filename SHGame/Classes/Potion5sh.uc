//================================================================================
// Potion5sh.
//================================================================================

class Potion5sh extends SHPickupUnlit;

defaultproperties
{
     bBounceIntoPlace=True
     PickupFXClass=Class'SHGame.SpMove_Explod'
     AmbientFXClass=Class'SHGame.SpMove_Twirl'
     InventoryType=Class'SHGame.Potion5Collection'
     PickupMessage="You picked up a Potion."
     PickupSound=Sound'items.pickup_coin03'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.pixie_potion'
     Event="Potion5"
     CollisionRadius=12.000000
     CollisionHeight=19.000000
	 DrawType=DT_StaticMesh
}
