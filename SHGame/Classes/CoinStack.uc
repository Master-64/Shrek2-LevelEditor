//================================================================================
// CoinStack.
//================================================================================

class CoinStack extends SHPickupUnlit;

var() int NumberOfCoins;

function AnnouncePickup(Pawn Receiver)
{
}

defaultproperties
{
     NumberOfCoins=10
     PickupFXClass=Class'SHGame.Coin_Explod'
     AmbientFXClass=Class'SHGame.Coin_Twirl'
     InventoryType=Class'SHGame.CoinStackCollection'
     PickupMessage="You picked up a coin."
     PickupSound=Sound'items.pickup_coin03'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.CoinStack'
     Event="CoinStackPickup"
     DrawScale=0.130000
     CollisionRadius=18.000000
     CollisionHeight=18.000000
     bBlockActors=False
	 DrawType=DT_StaticMesh
}
