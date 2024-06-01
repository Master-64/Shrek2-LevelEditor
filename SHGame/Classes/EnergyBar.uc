//================================================================================
// EnergyBar.
//================================================================================

class EnergyBar extends SHPickupUnlit;

function AnnouncePickup(Pawn Receiver)
{
}

defaultproperties
{
     bBounceIntoPlace=True
     PickupFXClass=Class'SHGame.Health_Explod'
     AmbientFXClass=Class'SHGame.Health_Twirl'
     InventoryType=Class'SHGame.EnergyBarCollection'
     PickupMessage="You picked up an energy bar."
     PickupSound=Sound'items.pickup_HeroBar'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.Energy_BarShape'
     DrawScale=1.250000
     CollisionRadius=10.000000
	 CollisionWidth=25.00
     CollisionHeight=18.000000
	 CollideType=CT_Box
	 DrawType=DT_StaticMesh
}
