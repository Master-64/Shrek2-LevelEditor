// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_ChangeLevel extends MScriptedAction
	Config(MPak);


struct FadeStruct
{
	var() Color ScreenColor;
	var() float fFadeTime;
	var() KWGame.enumMoveType FadeType;
	var() bool bFlash;
};

var(Action) string NextLevelName, NewGameState;
var(Action) bool bShowLoadingImage, bSetGameState, bFadeScreen, bFadeOutMusic, bTravelInventory;
var(Action) FadeStruct FadeSettings;
var(Action) float fLevelTransitionTime;


function bool InitActionFor(ScriptedController C)
{
	local MDelayLevelTransition LT;
	
	GetUtils(C);
	PC = U.GetPC();
	
	if(bSetGameState)
	{
		KWGame(C.Level.Game).SetGameState(NewGameState);
	}
	
	if(bFadeScreen)
	{
		U.FadeScreen(FadeSettings.ScreenColor, FadeSettings.fFadeTime, FadeSettings.FadeType, FadeSettings.bFlash);
	}
	
	if(bFadeOutMusic)
	{
		U.StopAMusic(fLevelTransitionTime);
	}
	
	LT = C.Spawn(class'MDelayLevelTransition');
	LT.fSleepFor = fLevelTransitionTime;
	LT.NextLevelName = NextLevelName;
	LT.bShowLoadingImage = bShowLoadingImage;
	LT.bTravelInventory = bTravelInventory;
	LT.GotoState('WaitForTime');
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Changing to level" @ NextLevelName;
}


defaultproperties
{
	bShowLoadingImage=true
	NewGameState="GSTATE000"
	bFadeScreen=true
	FadeSettings=(ScreenColor=(R=0,G=0,B=0,A=255),fFadeTime=0.0,FadeType=MOVE_TYPE_EASE_FROM,bFlash=false)
	bTravelInventory=true
	ActionString="Change Level"
}