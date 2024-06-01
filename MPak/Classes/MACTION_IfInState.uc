// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfInState extends MScriptedAction
	Config(MPak);


var(Action) class<Actor> ActorClass;
var(Action) name ActorTag, StateName;
var(Action) bool bControllerContext;


function ProceedToNextAction(ScriptedController C)
{
	local Actor TargetActor;
	
	C.ActionNum++;
	
	GetUtils(C);
	HP = U.GetHP();
	
	if(ActorTag == 'CurrentPlayer')
	{
		TargetActor = HP;
	}
	else
	{
		if(ActorClass == none)
		{
			Warn(ActionString @ "-- An actor class assignment is missing; returning false");
			
			ProceedToSectionEnd(C);
		}
		
		foreach C.AllActors(ActorClass, TargetActor, ActorTag)
		{
			break;
		}
	}
	
	if(TargetActor == none)
	{
		Warn(ActionString @ "-- Failed to find the actor to check; returning false");
		
		ProceedToSectionEnd(C);
	}
	
	if(!bControllerContext)
	{
		if(TargetActor.IsInState(StateName))
		{
			return;
		}
		else
		{
			ProceedToSectionEnd(C);
		}
	}
	else
	{
		if(Pawn(TargetActor).Controller.IsInState(StateName))
		{
			return;
		}
		else
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
	return ActionString @ "-- Checking if" @ string(ActorTag) @ "is in the state" @ string(StateName) $ ". Using controller context:" @ U.BoolToString(bControllerContext);
}


defaultproperties
{
	ActorClass=class'Actor'
	ActionString="If In State"
}