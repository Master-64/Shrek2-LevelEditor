//================================================================================
// MoneyBag.
//================================================================================

class MoneyBag extends SHPickupUnlit;

function AnnouncePickup(Pawn Receiver)
{
}

defaultproperties
{
     PickupFXClass=Class'SHGame.SpMove_Explod'
     InventoryType=Class'SHGame.MoneyBagCollection'
     PickupMessage="You picked up a MoneyBag."
     PickupSound=Sound'items.pickup_coin03'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.Potion_Bottles.MoneyBag'
     Event="MoneyBag"
     DrawScale=0.250000
     CollisionRadius=12.000000
     CollisionHeight=19.000000
	 DrawType=DT_StaticMesh
}
