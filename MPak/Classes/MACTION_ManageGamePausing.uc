// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_ManageGamePausing extends MScriptedAction
	Config(MPak);


var(Action) bool bAllowGamePausing;


function bool InitActionFor(ScriptedController C)
{
	GetUtils(C);
	
	if(bAllowGamePausing)
	{
		C.Level.PauseDelay = 0.0;
	}
	else
	{
		C.Level.PauseDelay = U.GetMaxFloat();
	}
	
	return false;
}

function string GetActionString()
{
	if(bAllowGamePausing)
	{
		return ActionString @ "-- Enabling the ability for the game to pause";
	}
	else
	{
		return ActionString @ "-- Disabling the ability for the game to pause";
	}
}


defaultproperties
{
	bAllowGamePausing=true
	ActionString="Manage Game Pausing"
}