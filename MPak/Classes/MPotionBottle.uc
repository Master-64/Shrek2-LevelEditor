// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MPotionBottle extends MPickup
	Config(MPak);


defaultproperties
{
	PrePivot=(Z=10.0)
	InventoryTypes(0)=class'PotionBottleCollection'
	PickupSounds(0)=Sound'Items.shamrock_pickup'
	Event=PotionBottlePickup
	AmbientEmitterClass=class'Potbot_Static'
	PickupEmitterClass=class'Potbot_Explod'
	StaticMesh=StaticMesh'Shrek2_Univ_SM.Potion_BottleShape'
	DrawScale=0.66
	CollisionRadius=12.0
	CollisionHeight=19.0
}