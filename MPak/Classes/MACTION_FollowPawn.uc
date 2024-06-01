// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_FollowPawn extends MScriptedAction
	Config(MPak);


struct FollowStruct
{
	var() class<KWPawn> LeaderClass;
	var() name LeaderFollowTag;
	var() class<KWPawn> FollowerClass;
	var() name FollowerTag;
	var() bool bStopFollowing;
};

var(Action) array<FollowStruct> FollowActions;
var(Action)	bool bPickRandom;


function bool InitActionFor(ScriptedController C)
{
	local int i;
	
	GetUtils(C);
	HP = U.GetHP();
	
	if(!bPickRandom)
	{
		for(i = 0; i < FollowActions.Length; i++)
		{
			FollowPawn(C, i);
		}
	}
	else
	{
		FollowPawn(C, Rand(FollowActions.Length));
	}
	
	return false;
}

function FollowPawn(ScriptedController C, int Index)
{
	local KWPawn TargetPawn1, TargetPawn2;
	
	if(!FollowActions[Index].bStopFollowing)
	{
		if(FollowActions[Index].LeaderFollowTag == 'CurrentPlayer')
		{
			TargetPawn1 = KWPawn(HP);
		}
		else
		{
			if(FollowActions[Index].LeaderClass == none)
			{
				Warn(ActionString @ "-- An actor class assignment is missing; skipping action" @ string(Index));
				
				return;
			}
			
			foreach C.DynamicActors(FollowActions[Index].LeaderClass, TargetPawn1, FollowActions[Index].LeaderFollowTag)
			{
				break;
			}
		}
		
		if(FollowActions[Index].FollowerClass == none)
		{
			Warn(ActionString @ "-- An actor class assignment is missing; skipping action" @ string(Index));
			
			return;
		}
		
		foreach C.DynamicActors(FollowActions[Index].FollowerClass, TargetPawn2, FollowActions[Index].FollowerTag)
		{
			break;
		}
		
		if(TargetPawn1 == none || TargetPawn2 == none)
		{
			Warn(ActionString @ "-- Failed to find a leader or follower pawn; skipping action" @ string(Index));
			
			return;
		}
		
		TargetPawn1.AddTrailingChar(TargetPawn2); // Adds a new follower for the leader
	}
	else
	{
		foreach C.DynamicActors(FollowActions[Index].FollowerClass, TargetPawn2, FollowActions[Index].FollowerTag)
		{
			break;
		}
		
		if(TargetPawn2 == none)
		{
			Warn(ActionString @ "-- Failed to find a follower pawn; skipping action" @ string(Index));
			
			return;
		}
		
		TargetPawn2.KWAIController.StopTrailingLeadChar(true); // Makes the follower stop following anyone its following currently
	}
}

function string GetActionString()
{
	if(!bPickRandom)
	{
		return ActionString @ "-- Executing" @ string(FollowActions.Length) @ "actions";
	}
	else
	{
		return ActionString @ "-- Executing random action";
	}
}


defaultproperties
{
	ActionString="Follow Pawn"
}