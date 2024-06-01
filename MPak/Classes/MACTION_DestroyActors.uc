// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_DestroyActors extends MScriptedAction
	Config(MPak);


struct DestroyStruct
{
	var() class<Actor> DestroyActorClass;
	var() name DestroyTag;
};

var(Action) array<DestroyStruct> DestroyActions;
var(Action) bool bPickRandom, bSoftDestroy, bSoftDestroy_Force, bOnlyDestroyFirst;


function bool InitActionFor(ScriptedController C)
{
	local int i;
	
	GetUtils(C);
	
	if(!bPickRandom)
	{
		for(i = 0; i < DestroyActions.Length; i++)
		{
			DestroyActor(C, DestroyActions[i].DestroyActorClass, DestroyActions[i].DestroyTag);
		}
	}
	else
	{
		i = Rand(DestroyActions.Length);
		DestroyActor(C, DestroyActions[i].DestroyActorClass, DestroyActions[i].DestroyTag);
	}
	
	return false;
}

function DestroyActor(ScriptedController C, class<Actor> DestroyActorClass, name DestroyTag) // Destroys a specified actor
{
	local Actor TargetActor;
	
	if(DestroyActorClass == none)
	{
		Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
		
		return;
	}
	
	foreach C.AllActors(DestroyActorClass, TargetActor, DestroyTag)
	{
		if(!(bSoftDestroy && TargetActor.IsA('KWPawn')))
		{
			U.FancyDestroy(TargetActor);
		}
		else
		{
			if(!bSoftDestroy_Force && !KWPawn(TargetActor).bDespawnable)
			{
				continue;
			}
			else if(bSoftDestroy_Force)
			{
				KWPawn(TargetActor).bDespawnable = true;
			}
			
			KWPawn(TargetActor).SetDespawnFlag();
		}
		
		if(bOnlyDestroyFirst)
		{
			break;
		}
	}
}

function string GetActionString()
{
	if(!bPickRandom)
	{
		return ActionString @ "-- Destroying" @ string(DestroyActions.Length) @ "actors";
	}
	else
	{
		return ActionString @ "-- Destroying a random actor";
	}
}


defaultproperties
{
	ActionString="Destroy Actors"
}