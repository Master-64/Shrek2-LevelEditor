//================================================================================
// ShrekPoster7sh.
//================================================================================

class ShrekPoster7sh extends SHPickup;

var() array<Material> NewSkins;

function AnnouncePickup(Pawn Receiver)
{
}

defaultproperties
{
     NewSkins(0)=Texture'Shrek2_Univ_Tex.PickUps.poster7_sm'
     PickupFXClass=Class'SHGame.Poster_Get'
     bRotating=False
     InventoryType=Class'SHGame.ShrekPosterCollection7sh'
     PickupMessage="You picked up Shrek poster."
     PickupSound=Sound'items.pickup_coin03'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.Wanted_ShrekShape'
     DrawScale=0.130000
     CollisionRadius=8.000000
     CollisionHeight=30.000000
	 DrawType=DT_StaticMesh
}
