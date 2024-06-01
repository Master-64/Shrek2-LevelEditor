//================================================================================
// BoxOfEnergyBars.
//================================================================================

class BoxOfEnergyBars extends SHPickupUnlit;

function AnnouncePickup(Pawn Receiver)
{
}

defaultproperties
{
     bBounceIntoPlace=True
     PickupFXClass=Class'SHGame.Health_Explod'
     AmbientFXClass=Class'SHGame.Health_Twirl'
     InventoryType=Class'SHGame.BoxOfEnergyBarsCollection'
     PickupMessage="You picked up a Box of energy bars."
     PickupSound=Sound'items.pickup_coin03'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.Energy_KegShape'
     Event="BoxOfEnergyBarsPickup"
     DrawScale=1.500000
     CollisionRadius=25.000000
	 CollisionWidth=30.00
     CollisionHeight=25.000000
	 DrawType=DT_StaticMesh
	 CollideType=CT_Box
}
