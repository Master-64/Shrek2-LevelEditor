// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfActorTouching extends MScriptedAction
	Config(MPak);


struct ActorStruct
{
	var() class<Actor> ActorClass;
	var() name ActorTag;
};

enum EConditionType
{
	CT_Any_Actors_Touching,
	CT_All_Actors_Touching,
	CT_X_Amount_Of_Actors_Touching,
	CT_No_Actors_Touching
};

var(Action) array<ActorStruct> Actors;
var(Action) ActorStruct ActorTouchCondition;
var(Action) MACTION_IfActorTouching.EConditionType ConditionType;
var(Action) int ConditionAmount;


function ProceedToNextAction(ScriptedController C)
{
	local Actor TargetActor;
	local class<Actor> TempActorClass;
	local name TempActorTag;
	local int i, i1;
	
	C.ActionNum++;
	
	GetUtils(C);
	HP = U.GetHP();
	
	if(ActorTouchCondition.ActorTag == 'CurrentPlayer')
	{
		TempActorClass = HP.Class;
		TempActorTag = HP.Tag;
	}
	else
	{
		TempActorClass = ActorTouchCondition.ActorClass;
		TempActorTag = ActorTouchCondition.ActorTag;
	}
	
	if(TempActorClass == none)
	{
		Warn(ActionString @ "-- An actor class assignment is missing; returning false");
		
		ProceedToSectionEnd(C);
	}
	
	for(i = 0; i < Actors.Length; i++)
	{
		foreach C.AllActors(Actors[i].ActorClass, TargetActor, Actors[i].ActorTag)
		{
			if(IsActorTouching(C, TargetActor, TempActorClass, TempActorTag))
			{
				i1++;
			}
		}
	}
	
	switch(ConditionType)
	{
		case CT_Any_Actors_Touching:
			if(i1 > 0)
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case CT_All_Actors_Touching:
			if(i1 >= Actors.Length)
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case CT_X_Amount_Of_Actors_Touching:
			if(i1 >= ConditionAmount)
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case CT_No_Actors_Touching:
			if(i1 <= 0)
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

function bool IsActorTouching(ScriptedController C, Actor Other, class<Actor> TouchClass, name TouchTag) // Returns with true if the actor <Other> is touching the actor with the tag <RangeTag>
{
	local Actor TargetActor;
	
	foreach Other.TouchingActors(TouchClass, TargetActor) 
	{
		if(TargetActor.Tag == TouchTag)
		{
			return true;
		}
	}
	
	return false;
}

function bool StartsSection()
{
	return true;
}

function string GetActionString()
{
	return ActionString @ "-- Comparing if" @ string(ActorTouchCondition.ActorTag) @ "and the list of actors are touching";
}


defaultproperties
{
	ActionString="If Actor Touching"
}