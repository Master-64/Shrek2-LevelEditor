//================================================================================
// Coin.
//================================================================================

class Coin extends SHPickupUnlit;

var() array<Sound> pickupSounds;

function AnnouncePickup(Pawn Receiver)
{
}

defaultproperties
{
     pickupSounds(0)=Sound'Items.pickup_coin01'
     pickupSounds(1)=Sound'Items.pickup_coin02'
     pickupSounds(2)=Sound'Items.pickup_coin04'
	 PickupFXClass=Class'SHGame.Coin_Explod'
     AmbientFXClass=Class'SHGame.Coin_Twirl'
     InventoryType=Class'SHGame.CoinCollection'
     PickupMessage="You picked up a coin."
     PickupSound=Sound'items.pickup_coin01'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.CoinShape'
     Event="CoinPickup"
     DrawScale=0.130000
     CollisionRadius=18.000000
     CollisionHeight=18.000000
     bBlockActors=False
	 DrawType=DT_StaticMesh
}
