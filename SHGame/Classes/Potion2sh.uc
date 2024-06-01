//================================================================================
// Potion2sh.
//================================================================================

class Potion2sh extends SHPickupUnlit;

defaultproperties
{
     bBounceIntoPlace=True
     PickupFXClass=Class'SHGame.SpMove_Explod'
     AmbientFXClass=Class'SHGame.SpMove_Twirl'
     InventoryType=Class'SHGame.Potion2Collection'
     PickupMessage="You picked up a Potion."
     PickupSound=Sound'items.pickup_coin03'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.pixie_potion'
     Event="potion2"
     CollisionRadius=12.000000
     CollisionHeight=19.000000
	 DrawType=DT_StaticMesh
}
