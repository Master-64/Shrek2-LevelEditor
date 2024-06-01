// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfObjectDetail extends MScriptedAction
	Config(MPak);


var(Action) Actor.EDetailMode ExpectedObjectDetail;
var(Action) bool bInvertCondition;


function ProceedToNextAction(ScriptedController C)
{
	C.ActionNum++;
	
	if(!bInvertCondition)
	{
		if(C.Level.DetailMode != ExpectedObjectDetail)
		{
			ProceedToSectionEnd(C);
		}
	}
	else
	{
		if(C.Level.DetailMode == ExpectedObjectDetail)
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
	local string sNot;
	
	if(bInvertCondition)
	{
		sNot = "NOT ";
	}
	else
	{
		sNot = "";
	}
	
	switch(ExpectedObjectDetail)
	{
		case DM_Low:
			return ActionString @ "-- Checking if object detail is" @ sNot $ "Low";
			
			break;
		case DM_High:
			return ActionString @ "-- Checking if object detail is" @ sNot $ "Normal";
			
			break;
		case DM_SuperHigh:
			return ActionString @ "-- Checking if object detail is" @ sNot $ "High";
			
			break;
	}
}


defaultproperties
{
	ActionString="If Object Detail"
}