// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfSaveGameExists extends MScriptedAction
	Config(MPak);


var(Action) array<int> ExpectedSaveGames;


function ProceedToNextAction(ScriptedController C)
{
	local int i;
	
	C.ActionNum++;
	
	GetUtils(C);
	
	for(i = 0; i < ExpectedSaveGames.Length; i++)
	{
		if(U.SaveGameExists(ExpectedSaveGames[i]))
		{
			break;
		}
		
		if(i >= (ExpectedSaveGames.Length - 1))
		{
			ProceedToSectionEnd(C);
		}
	}
}

function bool StartsSection()
{
	return true;
}

function string GetActionString()
{
	return ActionString @ "-- Checking if a save game is expected";
}


defaultproperties
{
	ActionString="If Save Game Exists"
}