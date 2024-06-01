// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfActorInRange extends MScriptedAction
	Config(MPak);


struct ActorStruct
{
	var() class<Actor> ActorClass;
	var() name ActorTag;
};

struct RangeConditionStruct
{
	var() class<Actor> ActorClass;
	var() name ActorTag;
	var() float Radius;
};

enum EConditionType
{
	CT_Any_Actors_In_Range,
	CT_All_Actors_In_Range,
	CT_X_Amount_Of_Actors_In_Range,
	CT_No_Actors_In_Range
};

var(Action) array<ActorStruct> Actors;
var(Action) RangeConditionStruct ActorRangeCondition;
var(Action) MACTION_IfActorInRange.EConditionType ConditionType;
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
	
	if(ActorRangeCondition.ActorTag == 'CurrentPlayer')
	{
		TempActorClass = HP.Class;
		TempActorTag = HP.Tag;
	}
	else
	{
		TempActorClass = ActorRangeCondition.ActorClass;
		TempActorTag = ActorRangeCondition.ActorTag;
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
			if(IsActorInRange(C, TargetActor, TempActorClass, TempActorTag, ActorRangeCondition.Radius))
			{
				i1++;
			}
		}
	}
	
	switch(ConditionType)
	{
		case CT_Any_Actors_In_Range:
			if(i1 > 0)
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case CT_All_Actors_In_Range:
			if(i1 >= Actors.Length)
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case CT_X_Amount_Of_Actors_In_Range:
			if(i1 >= ConditionAmount)
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case CT_No_Actors_In_Range:
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

function bool IsActorInRange(ScriptedController C, Actor Other, class<Actor> RangeClass, name RangeTag, float RangeRadius) // Returns with true if the actor <Other> is within the range of <RangeRadius> from the actor with the tag <RangeTag>
{
	local Actor TargetActor;
	
	foreach Other.RadiusActors(RangeClass, TargetActor, RangeRadius) 
	{
		if(TargetActor.Tag == RangeTag)
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
	return ActionString @ "-- Comparing if" @ ActorRangeCondition.ActorTag @ "and the list of actors are within a radius of" @ ActorRangeCondition.Radius @ "units of each other";
}


defaultproperties
{
	ActionString="If Actor In Range"
}