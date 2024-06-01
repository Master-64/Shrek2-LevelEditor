// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCUTACTION_CC extends KWScriptedAction
	Config(MPak);


var string sConsoleCommand;


function bool InitActionFor(KWCutController C)
{
	KWGame(C.Level.Game).GetHeroController().ConsoleCommand(sConsoleCommand);
	
	return false;
}

function SerializeFrom(string args)
{
	sConsoleCommand = args;
}

function string GetActionString()
{
	return ActionString;
}


defaultproperties
{
	ActionString="CC"
}