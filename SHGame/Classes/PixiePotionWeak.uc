//================================================================================
// PixiePotionWeak.
//================================================================================

class PixiePotionWeak extends SHPickupUnlit;

var() array<Material> RandSkins;

function AnnouncePickup(Pawn Receiver)
{
}

defaultproperties
{
     RandSkins(0)=Texture'4_FGM_PIB_Tex.bottle_2'
     bBounceIntoPlace=True
     PickupFXClass=Class'SHGame.SpMove_Explod'
     AmbientFXClass=Class'SHGame.SpMove_Twirl'
     InventoryType=Class'SHGame.PixiePotionWeakCollection'
     PickupMessage="You picked up a Pixie Potion."
     PickupSound=Sound'items.pickup_coin03'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.pixie_potion'
     DrawScale=0.660000
     CollisionRadius=10.000000
     CollisionHeight=14.000000
	 DrawType=DT_StaticMesh
}
