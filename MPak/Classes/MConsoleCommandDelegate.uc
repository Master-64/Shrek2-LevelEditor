// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// Waits for a specific amount of time, then executes a console command
// This actor is meaningless on its own and is powered by the console commands Execute and SleepFor
// Do not make this placeable or force this actor to be physically in the map, as it's completely pointless


class MConsoleCommandDelegate extends MInfo
	Notplaceable
	Config(MPak);


var float fSleepFor;					// How long in seconds to sleep for
var array<string> ConsoleCommandsToRun; // Which console commands should be ran


state ExecuteCommands // Optionally waits the amount of seconds <fSleepFor> returns with, then executes all console commands
{
	function ExecuteCommands(array<string> CCs)
	{
		local KWHeroController PC;
		local int i;
		
		PC = KWGame(Level.Game).GetHeroController();
		
		if(PC == none)
		{
			Warn("MConsoleCommandDelegate -- Hero controller could not be found; aborting process");
			
			return;
		}
		
		for(i = 0; i < CCs.Length; i++)
		{
			PC.ConsoleCommand(CCs[i]);
		}
	}
	
	Begin:
	
	if(fSleepFor > 0.0)
	{
		Sleep(fSleepFor);
	}
	
	ExecuteCommands(ConsoleCommandsToRun);
	
	Destroy();
}