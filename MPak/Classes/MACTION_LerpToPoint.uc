// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_LerpToPoint extends MLatentScriptedAction
	Config(MPak);


struct GetPropStruct
{
	var() class<Actor> GetActorClass;
	var() name GetActorTag;
};

var(Action) float LerpToTime;
var(Action) KWGame.enumMoveType EaseType;
var(Action) GetPropStruct LerpToTarget;
var(Action) name GetPawnTag;


function bool InitActionFor(ScriptedController C)
{
	local Actor TargetActor;
	local KWPawn TargetPawn;
	
	GetUtils(C);
	HP = U.GetHP();
	
	if(LerpToTarget.GetActorTag == 'CurrentPlayer')
	{
		TargetActor = HP;
	}
	else
	{
		if(LerpToTarget.GetActorClass == none)
		{
			Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
			
			return false;
		}
		
		foreach C.AllActors(LerpToTarget.GetActorClass, TargetActor, LerpToTarget.GetActorTag)
		{
			break;
		}
	}
	
	if(GetPawnTag == 'CurrentPlayer')
	{
		TargetPawn = KWPawn(HP);
	}
	else
	{
		foreach C.AllActors(class'KWPawn', TargetPawn, GetPawnTag)
		{
			break;
		}
	}
	
	if(TargetActor == none || TargetPawn == none)
	{
		Warn(ActionString @ "-- Failed to find either the point to lerp to, or the actor to lerp; aborting process");
		
		return false;
	}
	
	TargetPawn.DoFlyTo(TargetActor.Location, EaseType, LerpToTime);
	
	IfNonBlocking(C);
	
	if(LerpToTime > 0.0)
	{
		C.CurrentAction = self;
		C.SetTimer(LerpToTime, false);
		
		return true;
	}
	
	return false;
}

function bool CompleteWhenTimer()
{
	return true;
}

function string GetActionString()
{
	return ActionString @ "-- Making pawn '" $ string(GetPawnTag) $ "' lerp to point:" @ string(LerpToTarget.GetActorTag) @ "across" @ string(LerpToTime) @ "seconds";
}


defaultproperties
{
	ActionString="Lerp To Point"
}