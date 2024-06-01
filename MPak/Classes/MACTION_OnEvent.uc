// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_OnEvent extends MScriptedAction
	Config(MPak);


struct OnEventStruct
{
	var() class<KWPawn> PawnClass;
	var() name PawnTag, nOnEvent;
};

var(Action) array<OnEventStruct> OnEventActions;
var(Action) bool bPickRandom;


function bool InitActionFor(ScriptedController C)
{
	local int i;
	
	GetUtils(C);
	HP = U.GetHP();
	
	if(!bPickRandom)
	{
		for(i = 0; i < OnEventActions.Length; i++)
		{
			RunOnEvent(C, OnEventActions[i].PawnClass, OnEventActions[i].PawnTag, OnEventActions[i].nOnEvent);
		}
	}
	else
	{
		i = Rand(OnEventActions.Length);
		RunOnEvent(C, OnEventActions[i].PawnClass, OnEventActions[i].PawnTag, OnEventActions[i].nOnEvent);
	}
	
	return false;
}

function RunOnEvent(ScriptedController C, class<KWPawn> PawnClass, name PawnTag, name nOnEvent) // Runs an OnEvent() function on a specific actor
{
	local KWPawn TargetPawn;
	
	if(PawnTag == 'CurrentPlayer')
	{
		TargetPawn = KWPawn(HP);
	}
	else
	{
		if(PawnClass == none)
		{
			Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
			
			return;
		}
		
		foreach C.AllActors(PawnClass, TargetPawn, PawnTag)
		{
			break;
		}
	}
	
	if(TargetPawn == none)
	{
		Warn(ActionString @ "-- Failed to find a pawn to fire an OnEvent() to; aborting process");
		
		return;
	}
	
	TargetPawn.OnEvent(nOnEvent);
}

function string GetActionString()
{
	if(!bPickRandom)
	{
		return ActionString @ "-- Running OnEvent() on" @ string(OnEventActions.Length) @ "actors";
	}
	else
	{
		return ActionString @ "-- Running OnEvent() on a random actor";
	}
}


defaultproperties
{
	ActionString="On Event"
}