// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfCanSeeActor extends MScriptedAction
	Config(MPak);


var(Action) class<Actor> ActorClass;
var(Action) name ActorTag;
var(Action) bool bTraceCheck;


function ProceedToNextAction(ScriptedController C)
{
	local Actor TargetActor;
	
	C.ActionNum++;
	
	GetUtils(C);
	PC = U.GetPC();
	
	foreach C.AllActors(ActorClass, TargetActor, ActorTag)
	{
		break;
	}
	
	if(TargetActor == none)
	{
		Warn(ActionString @ "-- Failed to find the actor to check; returning false");
		
		ProceedToSectionEnd(C);
	}
	
	if(PC.Camera.CameraCanSeeYou(TargetActor.Location))
	{
		if(!bTraceCheck || (bTraceCheck && PC.Camera.FastTrace(TargetActor.Location)))
		{
			return;
		}
	}
	
	ProceedToSectionEnd(C);
}

function bool StartsSection()
{
	return true;
}

function string GetActionString()
{
	return ActionString @ "-- Checking if the actor with the tag '" $ string(ActorTag) $ "' can be seen by the player or not";
}


defaultproperties
{
	ActorClass=class'Actor'
	ActionString="If Can See Actor"
}