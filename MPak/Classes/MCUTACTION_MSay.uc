// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCUTACTION_MSay extends KWACTION_Say
	Config(MPak);


var(Action) string sDialogString;
var(Action) name nPawnTag;
var(Action) bool bModifiedBumpline;
var string sPawnTag;
var name nTemp;
var KWPawn SoundOwner;
var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var BaseCam Cam;
var MUtils U;


function bool InitActionFor(KWCutController C)
{
	local float fDuration;
	
	if(C.bDoForceFinish)
	{
		return false;
	}
	
	GetUtils(C);
	
	if(nPawnTag == 'None')
	{
		if(Mid(sDialogString, 2, 1) == "_" && Mid(sDialogString, 6, 1) == "_")
		{
			sPawnTag = Localize("CharInfo", Caps(Mid(sDialogString, 3, 3)), "GameData");
			
			if(InStr(sPawnTag, "?") > -1)
			{
				nPawnTag = 'None';
			}
			else
			{
				nPawnTag = U.SName(sPawnTag);
			}
		}
	}
	
	foreach C.AllActors(class'KWPawn', SoundOwner, nPawnTag)
	{
		break;
	}
	
	if(nPawnTag == 'None')
	{
		return false;
	}
	
	Sound = none; // Hack
	
	fDuration = SoundOwner.DeliverLocalizedDialog(sDialogString, true,,,, true);
	U.LipSyncDialog(SoundOwner, Sound(DynamicLoadObject("AllDialog." $ sDialogString, class'Sound')), Localize("all", sDialogString, "HPdialog"));
	C.LastSayFinishesAt = C.Level.TimeSeconds + fDuration;
	
	return super.InitActionFor(C);
}

function GetUtils(KWCutController C)
{
	local MUtils Ut;
	
	foreach C.DynamicActors(class'MUtils', Ut)
	{
		U = Ut;
	}
	
	U = C.Spawn(class'MUtils');
}

function SerializeFrom(string args)
{
	local int i;
	local string arg;
	
	for(i = 1; i < 4; i++)
	{
		arg = Caps(class'KWHelper'.static.ParseDelimitedString(args, " ", i, false));
		
		if(arg == "")
		{
			break;
		}
		
		if(InStr(arg, "PAWN=") > -1)
		{
			SetPropertyText("nTemp", Mid(arg, 6));
			
			nPawnTag = nTemp;
		}
		else if(InStr(arg, "MOD") > -1)
		{
			bModifiedBumpline = true;
		}
		else
		{
			sDialogString = arg;
			DialogString = arg; // Hack
		}
	}
}

function string GetActionString()
{
	return ActionString @ sDialogString @ "Modified:" @ class'MUtils'.static.BoolToString(bModifiedBumpline);
}


defaultproperties
{
	ActionString="MSay"
}