// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_LockCamTo extends MScriptedAction
	Config(MPak);


var(Action) class<Actor> TargetActorClass;
var(Action) name TargetActorTag;
var(Action) bool bLock;
var(Action) rotator LockCone;
var(Action) float fSpeed, fTightness;


function bool InitActionFor(ScriptedController C)
{
	local CamLockDelegate CL;
	local Actor TargetActor;
	
	if(TargetActorClass == none)
	{
		Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
		
		return false;
	}
	
	foreach C.AllActors(TargetActorClass, TargetActor, TargetActorTag)
	{
		break;
	}
	
	if(TargetActor == none)
	{
		Warn(ActionString @ "-- Failed to find the actor to lock the camera onto; aborting process");
		
		return false;
	}
	
	CL = C.Spawn(class'CamLockDelegate');
	CL.Init(TargetActor, LockCone, bLock, fSpeed, fTightness);
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Locking/unlocking camera onto the actor:" @ string(TargetActorTag);
}


defaultproperties
{
	TargetActorClass=class'Actor'
	bLock=true
	LockCone=(Pitch=2000,Yaw=2000,Roll=2000)
	fSpeed=8.0
	fTightness=8.0
	ActionString="Lock Cam To"
}