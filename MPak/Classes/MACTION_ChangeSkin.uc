// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_ChangeSkin extends MScriptedAction
	Config(MPak);


struct ChangeSkinStruct
{
	var() class<Actor> ActorClass;
	var() name ActorTag;
	var() array<Material> NewSkins;
	var() bool bUseDefaultSkins;
};

var(Action) array<ChangeSkinStruct> ChangeSkinActions;


function bool InitActionFor(ScriptedController C)
{
	local Actor TargetActor;
	local int i;
	
	GetUtils(C);
	HP = U.GetHP();
	
	for(i = 0; i < ChangeSkinActions.Length; i++)
	{
		if(ChangeSkinActions[i].ActorTag == 'CurrentPlayer')
		{
			TargetActor = HP;
		}
		else
		{
			if(ChangeSkinActions[i].ActorClass == none)
			{
				Warn(ActionString @ "-- An actor class assignment is missing; skipping action" @ string(i));
				
				continue;
			}
			
			foreach C.AllActors(ChangeSkinActions[i].ActorClass, TargetActor, ChangeSkinActions[i].ActorTag)
			{
				break;
			}
		}
		
		if(TargetActor == none)
		{
			Warn(ActionString @ "-- Failed to find an actor to change the skin of; skipping action" @ string(i));
			
			continue;
		}
		
		if(!ChangeSkinActions[i].bUseDefaultSkins)
		{
			TargetActor.Skins = ChangeSkinActions[i].NewSkins;
		}
		else
		{
			TargetActor.Skins = TargetActor.default.Skins;
		}
	}
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Changing the skin of" @ string(ChangeSkinActions.Length) @ "actors";
}


defaultproperties
{
	ActionString="Change Skin"
}