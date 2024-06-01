// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MPlayerStart extends PlayerStart
	Hidecategories(PlayerStart)
	Config(MPak);


struct FadeStruct
{
	var() bool bFadeScreen, bFlash, bHideHUDDuringFade;
	var() Color ScreenColor;
	var() float fFadeTime;
	var() KWGame.enumMoveType FadeType;
};

struct AnnounceStruct
{
	var() string sMessage;
	var() float fAnnTime;
	var() Color AnnColor;
};

var(MPlayerStart_Stage_0) name nPreStartingEvent;
var(MPlayerStart_Stage_1) bool bClearInventory;
var(MPlayerStart_Stage_2) string sStartingMovie;
var(MPlayerStart_Stage_2) bool bMovieUsesSound;
var(MPlayerStart_Stage_3) string sStartingMenu;
var(MPlayerStart_Stage_4) string sStartingMusicName;
var(MPlayerStart_Stage_4) float fMusicFadeTime, fStartingSoundVolume;
var(MPlayerStart_Stage_4) Sound StartingSound;
var(MPlayerStart_Stage_5) FadeStruct FadeSettings;
var(MPlayerStart_Stage_6) AnnounceStruct AnnounceMessage;
var(MPlayerStart_Stage_7) string sStartingDialog;
var(MPlayerStart_Stage_7) float fStartingDialogDelay;
var(MPlayerStart_Stage_8) name nPostStartingEvent;
var(MPlayerStart_Stage_9) bool bAutoSave;
var(MPlayerStart_Stage_9) float fAutoSaveDelay;
var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var array<KWHudItem> HudItems;
var BaseCam Cam;
var MUtils U;


event PostBeginPlay()
{
	super.PostBeginPlay();
	
	U = GetUtils();
}

function MUtils GetUtils()
{
	local MUtils Ut;
	
	foreach DynamicActors(class'MUtils', Ut)
	{
		return Ut;
	}
	
	return Spawn(class'MUtils');
}

auto state PlayerStart
{
	Begin:
	
	PC = U.GetPC();
	
	if(FadeSettings.bFadeScreen && FadeSettings.fFadeTime > 0.0)
	{
		U.FadeScreen(U.MakeColor(0, 0, 0, 255));
		
		if(FadeSettings.bHideHUDDuringFade)
		{
			HUD = U.GetHUD();
			HUD.bHideHUD = true;
		}
	}
	
	if(nPreStartingEvent != 'None')
	{
		TriggerEvent(nPreStartingEvent, none, none);
	}
	
	if(bClearInventory)
	{
		U.ClearInventory();
	}
	
	if(sStartingMovie != "")
	{
		U.PlayMovie(sStartingMovie, bMovieUsesSound);
		
		while(U.IsMoviePlaying())
		{
			Sleep(0.01);
		}
	}
	
	if(sStartingMenu != "")
	{
		PC.ClientOpenMenu(sStartingMenu);
		PC.SetPause(true);
	}
	
	if(sStartingMusicName != "")
	{
		U.PlayAMusic(sStartingMusicName, fMusicFadeTime);
	}
	
	if(StartingSound != none)
	{
		U.PlayASound(, StartingSound, fStartingSoundVolume);
	}
	
	if(FadeSettings.bFadeScreen)
	{
		U.FadeScreen(FadeSettings.ScreenColor, FadeSettings.fFadeTime, FadeSettings.FadeType, FadeSettings.bFlash);
		
		if(FadeSettings.fFadeTime > 0.0)
		{
			Sleep(FadeSettings.fFadeTime);
		}
		
		if(FadeSettings.bHideHUDDuringFade)
		{
			HUD.bHideHUD = false;
		}
	}
	
	if(AnnounceMessage.sMessage != "")
	{
		U.Announce(AnnounceMessage.sMessage, AnnounceMessage.fAnnTime, AnnounceMessage.AnnColor);
		
		if(AnnounceMessage.fAnnTime > 0.0)
		{
			Sleep(AnnounceMessage.fAnnTime);
		}
	}
	
	if(sStartingDialog != "")
	{
		HP = U.GetHP();
		
		if(fStartingDialogDelay > 0.0)
		{
			Sleep(fStartingDialogDelay);
		}
		
		KWPawn(HP).DeliverLocalizedDialog(sStartingDialog, true,,,, true);
	}
	
	if(nPostStartingEvent != 'None')
	{
		Sleep(0.01);
		
		TriggerEvent(nPostStartingEvent, none, none);
	}
	
	if(bAutoSave)
	{
		if(fAutoSaveDelay > 0.0)
		{
			Sleep(fAutoSaveDelay);
		}
		
		HP = U.GetHP();
		
		while(HP.IsInState('MountFinish') || HP.IsInState('MountHanging'))
		{
			Sleep(0.01);
			
			HP = U.GetHP();
		}
		
		U.SaveAGame(0, true);
	}
	
	GotoState('');
}


defaultproperties
{
	bMovieUsesSound=true
	fMusicFadeTime=1.0
	fStartingSoundVolume=0.4
	FadeSettings=(bFadeScreen=true,fFadeTime=4.0,FadeType=MOVE_TYPE_EASE_FROM_AND_TO,bHideHUDDuringFade=true)
	AnnounceMessage=(fAnnTime=6.0,AnnColor=(R=255,G=255,B=255,A=255))
	bAutoSave=true
	fAutoSaveDelay=1.0
	bStatic=false
}