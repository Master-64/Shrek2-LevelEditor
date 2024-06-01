//================================================================================
// EnergyKeg.
//================================================================================

class EnergyKeg extends SHPickupUnlit;

var() array<Material> RandSkins;

function AnnouncePickup(Pawn Receiver)
{
}

defaultproperties
{
     bBounceIntoPlace=True
     PickupFXClass=Class'SHGame.Health_Explod'
     AmbientFXClass=Class'SHGame.Health_Twirl'
     InventoryType=Class'SHGame.EnergyKegCollection'
     PickupMessage="You picked up an energy Keg."
     PickupSound=Sound'items.pickup_HeroBar'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.Energy_KegShape'
     DrawScale=1.500000
     CollisionRadius=25.000000
	 CollisionWidth=30.00
     CollisionHeight=25.000000
	 CollideType=CT_Box
	 DrawType=DT_StaticMesh
}
