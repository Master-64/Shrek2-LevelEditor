// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_PawnLookAt extends MScriptedAction
	Config(MPak);


var(Action) class<KWPawn> PawnClass;
var(Action) name PawnTag, DestinationTag;
var(Action) class<Actor> DestinationActorClass;
var(Action) bool bTrack, bLookAt;


function bool InitActionFor(ScriptedController C)
{
	local KWPawn TargetPawn;
	local Actor TargetActor;
	
	GetUtils(C);
	HP = U.GetHP();
	
	if(PawnTag == 'CurrentPlayer')
	{
		TargetPawn = KWPawn(HP);
	}
	else
	{
		if(PawnClass == none)
		{
			Warn(ActionString @ "-- A pawn class assignment is missing; aborting process");
			
			return false;
		}
		
		foreach C.DynamicActors(PawnClass, TargetPawn, PawnTag)
		{
			break;
		}
	}
	
	if(TargetPawn == none)
	{
		Warn(ActionString @ "-- Failed to find the pawn for looking; aborting process");
		
		return false;
	}
	
	if(!bLookAt)
	{
		TargetPawn.HeadLookEnable(false);
		
		return false;
	}
	
	if(DestinationTag == 'CurrentPlayer')
	{
		TargetActor = HP;
	}
	else
	{
		if(DestinationActorClass == none)
		{
			Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
			
			return false;
		}
		
		foreach C.AllActors(DestinationActorClass, TargetActor, DestinationTag)
		{
			break;
		}
	}
	
	if(TargetActor == none)
	{
		Warn(ActionString @ "-- Failed to find the actor to look to; aborting process");
		
		return false;
	}
	
	TargetPawn.HeadLookEnable(true);
	TargetPawn.HeadLookSetParameters(bTrack, false);
	TargetPawn.HeadLookLockOnActor(TargetActor);
	
	return false;
}

function string GetActionString()
{
	if(bLookAt)
	{
		return ActionString @ "-- Making pawn" @ string(PawnTag) @ "look toward actor" @ string(DestinationTag);
	}
	else
	{
		return ActionString @ "-- Making pawn" @ string(PawnTag) @ "stop looking at an actor";
	}
}


defaultproperties
{
	PawnClass=class'KWPawn'
	DestinationActorClass=class'Actor'
	bLookAt=true
	ActionString="Pawn Look At"
}