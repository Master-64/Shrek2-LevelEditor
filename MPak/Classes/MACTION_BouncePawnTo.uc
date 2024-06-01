// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_BouncePawnTo extends MScriptedAction
	Config(MPak);


var(Action) class<Pawn> PawnClass;
var(Action) name PawnTag, TargetActorTag;
var(Action) class<Actor> TargetActorClass;
var(Action) float fTimeToHitTarget, fBounceSoundVolume;
var(Action) bool bCanMoveWhileJumping;
var(Action) Sound BounceSound;
var(Action) vector vTargetOffset;


function bool InitActionFor(ScriptedController C)
{
	local Pawn TargetPawn;
	local Actor TargetActor;
	
	GetUtils(C);
	HP = U.GetHP();
	
	if(PawnTag == 'CurrentPlayer')
	{
		TargetPawn = HP;
	}
	else
	{
		if(PawnClass == none)
		{
			Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
			
			return false;
		}
		
		foreach C.DynamicActors(PawnClass, TargetPawn, PawnTag)
		{
			break;
		}
	}
	
	if(TargetActorTag == 'CurrentPlayer')
	{
		TargetActor = HP;
	}
	else
	{
		if(TargetActorClass == none)
		{
			Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
			
			return false;
		}
		
		foreach C.AllActors(TargetActorClass, TargetActor, TargetActorTag)
		{
			break;
		}
	}
	
	if(TargetPawn == none || TargetActor == none)
	{
		Warn(ActionString @ "-- Failed to find either the pawn to bounce or the target to bounce to; aborting process");
		
		return false;
	}
	
	TargetPawn.SetPhysics(PHYS_Falling);
	TargetPawn.Velocity = U.ComputeTrajectoryByTime(TargetPawn.Location, TargetActor.Location + vTargetOffset, fTimeToHitTarget);
	
	if(TargetPawn.IsA('SHHeroPawn'))
	{
		SHHeroPawn(TargetPawn).OnBounceExtra(bCanMoveWhileJumping);
	}
	
	if(BounceSound != none)
	{
		U.PlayASound3D(TargetPawn,, BounceSound, fBounceSoundVolume, 8192.0, 1.0);
	}
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Bouncing pawn to point";
}


defaultproperties
{
	PawnClass=class'Pawn'
	TargetActorClass=class'Actor'
	fTimeToHitTarget=1.5
	BounceSound=Sound'items.boing_leaf'
	fBounceSoundVolume=0.4
	ActionString="Bounce Pawn To"
}