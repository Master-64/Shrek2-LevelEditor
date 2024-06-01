// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfCurrentLevelTime extends MScriptedAction
	Config(MPak);


var(Action) float fExpectedTimeElapsed;
var(Action) bool bInvertCondition;


function ProceedToNextAction(ScriptedController C)
{
	C.ActionNum++;
	
	if((!bInvertCondition && C.Level.TimeSeconds < fExpectedTimeElapsed) || (bInvertCondition && C.Level.TimeSeconds > fExpectedTimeElapsed))
	{
		ProceedToSectionEnd(C);
	}
}

function bool StartsSection()
{
	return true;
}

function string GetActionString()
{
	if(!bInvertCondition)
	{
		return ActionString @ "-- Checking if the current level timer has elapsed more than" @ string(fExpectedTimeElapsed) @ "seconds";
	}
	else
	{
		return ActionString @ "-- Checking if the current level timer has elapsed less than" @ string(fExpectedTimeElapsed) @ "seconds";
	}
}


defaultproperties
{
	ActionString="If Current Level Time"
}