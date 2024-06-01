// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_LocalizeData extends MScriptedAction
	Config(MPak);


struct SetPropStruct
{
	var() class<Actor> ActorClass;
	var() name ActorTag;
	var() string Variable;
};

struct LocalizeStruct
{
	var() string SectionName, Key, FileName;
};

struct ActionStruct
{
	var() LocalizeStruct Localize;
	var() SetPropStruct SetProp;
};

var(Action) array<ActionStruct> LocalizeActions;


function bool InitActionFor(ScriptedController C)
{
	local Actor TargetActor;
	local int i;
	
	for(i = 0; i < LocalizeActions.Length; i++)
	{
		if(LocalizeActions[i].SetProp.ActorClass == none)
		{
			Warn(ActionString @ "-- An actor class assignment is missing; skipping action" @ string(i));
			
			continue;
		}
		
		foreach C.AllActors(LocalizeActions[i].SetProp.ActorClass, TargetActor, LocalizeActions[i].SetProp.ActorTag)
		{
			break;
		}
		
		if(TargetActor == none)
		{
			Warn(ActionString @ "-- Failed to find the actor to transfer the localized data to; skipping action" @ string(i));
			
			continue;
		}
		
		TargetActor.SetPropertyText(LocalizeActions[i].SetProp.Variable, Localize(LocalizeActions[i].Localize.SectionName, LocalizeActions[i].Localize.Key, LocalizeActions[i].Localize.FileName)); // Pulls from <FileName>, gets its data, then transfers that data to the actor specified
	}
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Transferring" @ string(LocalizeActions.Length) @ "bits of localized data to various specified actors";
}


defaultproperties
{
	ActionString="Localize Data"
}