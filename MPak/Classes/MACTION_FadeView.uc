// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_FadeView extends MScriptedAction
	Config(MPak);


var(Action) Color ScreenColor;
var(Action) float fFadeTime;
var(Action) KWGame.enumMoveType FadeType;
var(Action) bool bFlash, bRandomizeColor;


function bool InitActionFor(ScriptedController C)
{
	local Color TempColor;
	
	if(bRandomizeColor)
	{
		TempColor.R = Rand(256);
		TempColor.G = Rand(256);
		TempColor.B = Rand(256);
		TempColor.A = ScreenColor.A;
	}
	else
	{
		TempColor = ScreenColor;
	}
	
	U.FadeScreen(TempColor, fFadeTime, FadeType, bFlash);
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Fading the screen";
}


defaultproperties
{
	ScreenColor=(R=127,G=127,B=127,A=255)
	ActionString="Fade View"
}