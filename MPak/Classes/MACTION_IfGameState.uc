// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfGameState extends MScriptedAction
	Config(MPak);


var(Action) array<string> ExpectedGameStates;


function ProceedToNextAction(ScriptedController C)
{
	local string GSTATE;
	local int i;
	
	C.ActionNum++;
	
	GSTATE = KWGame(C.Level.Game).CurrentGameState;
	
	for(i = 0; i < ExpectedGameStates.Length; i++)
	{
		if(Caps(ExpectedGameStates[i]) == GSTATE)
		{
			break;
		}
		
		if(i >= (ExpectedGameStates.Length - 1))
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
	return ActionString @ "-- Checking if the current game state is expected";
}


defaultproperties
{
	ExpectedGameStates(0)="GSTATE000"
	ActionString="If Game State"
}