// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_PlayerConsoleCommand extends MScriptedAction
	Config(MPak);


struct TransferPropStruct
{
	var() class<Actor> GetActorClass;
	var() name GetActorTag;
	var() string GetVariable;
};

struct ReplaceStruct
{
	var() string ReplacePhrase, ReplaceComment;
	var() bool bDontTransferProp;
	var() TransferPropStruct TransferProp;
	var() int Index;
};

var(Action) array<string> ConsoleCommands;
var(Action) bool bPickRandom, bPullCommandFromTransferProp, bReplacePhraseWithTransferProp, bPickRandomReplacePhrase;
var(Action) array<TransferPropStruct> PullTransferProp;
var(Action) array<ReplaceStruct> ReplacePhraseActions;


function bool InitActionFor(ScriptedController C)
{
	local Actor TargetActor;
	local int i;
	local array<string> LocalConsoleCommands;
	
	GetUtils(C);
	HP = U.GetHP();
	
	LocalConsoleCommands = ConsoleCommands;
	
	if(bPullCommandFromTransferProp)
	{
		for(i = 0; i < PullTransferProp.Length; i++)
		{
			if(PullTransferProp[i].GetActorTag == 'CurrentPlayer')
			{
				TargetActor = HP;
			}
			else
			{
				if(PullTransferProp[i].GetActorClass == none)
				{
					Warn(ActionString @ "-- An actor class assignment is missing; skipping action" @ string(i));
					
					continue;
				}
				
				foreach C.AllActors(PullTransferProp[i].GetActorClass, TargetActor, PullTransferProp[i].GetActorTag)
				{
					break;
				}
			}
			
			LocalConsoleCommands[i] = TargetActor.GetPropertyText(PullTransferProp[i].GetVariable);
		}
	}
	
	if(bReplacePhraseWithTransferProp)
	{
		if(!bPickRandomReplacePhrase)
		{
			for(i = 0; i < ReplacePhraseActions.Length; i++)
			{
				LocalConsoleCommands = PreReplaceText(C, LocalConsoleCommands, i);
			}
		}
		else
		{
			i = Rand(ReplacePhraseActions.Length);
			
			LocalConsoleCommands = PreReplaceText(C, LocalConsoleCommands, i);
		}
	}
	
	if(!bPickRandom)
	{
		for(i = 0; i < LocalConsoleCommands.Length; i++) 
		{
			U.CC(LocalConsoleCommands[i]);
		}
	}
	else
	{
		U.CC(LocalConsoleCommands[Rand(LocalConsoleCommands.Length)]);
	}
	
	return false;
}

function array<string> PreReplaceText(ScriptedController C, array<string> LocalConsoleCommands, int Index) // Before replacing text
{
	local Actor TargetActor;
	
	if(!ReplacePhraseActions[Index].bDontTransferProp)
	{
		if(ReplacePhraseActions[Index].TransferProp.GetActorClass == none)
		{
			Warn(ActionString @ "-- An actor class assignment is missing; defaulting to class'Engine.Actor' since we must run action" @ string(Index));
			
			ReplacePhraseActions[Index].TransferProp.GetActorClass = class'Engine.Actor';
		}
		
		foreach C.AllActors(ReplacePhraseActions[Index].TransferProp.GetActorClass, TargetActor, ReplacePhraseActions[Index].TransferProp.GetActorTag)
		{
			U.ReplaceText(LocalConsoleCommands[ReplacePhraseActions[Index].Index], ReplacePhraseActions[Index].ReplacePhrase, TargetActor.GetPropertyText(ReplacePhraseActions[Index].TransferProp.GetVariable));
			
			break;
		}
	}
	else
	{
		U.ReplaceText(LocalConsoleCommands[ReplacePhraseActions[Index].Index], ReplacePhraseActions[Index].ReplacePhrase, ReplacePhraseActions[Index].ReplaceComment);
	}
	
	return LocalConsoleCommands;
}

function string GetActionString()
{
	if(!bPickRandom)
	{
		return ActionString @ "-- Executing" @ string(ConsoleCommands.Length) @ "player console commands";
	}
	else
	{
		return ActionString @ "-- Executing a random player console command";
	}
}


defaultproperties
{
	ActionString="Player Console Command"
}