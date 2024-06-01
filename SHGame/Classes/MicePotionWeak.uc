//================================================================================
// MicePotionWeak.
//================================================================================

class MicePotionWeak extends SHPickupUnlit;

var() array<Material> RandSkins;

function AnnouncePickup(Pawn Receiver)
{
}

defaultproperties
{
     RandSkins(0)=Texture'4_FGM_PIB_Tex.bottle_1'
     bBounceIntoPlace=True
     PickupFXClass=Class'SHGame.SpMove_Explod'
     AmbientFXClass=Class'SHGame.SpMove_Twirl'
     InventoryType=Class'SHGame.MicePotionWeakCollection'
     PickupMessage="You picked up a Mice Potion."
     PickupSound=Sound'items.pickup_coin03'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.mouse_potion'
     DrawScale=0.660000
     CollisionRadius=10.000000
     CollisionHeight=14.000000
	 DrawType=DT_StaticMesh
}
