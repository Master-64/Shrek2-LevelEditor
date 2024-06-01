// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_RoundRobin extends MScriptedAction
	Config(MPak);


enum ERoundType
{
	RT_Once,
	RT_Loop,
	RT_Loop_X
};

var(Action) MACTION_RoundRobin.ERoundType RoundRobinType;
var(Action) array<int> ActionNums;
var(Action) int EndActionNum, LoopIterations;
var int CurrentActionNum, LoopCount;

function bool InitActionFor(ScriptedController C)
{
	switch(RoundRobinType)
	{
		case RT_Once:
			if(CurrentActionNum < ActionNums.Length)
			{
				C.ActionNum = ActionNums[CurrentActionNum];
			}
			else
			{
				C.ActionNum = EndActionNum;
			}
			
			break;
		case RT_Loop:
			if((1 + CurrentActionNum) > ActionNums.Length)
			{
				CurrentActionNum = 0;
			}
			
			C.ActionNum = ActionNums[CurrentActionNum];
			
			break;
		case RT_Loop_X:
			if((1 + CurrentActionNum) > ActionNums.Length && LoopCount <= LoopIterations)
			{
				CurrentActionNum = 0;
				
				LoopCount++;
			}
			
			if(LoopCount > LoopIterations)
			{
				C.ActionNum = EndActionNum;
			}
			else
			{
				C.ActionNum = ActionNums[CurrentActionNum];
			}
			
			break;
	}
	
	return false;
}

function string GetActionString()
{
	switch(RoundRobinType)
	{
		case RT_Once:
			return ActionString @ "-- Once";
			
			break;
		case RT_Loop:
			return ActionString @ "-- Loop";
			
			break;
		case RT_Loop_X:
			return ActionString @ "-- Loop X amount of times";
			
			break;
	}
}


defaultproperties
{
	CurrentActionNum=-1 // This needs to be -1 from the start so that this represents the actual ActionNum (since the first ActionNum is always 0)
	LoopIterations=1
	ActionString="Round Robin"
}