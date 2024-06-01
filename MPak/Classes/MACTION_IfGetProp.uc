// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfGetProp extends MScriptedAction
	Config(MGlobalData);


enum EGetType
{
	GT_BOOL,
	GT_INT,
	GT_LESSTHAN_INT,
	GT_FLOAT,
	GT_LESSTHAN_FLOAT,
	GT_STRING,
	GT_LENGTH_STRING,
	GT_LESSTHAN_LENGTH_STRING
};

struct GetPropStruct
{
	var() class<Actor> ActorClass;
	var() name ActorTag;
	var() string Variable;
};

struct TransferPropStruct
{
	var() class<Actor> GetActorClass;
	var() name GetActorTag;
	var() string GetVariable;
};

struct OptionalVarsStruct
{
	var() bool bGetFromConsoleCommandInstead, bConditionFromGetInstead, bGetFromGlobalDataInstead, bGetCurrentGameSlot;
	var() string GetCCString;
	var() TransferPropStruct Condition_TransferProp;
	var() MGlobalData.EDataType DataType;
	var() int Slot;
};

var(Action) MACTION_IfGetProp.EGetType GetType;
var(Action) GetPropStruct GetProp;
var(Action) string Condition;
var(Action) OptionalVarsStruct OptionalVars;


function ProceedToNextAction(ScriptedController C)
{
	local Actor TargetActor;
	local string Value;
	
	C.ActionNum++;
	
	GetUtils(C);
	PC = U.GetPC();
	HP = U.GetHP();
	
	if(GetProp.ActorTag == 'CurrentPlayer')
	{
		TargetActor = HP;
	}
	else if(GetProp.ActorClass == none)
	{
		Warn(ActionString @ "-- An actor class assignment is missing; returning false");
		
		ProceedToSectionEnd(C);
	}
	
	if(!OptionalVars.bGetFromConsoleCommandInstead && !OptionalVars.bGetFromGlobalDataInstead) // Running typical Get
	{
		if(TargetActor == none)
		{
			foreach C.AllActors(GetProp.ActorClass, TargetActor, GetProp.ActorTag)
			{
				break;
			}
		}
		
		Value = TargetActor.GetPropertyText(GetProp.Variable);
	}
	else if(OptionalVars.bGetFromConsoleCommandInstead && !OptionalVars.bGetFromGlobalDataInstead) // Going to Get from console command's return value
	{
		Value = U.CC(OptionalVars.GetCCString);
	}
	else if(!OptionalVars.bGetFromConsoleCommandInstead && OptionalVars.bGetFromGlobalDataInstead) // Going to Get from global data
	{
		Value = class'MGlobalData'.static.LoadGlobalData(OptionalVars.DataType, OptionalVars.Slot, OptionalVars.bGetCurrentGameSlot);
	}
	else // Running typical Get as a backup
	{
		if(TargetActor == none)
		{
			foreach C.AllActors(GetProp.ActorClass, TargetActor, GetProp.ActorTag)
			{
				break;
			}
		}
		
		Value = TargetActor.GetPropertyText(GetProp.Variable);
	}
	
	if(OptionalVars.bConditionFromGetInstead)
	{
		if(OptionalVars.Condition_TransferProp.GetActorTag == 'CurrentPlayer')
		{
			Condition = HP.GetPropertyText(OptionalVars.Condition_TransferProp.GetVariable);
		}
		else
		{
			if(OptionalVars.Condition_TransferProp.GetActorClass == none)
			{
				Warn(ActionString @ "-- An actor class assignment is missing; returning false");
				
				ProceedToSectionEnd(C);
			}
			
			foreach C.AllActors(OptionalVars.Condition_TransferProp.GetActorClass, TargetActor, OptionalVars.Condition_TransferProp.GetActorTag)
			{
				break;
			}
			
			Condition = TargetActor.GetPropertyText(OptionalVars.Condition_TransferProp.GetVariable);
		}
	}
	
	switch(GetType)
	{
		case GT_BOOL:
			if(bool(Value) == bool(Condition))
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case GT_INT:
			if(int(Value) == int(Condition))
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case GT_LESSTHAN_INT:
			if(int(Value) <= int(Condition))
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case GT_FLOAT:
			if(float(Value) == float(Condition))
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case GT_LESSTHAN_FLOAT:
			if(float(Value) <= float(Condition))
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case GT_STRING:
			if(Value == Condition)
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case GT_LENGTH_STRING:
			if(len(Value) == len(Condition))
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case GT_LESSTHAN_LENGTH_STRING:
			if(len(Value) <= len(Condition))
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
	return ActionString @ "-- Comparing GetProp with condition";
}


defaultproperties
{
	ActionString="If Get Prop"
}