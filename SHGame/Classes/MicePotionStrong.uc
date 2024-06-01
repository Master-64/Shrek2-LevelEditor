//================================================================================
// MicePotionStrong.
//================================================================================

class MicePotionStrong extends SHPickupUnlit;

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
     InventoryType=Class'SHGame.MicePotionStrongCollection'
     PickupMessage="You picked up a Mice Potion."
     PickupSound=Sound'items.pickup_coin03'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.mouse_potion'
     CollisionRadius=12.000000
     CollisionHeight=19.000000
	 DrawType=DT_StaticMesh
}
