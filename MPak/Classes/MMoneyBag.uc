// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MMoneyBag extends MPickup
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
	InventoryTypes(0)=class'MoneyBagCollection'
	InventoryTypes(1)=class'CoinCollection'
	iNumItems(0)=(Min=1)
	iNumItems(1)=(Min=10,Max=100)
	PickupSounds(0)=Sound'Items.pickup_coin03'
	Event=MoneyBagPickup
	PickupEmitterClass=class'SpMove_Explod'
	StaticMesh=StaticMesh'Shrek2_Univ_SM.Potion_Bottles.MoneyBag'
	DrawScale=0.25
	CollisionRadius=29.5
	CollisionHeight=22.0
}