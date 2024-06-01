// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCoin extends MPickup
	Config(MPak);


function PostPickupLogic(Actor Other)
{
	local int iCoins;
	
	PC = U.GetPC();
	
	iCoins = U.GetInventoryCount(InventoryTypes[0]);
	
	if(Other.IsA('SHHeroPawn'))
	{
		if(iCoins > 0 && iCoins % 100 == 0)
		{
			SHHeroPawn(Other).PlayManyCoinsBumpLine();
		}
		else if(iCoins == 4)
		{
			SHHeroPawn(Other).PlayLowCoinsBumpLine();
		}
	}
	
	if(U.IsInBonusLevel())
	{
		if(PC.IsA('SHHeroController') && U.GetHP() == Other)
		{
			SHHeroController(PC).bonuscoins += iNumItems[0].Count;
			SHHeroController(PC).SaveConfig();
		}
	}
}


defaultproperties
{
	InventoryTypes(0)=class'CoinCollection'
	PickupSounds(0)=Sound'Items.pickup_coin01'
	PickupSounds(1)=Sound'Items.pickup_coin02'
	PickupSounds(2)=Sound'Items.pickup_coin04'
	Event=CoinPickup
	AmbientEmitterClass=class'Coin_Twirl'
	PickupEmitterClass=class'Coin_Explod'
	StaticMesh=StaticMesh'Shrek2_Univ_SM.CoinShape'
	DrawScale=0.125
	CollisionRadius=18.0
	CollisionHeight=18.0
}