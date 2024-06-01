// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_ChangeState extends MScriptedAction
	Config(MPak);


struct ChangeStateStruct
{
	var() class<Actor> ActorClass;
	var() name ActorTag;
	var() name nNewState;
	var() bool bControllerContext;
};

var(Action) array<ChangeStateStruct> ChangeStateActions;


function bool InitActionFor(ScriptedController C)
{
	local Actor TargetActor;
	local int i;
	
	GetUtils(C);
	HP = U.GetHP();
	
	for(i = 0; i < ChangeStateActions.Length; i++)
	{
		if(ChangeStateActions[i].ActorTag == 'CurrentPlayer')
		{
			TargetActor = HP;
		}
		else
		{
			if(ChangeStateActions[i].ActorClass == none)
			{
				Warn(ActionString @ "-- An actor class assignment is missing; skipping action" @ string(i));
				
				continue;
			}
			
			foreach C.AllActors(ChangeStateActions[i].ActorClass, TargetActor, ChangeStateActions[i].ActorTag)
			{
				break;
			}
		}
		
		if(TargetActor == none)
		{
			Warn(ActionString @ "-- Failed to find an actor to change the state of; skipping action" @ string(i));
			
			continue;
		}
		
		if(!ChangeStateActions[i].bControllerContext)
		{
			TargetActor.GotoState(ChangeStateActions[i].nNewState);
		}
		else
		{
			Pawn(TargetActor).Controller.GotoState(ChangeStateActions[i].nNewState);
		}
	}
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Changing the state of" @ string(ChangeStateActions.Length) @ "actors";
}


defaultproperties
{
	ActionString="Change State"
}