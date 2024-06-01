// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MEnergyKeg extends MEnergyBar
	Config(MPak);


var() bool bDoNotFullHeal;


function PostPickupLogic(Actor Other)
{
	if(!bDoNotFullHeal)
	{
		U.SetHealth(Pawn(Other), U.GetMaxHealth(Pawn(Other)));
	}
	else
	{
		super.PostPickupLogic(Other);
	}
	
	TryBumpline(Other);
}


defaultproperties
{
	InventoryTypes(0)=class'EnergyKegCollection'
	Event=EnergyKegPickup
	StaticMesh=StaticMesh'Shrek2_Univ_SM.Energy_KegShape'
	DrawScale=1.5
	CollisionRadius=25.0
	CollisionHeight=25.0
	CollisionWidth=30.0
}