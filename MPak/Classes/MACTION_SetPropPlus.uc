// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_SetPropPlus extends MScriptedAction
	Config(MGlobalData);


enum ESetPropType
{
	ST_Default,
	ST_SetState,
	ST_SetCollision,
	ST_SetCollisionSize,
	ST_SetDrawScale,
	ST_SetDrawScale3D,
	ST_SetStaticMesh,
	ST_SetDrawType,
	ST_SetLocation,
	ST_SetRotation,
	ST_SetLocAndRot,
	ST_SetPhysics
};

enum ELogicType
{
	LT_SetProp,
	LT_SetPropRand,
	LT_AddProp,
	LT_AddPropRand,
	LT_TransferProp
};

enum EVarPull
{
	VP_All,
	VP_Loc_X,
	VP_Loc_Y,
	VP_Loc_Z,
	VP_Rot_Pitch,
	VP_Rot_Yaw,
	VP_Rot_Roll
};

struct LocAndRotStruct
{
	var() vector SetLocation;
	var() rotator SetRotation;
};

struct SetCollisionStruct
{
	var() bool bNewCollideActors, bNewBlockActors, bNewBlockPlayers;
};

struct SetCollisionSizeStruct
{
	var() float NewCollisionRadius, NewCollisionHeight;
};

enum ERandType
{
	RT_BOOL,
	RT_INT,
	RT_FLOAT
};

struct RandVarStruct
{
	var() MACTION_SetPropPlus.ERandType RandType;
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
	var() name PlayerState;
	var() bool bControllerContext, bAddProp_MultiplyInstead, bTransferProp_Save, bTransferProp_GetCurrentGameSlot, bTransferProp_PullSpecificVar, bTransferProp_SetLocOrRotFromOneValue;
	var() SetCollisionStruct SetCollision;
	var() SetCollisionSizeStruct SetCollisionSize;
	var() float SetDrawScale;
	var() vector SetDrawScale3D;
	var() StaticMesh SetStaticMesh;
	var() Actor.EDrawType SetDrawType;
	var() LocAndRotStruct SetLocAndRot;
	var() Actor.EPhysics SetPhysics;
	var() MACTION_SetPropPlus.EVarPull TransferProp_PullSpecificVar;
	var() MGlobalData.EManageType TransferProp_ManageDataType;
	var() MGlobalData.EDataType TransferProp_DataType;
	var() int TransferProp_SaveSlot;
};

struct SetPropStruct
{
	var() MACTION_SetPropPlus.ELogicType LogicType;
	var() MACTION_SetPropPlus.ESetPropType SetPropType;
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
	local string sValue;
	local bool b1, b2, b3;
	local int i, i1, i2, i3, RandInt, RandInt1, RandInt2, RandInt3;
	local float f1, f2, RandFloat, RandFloat1, RandFloat2;
	local vector v1;
	local rotator r1, r2;
	
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
		
		switch(SetPropActions[i].SetPropType)
		{
			case ST_Default:
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
						if(SetPropActions[i].ActorProps.TransferProp_ManageDataType == MT_LoadData)
						{
							if(!SetPropActions[i].ActorProps.bControllerContext)
							{
								TargetActor1.SetPropertyText(SetPropActions[i].Variable, class'MGlobalData'.static.LoadGlobalData(SetPropActions[i].ActorProps.TransferProp_DataType, SetPropActions[i].ActorProps.TransferProp_SaveSlot, SetPropActions[i].ActorProps.bTransferProp_GetCurrentGameSlot));
							}
							else
							{
								Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, class'MGlobalData'.static.LoadGlobalData(SetPropActions[i].ActorProps.TransferProp_DataType, SetPropActions[i].ActorProps.TransferProp_SaveSlot, SetPropActions[i].ActorProps.bTransferProp_GetCurrentGameSlot));
							}
							
							break;
						}
						
						if(!SetPropActions[i].ActorProps.bTransferProp_Save)
						{
							if(!SetPropActions[i].ActorProps.bControllerContext)
							{
								switch(SetPropActions[i].ActorProps.TransferProp_PullSpecificVar)
								{
									case VP_All:
										TargetActor1.SetPropertyText(SetPropActions[i].Variable, TargetActor2.GetPropertyText(SetPropActions[i].ActorProps.TransferProp.GetVariable));
										
										break;
									case VP_Loc_X:
										TargetActor1.SetPropertyText(SetPropActions[i].Variable, string(TargetActor2.Location.X));
										
										break;
									case VP_Loc_Y:
										TargetActor1.SetPropertyText(SetPropActions[i].Variable, string(TargetActor2.Location.Y));
										
										break;
									case VP_Loc_Z:
										TargetActor1.SetPropertyText(SetPropActions[i].Variable, string(TargetActor2.Location.Z));
										
										break;
									case VP_Rot_Pitch:
										TargetActor1.SetPropertyText(SetPropActions[i].Variable, string(TargetActor2.Rotation.Pitch));
										
										break;
									case VP_Rot_Yaw:
										TargetActor1.SetPropertyText(SetPropActions[i].Variable, string(TargetActor2.Rotation.Yaw));
										
										break;
									case VP_Rot_Roll:
										TargetActor1.SetPropertyText(SetPropActions[i].Variable, string(TargetActor2.Rotation.Roll));
										
										break;
								}
							}
							else
							{
								switch(SetPropActions[i].ActorProps.TransferProp_PullSpecificVar)
								{
									case VP_All:
										Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, TargetActor2.GetPropertyText(SetPropActions[i].ActorProps.TransferProp.GetVariable));
										
										break;
									case VP_Loc_X:
										Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, string(TargetActor2.Location.X));
										
										break;
									case VP_Loc_Y:
										Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, string(TargetActor2.Location.Y));
										
										break;
									case VP_Loc_Z:
										Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, string(TargetActor2.Location.Z));
										
										break;
									case VP_Rot_Pitch:
										Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, string(TargetActor2.Rotation.Pitch));
										
										break;
									case VP_Rot_Yaw:
										Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, string(TargetActor2.Rotation.Yaw));
										
										break;
									case VP_Rot_Roll:
										Pawn(TargetActor1).Controller.SetPropertyText(SetPropActions[i].Variable, string(TargetActor2.Rotation.Roll));
										
										break;
								}
							}
						}
						else if(SetPropActions[i].ActorProps.TransferProp_ManageDataType == MT_SaveData)
						{
							if(!SetPropActions[i].ActorProps.bControllerContext)
							{
								sValue = TargetActor2.GetPropertyText(SetPropActions[i].ActorProps.TransferProp.GetVariable);
							}
							else
							{
								sValue = Pawn(TargetActor2).Controller.GetPropertyText(SetPropActions[i].ActorProps.TransferProp.GetVariable);
							}
							
							class'MGlobalData'.static.SaveGlobalData(SetPropActions[i].ActorProps.TransferProp_DataType, SetPropActions[i].ActorProps.TransferProp_SaveSlot, sValue, SetPropActions[i].ActorProps.bTransferProp_GetCurrentGameSlot);
						}
						
						break;
				}
				
				break;
			case ST_SetState:
				switch(SetPropActions[i].LogicType)
				{
					case LT_TransferProp:
						if(!SetPropActions[i].ActorProps.bControllerContext)
						{
							TargetActor1.GotoState(TargetActor2.GetStateName());
						}
						else
						{
							Pawn(TargetActor1).Controller.GotoState(TargetActor2.GetStateName());
						}
						
						break;
					default:
						if(!SetPropActions[i].ActorProps.bControllerContext)
						{
							TargetActor1.GotoState(SetPropActions[i].ActorProps.PlayerState);
						}
						else
						{
							Pawn(TargetActor1).Controller.GotoState(SetPropActions[i].ActorProps.PlayerState);
						}
						
						break;
				}
				
				break;
			case ST_SetCollision:
				i1 = int(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Min);
				i2 = int(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Max) + 1;
				i3 = i2 - i1;
				
				switch(SetPropActions[i].LogicType)
				{
					case LT_SetProp:
						TargetActor1.SetCollision(SetPropActions[i].ActorProps.SetCollision.bNewCollideActors, SetPropActions[i].ActorProps.SetCollision.bNewBlockActors, SetPropActions[i].ActorProps.SetCollision.bNewBlockPlayers);
						
						break;
					case LT_SetPropRand:
						RandInt1 = (Rand(i3) + i1);
						RandInt2 = (Rand(i3) + i1);
						RandInt3 = (Rand(i3) + i1);
						
						b1 = bool(RandInt1);
						b2 = bool(RandInt2);
						b3 = bool(RandInt3);
						
						TargetActor1.SetCollision(b1, b2, b3);
						
						break;
					case LT_AddProp:
						TargetActor1.SetCollision(SetPropActions[i].ActorProps.SetCollision.bNewCollideActors, SetPropActions[i].ActorProps.SetCollision.bNewBlockActors, SetPropActions[i].ActorProps.SetCollision.bNewBlockPlayers);
						
						break;
					case LT_AddPropRand:
						RandInt1 = (Rand(i3) + i1);
						RandInt2 = (Rand(i3) + i1);
						RandInt3 = (Rand(i3) + i1);
						
						b1 = bool(RandInt1);
						b2 = bool(RandInt2);
						b3 = bool(RandInt3);
						
						TargetActor1.SetCollision(b1, b2, b3);
						
						break;
					case LT_TransferProp:
						TargetActor1.SetCollision(TargetActor2.bCollideActors, TargetActor2.bBlockActors, TargetActor2.bBlockPlayers);
						
						break;
				}
				
				break;
			case ST_SetCollisionSize:
				f1 = float(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Min);
				f2 = float(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Max);
				
				switch(SetPropActions[i].LogicType)
				{
					case LT_SetProp:
						TargetActor1.SetCollisionSize(SetPropActions[i].ActorProps.SetCollisionSize.NewCollisionRadius, SetPropActions[i].ActorProps.SetCollisionSize.NewCollisionHeight);
						
						break;
					case LT_SetPropRand:
						RandFloat1 = RandRange(f1, f2);
						RandFloat2 = RandRange(f1, f2);
						
						TargetActor1.SetCollisionSize(RandFloat1, RandFloat2);
						
						break;
					case LT_AddProp:
						if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
						{
							TargetActor1.SetCollisionSize(TargetActor1.CollisionRadius + SetPropActions[i].ActorProps.SetCollisionSize.NewCollisionRadius, TargetActor1.CollisionHeight + SetPropActions[i].ActorProps.SetCollisionSize.NewCollisionHeight);
						}
						else
						{
							TargetActor1.SetCollisionSize(TargetActor1.CollisionRadius * SetPropActions[i].ActorProps.SetCollisionSize.NewCollisionRadius, TargetActor1.CollisionHeight * SetPropActions[i].ActorProps.SetCollisionSize.NewCollisionHeight);
						}
						
						break;
					case LT_AddPropRand:
						RandFloat1 = RandRange(f1, f2);
						RandFloat2 = RandRange(f1, f2);
						
						if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
						{
							TargetActor1.SetCollisionSize(TargetActor1.CollisionRadius + RandFloat1, TargetActor1.CollisionHeight + RandFloat2);
						}
						else
						{
							TargetActor1.SetCollisionSize(TargetActor1.CollisionRadius * RandFloat1, TargetActor1.CollisionHeight * RandFloat2);
						}
						
						break;
					case LT_TransferProp:
						TargetActor1.SetCollisionSize(TargetActor2.CollisionRadius, TargetActor2.CollisionHeight);
						
						break;
				}
				
				break;
			case ST_SetDrawScale:
				f1 = float(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Min);
				f2 = float(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Max);
				
				switch(SetPropActions[i].LogicType)
				{
					case LT_SetProp:
						TargetActor1.SetDrawScale(SetPropActions[i].ActorProps.SetDrawScale);
						
						break;
					case LT_SetPropRand:
						RandFloat = RandRange(f1, f2);
						
						TargetActor1.SetDrawScale(RandFloat);
						
						break;
					case LT_AddProp:
						if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
						{
							TargetActor1.SetDrawScale(TargetActor1.DrawScale + SetPropActions[i].ActorProps.SetDrawScale);
						}
						else
						{
							TargetActor1.SetDrawScale(TargetActor1.DrawScale * SetPropActions[i].ActorProps.SetDrawScale);
						}
						
						break;
					case LT_AddPropRand:
						RandFloat = RandRange(f1, f2);
						
						if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
						{
							TargetActor1.SetDrawScale(TargetActor1.DrawScale + RandFloat);
						}
						else
						{
							TargetActor1.SetDrawScale(TargetActor1.DrawScale * RandFloat);
						}
						
						break;
					case LT_TransferProp:
						TargetActor1.SetDrawScale(TargetActor2.DrawScale);
						
						break;
				}
				
				break;
			case ST_SetDrawScale3D:
				f1 = float(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Min);
				f2 = float(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Max);
				
				switch(SetPropActions[i].LogicType)
				{
					case LT_SetProp:
						TargetActor1.SetDrawScale3D(SetPropActions[i].ActorProps.SetDrawScale3D);
						
						break;
					case LT_SetPropRand:
						v1.x = RandRange(f1, f2);
						v1.y = RandRange(f1, f2);
						v1.z = RandRange(f1, f2);
						
						TargetActor1.SetDrawScale3D(v1);
						
						break;
					case LT_AddProp:
						if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
						{
							TargetActor1.SetDrawScale3D(TargetActor1.DrawScale3D + SetPropActions[i].ActorProps.SetDrawScale3D);
						}
						else
						{
							TargetActor1.SetDrawScale3D(TargetActor1.DrawScale3D * SetPropActions[i].ActorProps.SetDrawScale3D);
						}
						
						break;
					case LT_AddPropRand:
						v1.x = RandRange(f1, f2);
						v1.y = RandRange(f1, f2);
						v1.z = RandRange(f1, f2);
						
						if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
						{
							TargetActor1.SetDrawScale3D(TargetActor1.DrawScale3D + v1);
						}
						else
						{
							TargetActor1.SetDrawScale3D(TargetActor1.DrawScale3D * v1);
						}
						
						break;
					case LT_TransferProp:
						TargetActor1.SetDrawScale3D(TargetActor2.DrawScale3D);
						
						break;
				}
				
				break;
			case ST_SetStaticMesh:
				switch(SetPropActions[i].LogicType)
				{
					case LT_TransferProp:
						TargetActor1.SetStaticMesh(TargetActor2.StaticMesh);
						
						break;
					default:
						TargetActor1.SetStaticMesh(SetPropActions[i].ActorProps.SetStaticMesh);
						
						break;
				}
				
				break;
			case ST_SetDrawType:
				i1 = int(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Min);
				i2 = int(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Max) + 1;
				i3 = i2 - i1;
				
				switch(SetPropActions[i].LogicType)
				{
					case LT_SetProp:
						TargetActor1.SetDrawType(SetPropActions[i].ActorProps.SetDrawType);
						
						break;
					case LT_SetPropRand:
						RandInt = (Rand(i3) + i1);
						
						TargetActor1.SetDrawType(EDrawType(RandInt));
						
						break;
					case LT_AddProp:
						if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
						{
							TargetActor1.SetDrawType(EDrawType(int(SetPropActions[i].Variable) + int(TargetActor1.DrawType)));
						}
						else
						{
							TargetActor1.SetDrawType(EDrawType(int(SetPropActions[i].Variable) * int(TargetActor1.DrawType)));
						}
						
						break;
					case LT_AddPropRand:
						RandInt = (Rand(i3) + i1);
						
						if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
						{
							TargetActor1.SetDrawType(EDrawType(RandInt + int(TargetActor1.DrawType)));
						}
						else
						{
							TargetActor1.SetDrawType(EDrawType(RandInt * int(TargetActor1.DrawType)));
						}
						
						break;
					case LT_TransferProp:
						TargetActor1.SetDrawType(TargetActor2.DrawType);
						
						break;
				}
				
				break;
			case ST_SetLocation:
				f1 = float(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Min);
				f2 = float(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Max);
				
				switch(SetPropActions[i].LogicType)
				{
					case LT_SetProp:
						U.MFancySetLocation(TargetActor1, SetPropActions[i].ActorProps.SetLocAndRot.SetLocation);
						
						break;
					case LT_SetPropRand:
						v1.x = RandRange(f1, f2);
						v1.y = RandRange(f1, f2);
						v1.z = RandRange(f1, f2);
						
						U.MFancySetLocation(TargetActor1, v1);
						
						break;
					case LT_AddProp:
						if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
						{
							U.MFancySetLocation(TargetActor1, TargetActor1.Location + SetPropActions[i].ActorProps.SetLocAndRot.SetLocation);
						}
						else
						{
							U.MFancySetLocation(TargetActor1, TargetActor1.Location * SetPropActions[i].ActorProps.SetLocAndRot.SetLocation);
						}
						
						break;
					case LT_AddPropRand:
						v1.x = RandRange(f1, f2);
						v1.y = RandRange(f1, f2);
						v1.z = RandRange(f1, f2);
						
						if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
						{
							U.MFancySetLocation(TargetActor1, TargetActor1.Location + v1);
						}
						else
						{
							U.MFancySetLocation(TargetActor1, TargetActor1.Location * v1);
						}
						
						break;
					case LT_TransferProp:
						if(!SetPropActions[i].ActorProps.bTransferProp_SetLocOrRotFromOneValue)
						{
							U.MFancySetLocation(TargetActor1, TargetActor2.Location);
						}
						else
						{
							v1 = TargetActor1.Location;
							f1 = float(TargetActor2.GetPropertyText(SetPropActions[i].ActorProps.TransferProp.GetVariable));
							
							switch(SetPropActions[i].ActorProps.TransferProp_PullSpecificVar)
							{
								case VP_All:
									U.MFancySetLocation(TargetActor1, TargetActor2.Location);
									
									break;
								case VP_Loc_X:
									v1.x = f1;
									U.MFancySetLocation(TargetActor1, v1);
									
									break;
								case VP_Loc_Y:
									v1.y = f1;
									U.MFancySetLocation(TargetActor1, v1);
									
									break;
								case VP_Loc_Z:
									v1.z = f1;
									U.MFancySetLocation(TargetActor1, v1);
									
									break;
							}
						}
						
						break;
				}
				
				break;
			case ST_SetRotation:
				i1 = int(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Min);
				i2 = int(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Max) + 1;
				i3 = i2 - i1;
				
				switch(SetPropActions[i].LogicType)
				{
					case LT_SetProp:
						U.FancySetRotation(TargetActor1, SetPropActions[i].ActorProps.SetLocAndRot.SetRotation);
						
						break;
					case LT_SetPropRand:
						r1.Pitch = (Rand(i3) + i1);
						r1.Yaw = (Rand(i3) + i1);
						r1.Roll = (Rand(i3) + i1);
						
						U.FancySetRotation(TargetActor1, r1);
						
						break;
					case LT_AddProp:
						if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
						{
							U.FancySetRotation(TargetActor1, TargetActor1.Rotation + SetPropActions[i].ActorProps.SetLocAndRot.SetRotation);
						}
						else
						{
							r1.Pitch = SetPropActions[i].ActorProps.SetLocAndRot.SetRotation.Pitch * TargetActor1.Rotation.Pitch;
							r1.Yaw = SetPropActions[i].ActorProps.SetLocAndRot.SetRotation.Yaw * TargetActor1.Rotation.Yaw;
							r1.Roll = SetPropActions[i].ActorProps.SetLocAndRot.SetRotation.Roll * TargetActor1.Rotation.Roll;
							
							U.FancySetRotation(TargetActor1, r1);
						}
						
						break;
					case LT_AddPropRand:
						r1.Pitch = (Rand(i3) + i1);
						r1.Yaw = (Rand(i3) + i1);
						r1.Roll = (Rand(i3) + i1);
						
						if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
						{
							U.FancySetRotation(TargetActor1, TargetActor1.Rotation + r1);
						}
						else
						{
							r2.Pitch = r1.Pitch * TargetActor1.Rotation.Pitch;
							r2.Yaw = r1.Yaw * TargetActor1.Rotation.Yaw;
							r2.Roll = r1.Roll * TargetActor1.Rotation.Roll;
							
							U.FancySetRotation(TargetActor1, r2);
						}
						
						break;
					case LT_TransferProp:
						if(!SetPropActions[i].ActorProps.bTransferProp_SetLocOrRotFromOneValue)
						{
							U.FancySetRotation(TargetActor1, TargetActor2.Rotation);
						}
						else
						{
							r1 = TargetActor1.Rotation;
							i1 = int(TargetActor2.GetPropertyText(SetPropActions[i].ActorProps.TransferProp.GetVariable));
							
							switch(SetPropActions[i].ActorProps.TransferProp_PullSpecificVar)
							{
								case VP_All:
									U.FancySetRotation(TargetActor1, TargetActor2.Rotation);
									
									break;
								case VP_Rot_Pitch:
									r1.Pitch = i1;
									U.FancySetRotation(TargetActor1, TargetActor2.Rotation);
									
									break;
								case VP_Rot_Yaw:
									r1.Yaw = i1;
									U.FancySetRotation(TargetActor1, TargetActor2.Rotation);
									
									break;
								case VP_Rot_Roll:
									r1.Roll = i1;
									U.FancySetRotation(TargetActor1, TargetActor2.Rotation);
									
									break;
							}
						}
						
						break;
				}
				
				break;
			case ST_SetLocAndRot:
				i1 = int(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Min);
				i2 = int(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Max) + 1;
				f1 = float(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Min);
				f2 = float(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Max);
				i3 = i2 - i1;
				
				switch(SetPropActions[i].LogicType)
				{
					case LT_SetProp:
						U.MFancySetLocation(TargetActor1, SetPropActions[i].ActorProps.SetLocAndRot.SetLocation);
						U.FancySetRotation(TargetActor1, SetPropActions[i].ActorProps.SetLocAndRot.SetRotation);
						
						break;
					case LT_SetPropRand:
						v1.x = RandRange(f1, f2);
						v1.y = RandRange(f1, f2);
						v1.z = RandRange(f1, f2);
						
						r1.Pitch = (Rand(i3) + i1);
						r1.Yaw = (Rand(i3) + i1);
						r1.Roll = (Rand(i3) + i1);
						
						U.MFancySetLocation(TargetActor1, v1);
						U.FancySetRotation(TargetActor1, r1);
						
						break;
					case LT_AddProp:
						if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
						{
							U.MFancySetLocation(TargetActor1, TargetActor1.Location + SetPropActions[i].ActorProps.SetLocAndRot.SetLocation);
							U.FancySetRotation(TargetActor1, TargetActor1.Rotation + SetPropActions[i].ActorProps.SetLocAndRot.SetRotation);
						}
						else
						{
							U.MFancySetLocation(TargetActor1, TargetActor1.Location * SetPropActions[i].ActorProps.SetLocAndRot.SetLocation);
							
							r1.Pitch = SetPropActions[i].ActorProps.SetLocAndRot.SetRotation.Pitch * TargetActor1.Rotation.Pitch;
							r1.Yaw = SetPropActions[i].ActorProps.SetLocAndRot.SetRotation.Yaw * TargetActor1.Rotation.Yaw;
							r1.Roll = SetPropActions[i].ActorProps.SetLocAndRot.SetRotation.Roll * TargetActor1.Rotation.Roll;
							
							U.FancySetRotation(TargetActor1, r1);
						}
						
						break;
					case LT_AddPropRand:
						v1.x = RandRange(f1, f2);
						v1.y = RandRange(f1, f2);
						v1.z = RandRange(f1, f2);
						
						r1.Pitch = (Rand(i3) + i1);
						r1.Yaw = (Rand(i3) + i1);
						r1.Roll = (Rand(i3) + i1);
						
						if(!SetPropActions[i].ActorProps.bAddProp_MultiplyInstead)
						{
							U.MFancySetLocation(TargetActor1, TargetActor1.Location + v1);
							U.FancySetRotation(TargetActor1, TargetActor1.Rotation + r1);
						}
						else
						{
							U.MFancySetLocation(TargetActor1, TargetActor1.Location * v1);
							
							r2.Pitch = r1.Pitch * TargetActor1.Rotation.Pitch;
							r2.Yaw = r1.Yaw * TargetActor1.Rotation.Yaw;
							r2.Roll = r1.Roll * TargetActor1.Rotation.Roll;
							
							U.FancySetRotation(TargetActor1, r2);
						}
						
						break;
					case LT_TransferProp:
						if(!SetPropActions[i].ActorProps.bTransferProp_SetLocOrRotFromOneValue)
						{
							U.MFancySetLocation(TargetActor1, TargetActor2.Location);
							U.FancySetRotation(TargetActor1, TargetActor2.Rotation);
						}
						else
						{
							v1 = TargetActor1.Location;
							f1 = float(TargetActor2.GetPropertyText(SetPropActions[i].ActorProps.TransferProp.GetVariable));
							
							r1 = TargetActor1.Rotation;
							i1 = int(TargetActor2.GetPropertyText(SetPropActions[i].ActorProps.TransferProp.GetVariable));
							
							switch(SetPropActions[i].ActorProps.TransferProp_PullSpecificVar)
							{
								case VP_All:
									U.MFancySetLocation(TargetActor1, TargetActor2.Location);
									
									U.FancySetRotation(TargetActor1, TargetActor2.Rotation);
									
									break;
								case VP_Loc_X:
									v1.x = f1;
									U.MFancySetLocation(TargetActor1, v1);
									
									r1.Pitch = i1;
									U.FancySetRotation(TargetActor1, TargetActor2.Rotation);
									
									break;
								case VP_Loc_Y:
									v1.y = f1;
									U.MFancySetLocation(TargetActor1, v1);
									
									r1.Yaw = i1;
									U.FancySetRotation(TargetActor1, TargetActor2.Rotation);
									
									break;
								case VP_Loc_Z:
									v1.z = f1;
									U.MFancySetLocation(TargetActor1, v1);
									
									r1.Roll = i1;
									U.FancySetRotation(TargetActor1, TargetActor2.Rotation);
									
									break;
							}
						}
						
						break;
				}
				
				break;
			case ST_SetPhysics:
				i1 = int(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Min);
				i2 = int(SetPropActions[i].ActorProps.RandomVars.MinMaxValues.Max) + 1;
				i3 = i2 - i1;
				
				switch(SetPropActions[i].LogicType)
				{
					case LT_SetProp:
						TargetActor1.SetPhysics(SetPropActions[i].ActorProps.SetPhysics);
						
						break;
					case LT_SetPropRand:
						RandInt = (Rand(i3) + i1);
						
						TargetActor1.SetPhysics(EPhysics(RandInt));
						
						break;
					case LT_AddProp:
						TargetActor1.SetPhysics(EPhysics(int(SetPropActions[i].Variable) + int(TargetActor1.Physics)));
						
						break;
					case LT_AddPropRand:
						RandInt = (Rand(i3) + i1);
						
						TargetActor1.SetPhysics(EPhysics(RandInt + int(TargetActor1.Physics)));
						
						break;
					case LT_TransferProp:
						TargetActor1.SetPhysics(TargetActor2.Physics);
						
						break;
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
	ActionString="Set Prop Plus"
}