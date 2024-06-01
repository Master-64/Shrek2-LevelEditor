// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_Teleport extends MScriptedAction
	Config(MPak);


var(Action) class<Actor> ActorClass, TargetActorClass;
var(Action) name ActorTag, TargetActorTag;
var(Action) bool bRotateToPoint, bTeleportAdjustZOnly;
var(Action) Sound TeleportSound, TeleportFailedSound;
var(Action) float fTeleportSoundVolume;
var(Action) int iTeleportAdjustRetryAttempts;


function bool InitActionFor(ScriptedController C)
{
	local Actor TargetActor1, TargetActor2;
	
	GetUtils(C);
	HP = U.GetHP();
	Cam = U.GetCam();
	
	if(ActorTag == 'CurrentPlayer')
	{
		TargetActor1 = HP;
	}
	else
	{
		if(ActorClass == none)
		{
			Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
			
			return false;
		}
		
		foreach C.DynamicActors(ActorClass, TargetActor1, ActorTag)
		{
			break;
		}
	}
	
	if(TargetActorTag == 'CurrentPlayer')
	{
		TargetActor2 = HP;
	}
	else
	{
		if(TargetActorClass == none)
		{
			Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
			
			return false;
		}
		
		foreach C.AllActors(TargetActorClass, TargetActor2, TargetActorTag)
		{
			break;
		}
	}
	
	if(TargetActor1 == none || TargetActor2 == none)
	{
		Warn(ActionString @ "-- Failed to find either the actor to teleport or the target to teleport to; aborting process");
		
		return false;
	}
	
	if(!U.MFancySetLocation(TargetActor1, TargetActor2.Location, iTeleportAdjustRetryAttempts, bTeleportAdjustZOnly))
	{
		Warn(ActionString @ "-- Failed to teleport; aborting process");
		
		if(TeleportFailedSound != none)
		{
			U.PlayASound3D(TargetActor1,, TeleportFailedSound, fTeleportSoundVolume, 8192.0, 1.0);
		}
		
		return false;
	}
	
	if(bRotateToPoint)
	{
		U.FancySetRotation(TargetActor1, TargetActor2.Rotation);
		
		if(HP == TargetActor1)
		{
			Cam.SetRot(TargetActor2.Rotation);
		}
	}
	
	if(TeleportSound != none)
	{
		U.PlayASound3D(TargetActor1,, TeleportSound, fTeleportSoundVolume, 8192.0, 1.0);
	}
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Teleporting actor to point:" @ string(TargetActorTag);
}


defaultproperties
{
	ActorClass=class'Actor'
	TargetActorClass=class'Actor'
	bRotateToPoint=true
	TeleportSound=Sound'soundeffects.transform_poof'
	TeleportFailedSound=Sound'UI.PotionUI_cancel'
	fTeleportSoundVolume=0.4
	iTeleportAdjustRetryAttempts=28
	ActionString="Teleport"
}