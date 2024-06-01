// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// A fork of MConsoleCommandDelegate that only changes the level
// Used from within MACTION_ChangeLevel


class MDelayLevelTransition extends MInfo
	Notplaceable
	Config(MPak);


var float fSleepFor;
var string NextLevelName;
var bool bShowLoadingImage, bTravelInventory;


state WaitForTime // Waits the amount of seconds <fSleepFor> returns with, then transitions to another level
{
	Begin:
	
	Sleep(fSleepFor);
	
	if(bShowLoadingImage)
	{
		Level.ServerTravel(NextLevelName, bTravelInventory);
	}
	else
	{
		Level.ServerTravel(NextLevelName $ "?quiet", bTravelInventory);
	}
	
	Destroy();
}