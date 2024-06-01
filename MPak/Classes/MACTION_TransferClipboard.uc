// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_TransferClipboard extends MScriptedAction
	Config(MPak);


struct TransferClipboardStruct
{
	var() class<Actor> ActorClass;
	var() name ActorTag;
	var() string Variable;
	var() bool bControllerContext;
};

var(Action) array<TransferClipboardStruct> TransferClipboardActions;
var(Action) bool bPickRandom;


function bool InitActionFor(ScriptedController C)
{
	local Actor TargetActor;
	local int i;
	
	GetUtils(C);
	PC = U.GetPC();
	HP = U.GetHP();
	
	for(i = 0; i < TransferClipboardActions.Length; i++)
	{
		if(bPickRandom)
		{
			i = Rand(TransferClipboardActions.Length);
		}
		
		if(TransferClipboardActions[i].ActorTag == 'CurrentPlayer')
		{
			TargetActor = HP;
		}
		else
		{
			if(TransferClipboardActions[i].ActorClass == none)
			{
				Warn(ActionString @ "-- An actor class assignment is missing; skipping action" @ string(i));
				
				continue;
			}
			
			foreach C.AllActors(TransferClipboardActions[i].ActorClass, TargetActor, TransferClipboardActions[i].ActorTag)
			{
				break;
			}
		}
		
		if(!TransferClipboardActions[i].bControllerContext)
		{
			TargetActor.SetPropertyText(TransferClipboardActions[i].Variable, PC.PasteFromClipboard());
		}
		else
		{
			Pawn(TargetActor).Controller.SetPropertyText(TransferClipboardActions[i].Variable, PC.PasteFromClipboard());
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
		return ActionString @ "-- Executing" @ string(TransferClipboardActions.Length) @ "actions";
	}
	else
	{
		return ActionString @ "-- Executing a random action";
	}
}


defaultproperties
{
	ActionString="Transfer Clipboard"
}