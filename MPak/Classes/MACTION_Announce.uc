// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_Announce extends MScriptedAction
	Config(MPak);


struct TransferPropStruct
{
	var() class<Actor> GetActorClass;
	var() name GetActorTag;
	var() string GetVariable;
};

struct ReplaceStruct
{
	var() string sReplacePhrase;
	var() TransferPropStruct TransferProp;
};

struct AnnounceStruct
{
	var() float fAnnTime;
	var() Color AnnColor;
};

struct AnnounceActionsStruct
{
	var() string sComment;
	var() bool bReplacePhraseWithTransferProp;
	var() array<ReplaceStruct> ReplacePhraseActions;
	var() AnnounceStruct AnnouncementSettings;
};

var(Action) array<AnnounceActionsStruct> AnnounceActions;
var(Action) bool bPickRandom;


function bool InitActionFor(ScriptedController C)
{
	local Actor TargetActor;
	local int i1, i2;
	local string LocalComment;
	
	GetUtils(C);
	PC = U.GetPC();
	
	for(i1 = 0; i1 < AnnounceActions.Length; i1++)
	{
		if(bPickRandom)
		{
			i1 = Rand(AnnounceActions.Length);
		}
		
		// Localizing comment so that we can actively modify the value of it without permanently changing the value of it
		LocalComment = AnnounceActions[i1].sComment;
		
		if(AnnounceActions[i1].bReplacePhraseWithTransferProp)
		{
			for(i2 = 0; i2 < AnnounceActions[i1].ReplacePhraseActions.Length; i2++)
			{
				if(AnnounceActions[i1].ReplacePhraseActions[i2].TransferProp.GetActorClass == none)
				{
					Warn(ActionString @ "-- An actor class assignment is missing; skipping action" @ string(i2));
					
					continue;
				}
				
				foreach C.AllActors(AnnounceActions[i1].ReplacePhraseActions[i2].TransferProp.GetActorClass, TargetActor, AnnounceActions[i1].ReplacePhraseActions[i2].TransferProp.GetActorTag)
				{
					U.ReplaceText(LocalComment, AnnounceActions[i1].ReplacePhraseActions[i2].sReplacePhrase, TargetActor.GetPropertyText(AnnounceActions[i1].ReplacePhraseActions[i2].TransferProp.GetVariable)); // Replaces the phrases
				}
			}
		}
		
		U.Announce(LocalComment, AnnounceActions[i1].AnnouncementSettings.fAnnTime, AnnounceActions[i1].AnnouncementSettings.AnnColor);
		
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
		return ActionString @ "-- Executing" @ string(AnnounceActions.Length) @ "actions";
	}
	else
	{
		return ActionString @ "-- Executing a random action";
	}
}


defaultproperties
{
	ActionString="Announce"
}