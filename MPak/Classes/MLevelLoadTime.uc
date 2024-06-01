// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MLevelLoadTime extends MInfo
	Config(MPak);


#exec TEXTURE IMPORT NAME=MTimer FILE=Textures\MTimer.dds FLAGS=2


var() float fLevelLoadTime;


function GetLevelLoadTime()
{
	PC = U.GetPC();
	
	if(!(PC.IsA('SHHeroController')))
	{
		Warn("MLevelLoadTime -- The player is not using a SHHeroController; aborting process");
		
		return;
	}
	
	fLevelLoadTime = Level.TimeSeconds - SHHeroController(PC).TimeAfterLoading;
	
	Log("MLevelLoadTime -- This level took" @ string(fLevelLoadTime) @ "seconds to load");
}

auto state WaitForLevelLoadTimeCalculation
{
	Begin:
	
	GetLevelLoadTime();
	
	GotoState('');
}


defaultproperties
{
	Texture=Texture'MTimer'
}