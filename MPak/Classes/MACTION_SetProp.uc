// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_SetProp extends MScriptedAction
	Config(MGlobalData);


enum ELogicType
{
	LT_SetProp,
	LT_SetPropRand,
	LT_AddProp,
	LT_AddPropRand,
	LT_TransferProp
};

enum ERandType
{
	RT_BOOL,
	RT_INT,
	RT_FLOAT
};

struct RandVarStruct
{
	var() MACTION_SetProp.ERandType RandType;
	var() MinMaxSStruct MinMaxValues;
};

struct TransferPropStruct
{
	var() class<Actor> GetActorClass;
	var() name GetActorTag;
	var() string GetVariable;
};

struct OptionalVarsStruct
{
	var() RandVarStruct RandomVars;
	var() TransferPropStruct TransferProp;
	var() bool bControllerContext, bAddProp_MultiplyInstead;
};

struct SetPropStruct
{
	var() MACTION_SetProp.ELogicType LogicType;
	var() class<Actor> ActorClass;
	var() name ActorTag;
	var() string Variable, Value;
	var() OptionalVarsStruct ActorProps;
};

var(Action) array<SetPropStruct> SetPropActions;
var(Action) bool bPickRandom;


function bool InitActionFor(ScriptedController C)
{
	local Actor TargetActor1, TargetActor2;
	local bool b1;
	local int i, i1, i2, i3, RandInt;
	local float f1, f2, RandFloat;
	
	GetUtils(C);
	HP = U.GetHP();
	
	for(i = 0; i < SetPropActions.Length; i++)
	{
		if(bPickRandom)
		{
			i = Rand(SetPropActions.Length);
		}
		
		if(SetPropActions[i].ActorTag == 'CurrentPlayer')
		{
			TargetActor1 = HP;
		}
		else
		{
			if(SetPropActions[i].ActorClass == none && SetPropActions[i].ActorProps.TransferProp.GetActorClass != none)
			{
				SetPropActions[i].ActorClass = SetPropActions[i].ActorProps.TransferProp.GetActorClass;
				SetPropActions[i].ActorTag = SetPropActions[i].ActorProps.TransferProp.GetActorTag;
			}
			
			if(SetPropActions[i].ActorClass == none)
			{
				Warn(ActionString @ "-- An actor class assignment is missing; skipping action" @ string(i));
				
				continue;
			}
			
			foreach C.AllActors(SetPropActions[i].ActorClass, TargetActor1, SetPropActions[i].ActorTag)
			{
				break;
			}
		}
		
		if(SetPropActions[i].LogicType == LT_TransferProp)
		{
			if(SetPropActions[i].ActorProps.TransferProp.GetActorTag == 'CurrentPlayer')
			{
				TargetActor2 = HP;
			}
			else
			{
				if(SetPropActions[i].ActorProps.TransferProp.GetActorClass == none)
				{
					Warn(ActionString @ "-- An actor class assignment is missing; skipping action" @ string(i));
					
					break;
				}
				
				foreach C.AllActors(SetPropActions[i].ActorProps.TransferProp.GetActorClass, TargetActor2, SetPropActions[i].ActorProps.TransferProp.GetActorTag)
				{
					break;
				}
			}
		}
		
		switch(SetPropActions[i].LogicType)
		{
			case LT_SetProp:
				if(!SetPropActions[i].ActorProps.bControllerContext)
				{
					TargetActor1.SetPropertyText(SetPropActions[i].Variable, SetPropActions[i].Value);
				}
				else
				{
					Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, SetPropActions[i].Value);
				}
				
				break;
			case LT_SetPropRand:
				i1 = int(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Min);
				i2 = int(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Max) + 1;
				f1 = float(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Min);
				f2 = float(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Max);
				i3 = i2 - i1;
				
				switch(SetPropActions[i].ActorProps.RandomVars.RandType)
				{
					case RT_BOOL:
						RandInt = (Rand(i3) + i1);
						
						b1 = bool(RandInt);
						
						if(!SetPropActions[i].ActorProps.bControllerContext)
						{
							TargetActor1.SetPropertyText(SetPropActions[i].Variable, U.BoolToString(b1));
						}
						else
						{
							Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, U.BoolToString(b1));
						}
						
						break;
					case RT_INT:
						RandInt = (Rand(i3) + i1);
						
						if(!SetPropActions[i].ActorProps.bControllerContext)
						{
							TargetActor1.SetPropertyText(SetPropActions[i].Variable, string(RandInt));
						}
						else
						{
							Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, string(RandInt));
						}
						
						break;
					case RT_FLOAT:
						RandFloat = RandRange(f1, f2);
						
						if(!SetPropActions[i].ActorProps.bControllerContext)
						{
							TargetActor1.SetPropertyText(SetPropActions[i].Variable, string(RandFloat));
						}
						else
						{
							Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, string(RandFloat));
						}
						
						break;
				}
				
				break;
			case LT_AddProp:
				if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
				{
					if(!SetPropActions[i].ActorProps.bControllerContext)
					{
						TargetActor1.SetPropertyText(SetPropActions[i].Variable, string(float(TargetActor1.GetPropertyText(SetPropActions[i].Variable)) + float(SetPropActions[i].Value)));
					}
					else
					{
						Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, string(float(TargetActor1.GetPropertyText(SetPropActions[i].Variable)) + float(SetPropActions[i].Value)));
					}
				}
				else
				{
					if(!SetPropActions[i].ActorProps.bControllerContext)
					{
						TargetActor1.SetPropertyText(SetPropActions[i].Variable, string(float(TargetActor1.GetPropertyText(SetPropActions[i].Variable)) * float(SetPropActions[i].Value)));
					}
					else
					{
						Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, string(float(TargetActor1.GetPropertyText(SetPropActions[i].Variable)) * float(SetPropActions[i].Value)));
					}
				}
				
				break;
			case LT_AddPropRand:
				i1 = int(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Min);
				i2 = int(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Max) + 1;
				f1 = float(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Min);
				f2 = float(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Max);
				i3 = i2 - i1;
				
				switch(SetPropActions[i].ActorProps.RandomVars.RandType)
				{
					case RT_BOOL:
						RandInt = (Rand(i3) + i1);
						
						b1 = bool(RandInt);
						
						if(!SetPropActions[i].ActorProps.bControllerContext)
						{
							TargetActor1.SetPropertyText(SetPropActions[i].Variable, U.BoolToString(b1));
						}
						else
						{
							Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, U.BoolToString(b1));
						}
						
						break;
					case RT_INT:	
						RandInt = (Rand(i3) + i1);
						
						if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
						{
							if(!SetPropActions[i].ActorProps.bControllerContext)
							{
								TargetActor1.SetPropertyText(SetPropActions[i].Variable, string(int(TargetActor1.GetPropertyText(SetPropActions[i].Variable)) + RandInt));
							}
							else
							{
								Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, string(int(TargetActor1.GetPropertyText(SetPropActions[i].Variable)) + RandInt));
							}
						}
						else
						{
							if(!SetPropActions[i].ActorProps.bControllerContext)
							{
								TargetActor1.SetPropertyText(SetPropActions[i].Variable, string(int(TargetActor1.GetPropertyText(SetPropActions[i].Variable)) * RandInt));
							}
							else
							{
								Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, string(int(TargetActor1.GetPropertyText(SetPropActions[i].Variable)) * RandInt));
							}
						}
						
						break;
					case RT_FLOAT:
						RandFloat = RandRange(f1, f2);
						
						if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
						{
							if(!SetPropActions[i].ActorProps.bControllerContext)
							{
								TargetActor1.SetPropertyText(SetPropActions[i].Variable, string(float(TargetActor1.GetPropertyText(SetPropActions[i].Variable)) + RandFloat));
							}
							else
							{
								Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, string(float(TargetActor1.GetPropertyText(SetPropActions[i].Variable)) + RandFloat));
							}
						}
						else
						{
							if(!SetPropActions[i].ActorProps.bControllerContext)
							{
								TargetActor1.SetPropertyText(SetPropActions[i].Variable, string(float(TargetActor1.GetPropertyText(SetPropActions[i].Variable)) * RandFloat));
							}
							else
							{
								Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, string(float(TargetActor1.GetPropertyText(SetPropActions[i].Variable)) * RandFloat));
							}
						}
						
						break;
				}
				
				break;
			case LT_TransferProp:
				if(!SetPropActions[i].ActorProps.bControllerContext)
				{
					TargetActor1.SetPropertyText(SetPropActions[i].Variable, TargetActor2.GetPropertyText(SetPropActions[i].ActorProps.TransferProp.GetVariable));
				}
				else
				{
					Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, TargetActor2.GetPropertyText(SetPropActions[i].ActorProps.TransferProp.GetVariable));
				}
				
				break;
		}
		
		if(bPickRandom)
		{
			break;
		}
	}
	
	return false;
}

function string GetActionString()
{
	if(!bPickRandom)
	{
		return ActionString @ "-- Executing" @ string(SetPropActions.Length) @ "actions";
	}
	else
	{
		return ActionString @ "-- Executing a random action";
	}
}


defaultproperties
{
	ActionString="Set Prop"
}