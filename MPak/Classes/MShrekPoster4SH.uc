// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MShrekPoster4SH extends MPosters
	Config(MPak);


defaultproperties
{
	sPosterTexture="SH_Menu.Wanted_Posters.Poster4"
	Skins(0)=Texture'Shrek2_Univ_Tex.PickUps.poster4_sm'
	InventoryTypes(0)=class'ShrekPosterCollection4sh'
	Event=ShrekPoster4SHPickup
}