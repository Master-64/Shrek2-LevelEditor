// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MPotionHEA extends MPickup
	Config(MPak);


defaultproperties
{
	bForceNoFade=true
	InventoryTypes(0)=class'PotionHEACollection'
	PickupSounds(0)=Sound'Items.pickup_coin03'
	Event=PotionHEAPickup
	AmbientEmitterClass=class'SpMove_Twirl'
	PickupEmitterClass=class'SpMove_Explod'
	StaticMesh=StaticMesh'4_FGM_PIB_SM.HEA_potion'
	CollisionRadius=12.0
	CollisionHeight=19.0
}