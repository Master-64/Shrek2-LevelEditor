// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfComplexRandomPct extends MScriptedAction
	Config(MPak);


struct RandStruct
{
	var() int ActionNum;
	var() int Weight;
};

var(Action) array<RandStruct> RandActionNums;
var(Action) bool bWeightedOdds;


function ProceedToNextAction(ScriptedController C)
{
	local int i, RandNum, TotalWeight;
	
	if(!bWeightedOdds)
	{
		RandNum = Rand(RandActionNums.Length);
		C.ActionNum = Max(0, RandActionNums[RandNum].ActionNum);
	}
	else
	{
		for(i = 0; i < RandActionNums.Length; i++) // Gets the total weight of all entries in the array
		{
			TotalWeight += RandActionNums[i].Weight;
		}
		
		RandNum = Rand(TotalWeight); // Picks a random number
		
		for(i = 0; i < RandActionNums.Length; i++) // Picks a random action based on the weights
		{
			if(RandNum < RandActionNums[i].Weight)
			{
				C.ActionNum = Max(0, RandActionNums[i].ActionNum); // We found the action that corresponds with the random number
				
				break;
			}
			
			RandNum -= RandActionNums[i].Weight; // Didn't find the action yet; iterate again
		}
	}
}

function string GetActionString()
{
	if(!bWeightedOdds)
	{
		return ActionString @ "-- Non-weighted odds";
	}
	else
	{
		return ActionString @ "-- Weighted odds";
	}
}


defaultproperties
{
	ActionString="If Complex Random Pct"
}