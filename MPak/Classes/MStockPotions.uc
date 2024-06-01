// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MStockPotions extends MPickup
	Config(MPak);


defaultproperties
{
	PickupSounds(0)=Sound'Items.shamrock_pickup'
	AmbientEmitterClass=class'SpMove_Twirl'
	PickupEmitterClass=class'SpMove_Explod'
	DrawScale=10.0
	CollisionRadius=12.0
	CollisionHeight=19.0
}