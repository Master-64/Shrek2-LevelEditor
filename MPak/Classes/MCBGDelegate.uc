// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// Waits for a tick, then executes a coin bonus game fix (which re-syncs the timer with the level, but does NOT continue the timer)
// This actor is used specifically for the MMutRPC mutator to make bonus levels work properly, but can be used for other purposes
// Do not make this placeable or force this actor to be physically in the map, as it's completely pointless


class MCBGDelegate extends MInfo
	Notplaceable
	Config(MPak);


auto state ExecuteFix
{
	function BeginState()
	{
		local CoinBonusGame CBG;
		
		foreach AllActors(class'CoinBonusGame', CBG)
		{
			break;
		}
		
		if(CBG != none)
		{
			CBG.coinsinlevel = 0;				// Resets/updates the total amount of coins in the level
			CBG.GotoState('WaitforGameStart');	// Restarts the mini-game
		}
		
		Destroy();
	}
}