// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_WaitForTimer extends MLatentScriptedAction
	Config(MPak);


struct TransferPropStruct
{
	var() class<Actor> GetActorClass;
	var() name GetActorTag;
	var() string GetVariable;
};

var(Action) float PauseTime;
var(Action) bool bUseRandomValues, bPullPauseTimeFromTransferProp;
var(Action) MinMaxFStruct Rand_MinMaxValues;
var(Action) TransferPropStruct TransferProp[2];


function bool InitActionFor(ScriptedController C)
{
	local Actor TargetActor;
	local string S;
	local int i;
	
	GetUtils(C);
	HP = U.GetHP();
	
	IfNonBlocking(C);
	
	if(bPullPauseTimeFromTransferProp)
	{
		if(!bUseRandomValues)
		{
			if(TransferProp[0].GetActorTag == 'CurrentPlayer')
			{
				TargetActor = HP;
			}
			else
			{
				if(TransferProp[0].GetActorClass == none)
				{
					Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
					
					return true;
				}
				
				foreach C.AllActors(TransferProp[0].GetActorClass, TargetActor, TransferProp[0].GetActorTag)
				{
					break;
				}
			}
			
			S = TargetActor.GetPropertyText(TransferProp[0].GetVariable);
			PauseTime = float(S);
		}
		else
		{
			for(i = 0; i < 2; i++)
			{
				if(TransferProp[i].GetActorTag == 'CurrentPlayer')
				{
					TargetActor = HP;
				}
				else
				{
					if(TransferProp[i].GetActorClass == none)
					{
						Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
						
						return true;
					}
					
					foreach C.AllActors(TransferProp[i].GetActorClass, TargetActor, TransferProp[i].GetActorTag)
					{
						break;
					}
				}
				
				S = TargetActor.GetPropertyText(TransferProp[i].GetVariable);
				
				if(i < 1)
				{
					Rand_MinMaxValues.Min = float(S);
				}
				else
				{
					Rand_MinMaxValues.Max = float(S);
				}
			}
		}
	}
	
	if(bUseRandomValues)
	{
		PauseTime = RandRange(Rand_MinMaxValues.Min, Rand_MinMaxValues.Max);
	}
	
	C.CurrentAction = self;
	C.SetTimer(PauseTime, false);
	
	return true;
}

function bool CompleteWhenTriggered()
{
	return true;
}

function bool CompleteWhenTimer()
{
	return true;
}

function string GetActionString()
{
	if(!bUseRandomValues)
	{
		return ActionString @ "-- Pausing for" @ string(PauseTime) @ "seconds";
	}
	else
	{
		return ActionString @ "-- Pausing for a random amount of time";
	}
}


defaultproperties
{
	ActionString="Wait For Timer"
}