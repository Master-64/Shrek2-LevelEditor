// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_PopupText extends MLatentScriptedAction
	Config(MPak);


struct TextStruct
{
	var() string sPopupMessage, sTopPopupMessage;
	var() float fPopupDuration;
};

var(Action) array<TextStruct> PopupTexts;
var(Action) Color cTextColor;
var(Action) bool bRandomizeTextColor, bPickRandom;
var int iIndex;


function bool InitActionFor(ScriptedController C)
{
	local Color TempColor;
	
	GetUtils(C);
	PC = U.GetPC();
	HUD = U.GetHUD();
	
	if(!bPickRandom)
	{
		iIndex = 0;
	}
	else
	{
		iIndex = Rand(PopupTexts.Length);
	}
	
	if(bRandomizeTextColor)
	{
		TempColor.R = Rand(256);
		TempColor.G = Rand(256);
		TempColor.B = Rand(256);
		TempColor.A = cTextColor.A;
	}
	else
	{
		TempColor = cTextColor;
	}
	
	PopupTexts[iIndex].fPopupDuration = FMax(PopupTexts[iIndex].fPopupDuration, 0.01);
	
	U.PopupText(PopupTexts[iIndex].sPopupMessage, PopupTexts[iIndex].sTopPopupMessage, PopupTexts[iIndex].fPopupDuration, TempColor);
	
	IfNonBlocking(C);
	
	C.CurrentAction = self;
	C.SetTimer(PopupTexts[iIndex].fPopupDuration, false);
	
	return true;
}

function bool CompleteWhenTimer()
{
	if(PopupTexts[iIndex].sTopPopupMessage != "")
	{
		HUD.EndCutScene();
	}
	
	HUD.CutTextController.SetFontColor(127, 127, 255, 255);
	
	return true;
}

function string GetActionString()
{
	if(!bPickRandom)
	{
		return ActionString @ "-- Popping up text onto screen for" @ string(PopupTexts[0].fPopupDuration) @ "seconds";
	}
	else
	{
		return ActionString @ "-- Popping up a random text onto screen";
	}
}


defaultproperties
{
	cTextColor=(R=127,G=127,B=255,A=255)
	ActionString="Popup Text"
}