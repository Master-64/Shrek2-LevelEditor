// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_SetGameState extends MScriptedAction
	Config(MPak);


struct TransferPropStruct
{
	var() class<Actor> ActorClass;
	var() name ActorTag;
	var() string Variable;
};

var(Action) string NewGameState;
var(Action) bool bTransferPropGameStateInstead;
var(Action) TransferPropStruct TransferProp;


function bool InitActionFor(ScriptedController C)
{
	local Actor TargetActor;
	
	if(!bTransferPropGameStateInstead)
	{
		KWGame(C.Level.Game).SetGameState(NewGameState);
	}
	else
	{
		if(TransferProp.ActorClass == none)
		{
			Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
			
			return false;
		}
		
		foreach C.AllActors(TransferProp.ActorClass, TargetActor, TransferProp.ActorTag)
		{
			break;
		}
		
		if(TargetActor == none)
		{
			Warn(ActionString @ "-- Failed to find actor for TransferProp; aborting process");
			
			return false;
		}
		
		TargetActor.SetPropertyText(TransferProp.Variable, KWGame(C.Level.Game).CurrentGameState);
	}
	
	return false;
}

function string GetActionString()
{
	if(!bTransferPropGameStateInstead)
	{
		return ActionString @ "-- Setting new GameState to:" @ NewGameState;
	}
	else
	{
		return ActionString @ "-- Getting the current GameState and transfering that data via a TransferProp onto the actor with the tag:" @ string(TransferProp.ActorTag);
	}
}


defaultproperties
{
	ActionString="Set Game State"
}