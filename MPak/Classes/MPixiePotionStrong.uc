// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MPixiePotionStrong extends MSpecialStockPotions
	Config(MPak);


function PostPickupLogic(Actor Other)
{
	PC = U.GetPC();
	
	if(PC.IsA('ShrekController') && U.GetHP() == Other)
	{
		ShrekController(PC).PickUpOwnedInventoryItem(class'PixiePotionStrong');
	}
}


defaultproperties
{
	InventoryTypes(0)=class'MicePotionStrongCollection'
	Event=PixiePotionStrongPickup
	StaticMesh=StaticMesh'Shrek2_Univ_SM.pixie_potion'
	CollisionRadius=12.0
	CollisionHeight=19.0
}