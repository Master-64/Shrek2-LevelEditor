// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MPotion4SH extends MStockPotions
	Config(MPak);


defaultproperties
{
	InventoryTypes(0)=class'Potion4Collection'
	Event=Potion4SHPickup
	StaticMesh=StaticMesh'Shrek2_Univ_SM.Potion_Bottles.potion_4'
}