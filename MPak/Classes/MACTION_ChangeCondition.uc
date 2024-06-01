// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_ChangeCondition extends MScriptedAction
	Config(MPak);


var(Action) bool bNewCondition, bToggleInstead;
var(Action) name TriggeredConditionTag;
var TriggeredCondition TempTC;


function bool InitActionFor(ScriptedController C)
{
	local TriggeredCondition TC;
	
	GetUtils(C);
	
	foreach C.DynamicActors(class'TriggeredCondition', TC, TriggeredConditionTag)
	{
		break;
	}
	
	if(TC != none)
	{
		if(!bToggleInstead)
		{
			TC.bEnabled = bNewCondition;
		}
		else
		{
			TC.bEnabled = !TC.bEnabled;
		}
		
		TempTC = TC;
	}
	
	return false;
}

function string GetActionString()
{
	if(!bToggleInstead)
	{
		return ActionString @ "-- Set condition" @ string(TriggeredConditionTag) @ "to equal" @ U.BoolToString(bNewCondition);
	}
	else
	{
		return ActionString @ "-- Toggled condition" @ string(TriggeredConditionTag) @ "to equal" @ U.BoolToString(TempTC.bEnabled);
	}
}


defaultproperties
{
	ActionString="Change Condition"
}