// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_TriggerRandomEvent extends MScriptedAction
	Config(MPak);


struct RandStruct
{
	var() name Event;
	var() int Weight;
};

var(Action) array<RandStruct> RandEvents;
var(Action) bool bWeightedOdds;


function bool InitActionFor(ScriptedController C)
{
	local int i, RandNum, TotalWeight;
	
	if(!bWeightedOdds)
	{
		RandNum = Rand(RandEvents.Length);
		C.TriggerEvent(RandEvents[RandNum].Event, C.SequenceScript, C.GetInstigator());
	}
	else
	{
		for(i = 0; i < RandEvents.Length; i++) // Gets the total weight of all entries in the array
		{
			TotalWeight += RandEvents[i].Weight;
		}
		
		RandNum = Rand(TotalWeight); // Picks a random number
		
		for(i = 0; i < RandEvents.Length; i++) // Picks a random action based on the weights
		{
			if(RandNum < RandEvents[i].Weight)
			{
				C.TriggerEvent(RandEvents[i].Event, C.SequenceScript, C.GetInstigator()); // We found the action that corresponds with the random number
				
				break;
			}
			
			RandNum -= RandEvents[i].Weight; // Didn't find the action yet; iterate again
		}
	}
	
	return false;
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
	ActionString="Trigger Random Event"
}