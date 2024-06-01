// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_Debug extends MScriptedAction
	Config(MPak);


struct TransferPropStruct
{
	var() class<Actor> GetActorClass;
	var() name GetActorTag;
	var() string GetVariable;
};

struct ReplaceStruct
{
	var() string ReplacePhrase;
	var() TransferPropStruct TransferProp;
};

struct AnnounceStruct
{
	var() float fAnnTime;
	var() Color AnnColor;
};

enum EDebugType
{
	DT_DisplayMessage,
	DT_DisplayMessage_Announce,
	DT_DisplayMessage_And_Log,
	DT_Log,
	DT_Warn,
	DT_Comment
};

var(Action) MACTION_Debug.EDebugType DebugType;
var(Action) string Comment;
var(Action) bool bReplacePhraseWithTransferProp;
var(Action) array<ReplaceStruct> ReplacePhraseActions;
var(Action) AnnounceStruct AnnouncementSettings;


function bool InitActionFor(ScriptedController C)
{
	local Actor TargetActor;
	local int i;
	local string LocalComment;
	
	if(DebugType == DT_Comment)
	{
		return false;
	}
	
	GetUtils(C);
	PC = U.GetPC();
	
	// Localizing comment so that we can actively modify the value of it without permanently changing the value of it
	LocalComment = Comment;
	
	if(DebugType != DT_Comment && bReplacePhraseWithTransferProp)
	{
		for(i = 0; i < ReplacePhraseActions.Length; i++)
		{
			if(ReplacePhraseActions[i].TransferProp.GetActorClass == none)
			{
				Warn(ActionString @ "-- An actor class assignment is missing; skipping action" @ string(i));
				
				continue;
			}
			
			foreach C.AllActors(ReplacePhraseActions[i].TransferProp.GetActorClass, TargetActor, ReplacePhraseActions[i].TransferProp.GetActorTag)
			{
				break;
			}
			
			// Replaces the phrases in the localized comment, before doing anything with the comment
			U.ReplaceText(LocalComment, ReplacePhraseActions[i].ReplacePhrase, TargetActor.GetPropertyText(ReplacePhraseActions[i].TransferProp.GetVariable));
		}
	}
	
	switch(DebugType)
	{
		case DT_DisplayMessage:
			U.CM(LocalComment);
			
			break;
		case DT_DisplayMessage_Announce:
			U.Announce(LocalComment, AnnouncementSettings.fAnnTime, AnnouncementSettings.AnnColor);
			
			break;
		case DT_DisplayMessage_And_Log:
			U.CMAndLog(LocalComment);
			
			break;
		case DT_Log:
			Log(LocalComment);
			
			break;
		case DT_Warn:
			Warn(LocalComment);
			
			break;
	}
	
	return false;
}

function string GetActionString()
{
	switch(DebugType)
	{
		case DT_DisplayMessage:
			return ActionString @ "-- Displaying message";
			
			break;
		case DT_DisplayMessage_Announce:
			return ActionString @ "-- Announcing message";
			
			break;
		case DT_DisplayMessage_And_Log:
			return ActionString @ "-- Displaying message and logging";
			
			break;
		case DT_Log:
			return ActionString @ "-- Logging";
			
			break;
		case DT_Warn:
			return ActionString @ "-- Warning";
			
			break;
		case DT_Comment:
			return ActionString @ "-- Commenting (nothing occurred)";
			
			break;
	}
}


defaultproperties
{
	AnnouncementSettings=(fAnnTime=6.0,AnnColor=(R=255,G=255,B=255,A=255))
	ActionString="Debug"
}