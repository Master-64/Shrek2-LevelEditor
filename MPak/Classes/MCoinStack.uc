// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCoinStack extends MPickup
	Config(MPak);


function PostPickupLogic(Actor Other)
{
	PC = U.GetPC();
	
	if(U.IsInBonusLevel())
	{
		if(PC.IsA('SHHeroController') && U.GetHP() == Other)
		{
			SHHeroController(PC).bonuscoins += iNumItems[1].Count;
			SHHeroController(PC).SaveConfig();
		}
	}
}


defaultproperties
{
	InventoryTypes(0)=class'CoinStackCollection'
	InventoryTypes(1)=class'CoinCollection'
	iNumItems(0)=(Min=1)
	iNumItems(1)=(Min=10)
	PickupSounds(0)=Sound'Items.pickup_coin03'
	Event=CoinStackPickup
	AmbientEmitterClass=class'Coin_Twirl'
	PickupEmitterClass=class'Coin_Explod'
	StaticMesh=StaticMesh'Shrek2_Univ_SM.CoinStack'
	DrawScale=0.125
	CollisionRadius=18.0
	CollisionHeight=18.0
}