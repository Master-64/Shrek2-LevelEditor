// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_DeliverLocalizedDialog extends MScriptedAction
	Config(MPak);


var(Action) class<KWPawn> PawnClass;
var(Action) name PawnTag;
var(Action) string sDialogName, Optional_sSubtitleFileName, Optional_sExplicitDialogString;
var(Action) bool bPlaySound, bNo3DSound, bDontDisplaySubtitle, Optional_bUseExplicitSoundSlot, bModifiedBumpline;
var(Action) float fVolume, Optional_fExplicitDisplayDuration;
var(Action) KWGame.ESoundSlot Optional_SoundSlot;


function bool InitActionFor(ScriptedController C)
{
	local KWPawn TargetPawn;
	
	GetUtils(C);
	HP = U.GetHP();
	
	if(PawnTag == 'CurrentPlayer')
	{
		TargetPawn = KWPawn(HP);
	}
	else
	{
		if(PawnClass == none)
		{
			Warn(ActionString @ "-- A pawn class assignment is missing; aborting process");
			
			return false;
		}
		
		foreach C.AllActors(PawnClass, TargetPawn, PawnTag)
		{
			break;
		}
	}
	
	if(TargetPawn == none)
	{
		Warn(ActionString @ "-- Failed to find a pawn to deliver a localized dialog from; aborting process");
		
		return false;
	}
	
	TargetPawn.DeliverLocalizedDialog(sDialogName, bPlaySound, Optional_fExplicitDisplayDuration, Optional_sSubtitleFileName, Optional_sExplicitDialogString, bNo3DSound, fVolume, bDontDisplaySubtitle, Optional_bUseExplicitSoundSlot, Optional_SoundSlot);
	
	if(bModifiedBumpline)
	{
		U.LipSyncDialog(TargetPawn, Sound(DynamicLoadObject("AllDialog." $ sDialogName, class'Sound')), Localize("all", sDialogName, "HPdialog"));
	}
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Playing dialog" @ sDialogName;
}


defaultproperties
{
	PawnClass=class'KWPawn'
	bPlaySound=true
	bNo3DSound=true
	Optional_SoundSlot=SLOT_Talk
	fVolume=1.4
	ActionString="Deliver Localized Dialog"
}