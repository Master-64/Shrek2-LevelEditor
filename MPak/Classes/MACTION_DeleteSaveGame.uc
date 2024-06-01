// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_DeleteSaveGame extends MScriptedAction
	Config(MPak);


var(Action) array<int> SaveGamesToDelete;


function bool InitActionFor(ScriptedController C)
{
	local int i;
	
	GetUtils(C);
	
	for(i = 0; i < SaveGamesToDelete.Length; i++)
	{
		if(SaveGamesToDelete[i] == -1)
		{
			U.KWDeleteSaveGame(Clamp(U.GetCurrentSaveSlot(), 0, 9999));
			
			continue;
		}
		
		U.KWDeleteSaveGame(Abs(SaveGamesToDelete[i]));
	}
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Deleting save game(s)";
}


defaultproperties
{
	ActionString="Delete Save Game"
}