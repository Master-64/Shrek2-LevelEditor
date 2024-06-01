// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MShrekPoster2SH extends MPosters
	Config(MPak);


defaultproperties
{
	sPosterTexture="SH_Menu.Wanted_Posters.Poster2"
	Skins(0)=Texture'Shrek2_Univ_Tex.PickUps.poster2_sm'
	InventoryTypes(0)=class'ShrekPosterCollection2sh'
	Event=ShrekPoster2SHPickup
}