// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfActorExists extends MScriptedAction
	Config(MPak);


enum EExistType
{
	ET_DOES_EXIST,
	ET_DO_MORE_THAN_X_EXIST,
	ET_DOES_ONLY_X_AMOUNT_EXIST
};

var(Action) MACTION_IfActorExists.EExistType ExistType;
var(Action) int ConditionValue;
var(Action) class<Actor> ActorClass;
var(Action) name ActorTag;


function ProceedToNextAction(ScriptedController C)
{
	local Actor TargetActor;
	local int i;
	
	C.ActionNum++;
	
	if(ActorClass == none)
	{
		Warn(ActionString @ "-- An actor class assignment is missing; returning false");
		
		ProceedToSectionEnd(C);
	}
	
	foreach C.AllActors(ActorClass, TargetActor, ActorTag)
	{
		i++;
	}
	
	switch(ExistType)
	{
		case ET_DOES_EXIST:
			if(i > 0)
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case ET_DO_MORE_THAN_X_EXIST:
			if(i > ConditionValue)
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case ET_DOES_ONLY_X_AMOUNT_EXIST:
			if(i == ConditionValue)
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
	}
}

function bool StartsSection()
{
	return true;
}

function string GetActionString()
{
	switch(ExistType)
	{
		case ET_DOES_EXIST:
			return ActionString @ "-- Does" @ string(ActorTag) @ "exist";
			
			break;
		case ET_DO_MORE_THAN_X_EXIST:
			return ActionString @ "-- Do more than" @ string(ConditionValue) @ string(ActorTag) @ "exist";
			
			break;
		case ET_DOES_ONLY_X_AMOUNT_EXIST:
			return ActionString @ "-- Does only" @ string(ConditionValue) @ string(ActorTag) @ "exist";
			
			break;
	}
	
}


defaultproperties
{
	ActorClass=class'Actor'
	ActionString="If Actor Exists"
}