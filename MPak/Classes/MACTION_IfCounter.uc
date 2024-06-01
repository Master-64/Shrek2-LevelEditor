// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfCounter extends MScriptedAction
	Config(MPak);


var(Action) int iNumToCount;
var(Action) bool bUseRandValues, bResetIfConditionTrue, bOnReset_RedoRandom;
var(Action) MinMaxStruct Rand_MinMaxValues;
var(Action) name TriggeredConditionTag;
var int iCurrentCount;
var bool bFirstRun;


function ProceedToNextAction(ScriptedController C)
{
	local TriggeredCondition TC;
	
	C.ActionNum++;
	
	iCurrentCount++;
	
	if(bResetIfConditionTrue)
	{
		foreach C.AllActors(class'TriggeredCondition', TC, TriggeredConditionTag)
		{
			break;
		}
		
		if(TC != none)
		{
			// If this is true, this action is reset and will always return false at first
			if(TC.bEnabled)
			{
				iCurrentCount = 0;
				
				if(bUseRandValues && bOnReset_RedoRandom)
				{
					iNumToCount = U.RandRangeInt(Rand_MinMaxValues.Min, Rand_MinMaxValues.Max);
					
					bFirstRun = false;
				}
			}
		}
	}
	
	if(bFirstRun && bUseRandValues)
	{
		iNumToCount = U.RandRangeInt(Rand_MinMaxValues.Min, Rand_MinMaxValues.Max);
	}
	
	bFirstRun = false;
	
	if(iNumToCount > iCurrentCount)
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
	return ActionString;
}


defaultproperties
{
	bFirstRun=true
	bOnReset_RedoRandom=true
	ActionString="If Counter"
}