//================================================================================
// Shamrock.
//================================================================================

class Shamrock extends SHPickupUnlit;

var() array<Material> RandSkins;

function AnnouncePickup(Pawn Receiver)
{
}

defaultproperties
{
     bBounceIntoPlace=True
     InventoryType=Class'SHGame.ShamrockCollection'
     PickupMessage="You picked up an Shamrock."
     PickupSound=Sound'items.PickupShamrock'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.ShamrockShape'
     DrawScale=0.350000
     CollisionRadius=20.000000
	 CollisionWidth=4.00
     CollisionHeight=20.000000
	 CollideType=CT_Box
	 DrawType=DT_StaticMesh
}
