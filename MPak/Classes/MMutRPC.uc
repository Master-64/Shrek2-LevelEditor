// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MMutRPC extends MMutator
	Config(MPak);


var() class<SHHeroController> NewController;
var KWHeroController TPC;
var KWCutController KWCC;
var array<KWCutController> KWCCs;
var bool bSaveTimerUsed, bIntroCutscenePlayed;
var int i, iAntiSoftlock;


event PostBeginPlay()
{
	super.PostBeginPlay();
	
	Log(class'MVersion'.default.ModName @ class'MVersion'.default.Version @ "-- This level is running Master's RPC mutator, made by Master_64");
}

event PostLoadGame(bool bLoadFromSaveGame)
{
	local SaveTimer ST;
	local MCBGDelegate MCBGD;
	
	if(!bLoadFromSaveGame)
	{
		PC = U.GetPC();
		HP = U.GetHP();
		
		GotoState('WaitForIntro');
		
		return;
	}
	
	// If this is true, that means the old PlayerController still exists and needs to be removed
	if(TPC != none)
	{
		TPC.Destroy();
		
		// If a SaveTimer was used at the beginning of the level, we spawn in a new one to get a more accurate level start
		if(bSaveTimerUsed)
		{
			ST = Spawn(class'SaveTimer');
			ST.timetowait = 1.33; // This is normally 1.0 seconds, but for some reason, it isn't accurate unless it's at 1.33 seconds
		}
	}
	
	// Doing a save-load breaks a beanstalk world's mechanics entirely. Doing this re-syncs the timer and total amount of coins in the level, which normally gets broken
	if(U.IsInBonusLevel())
	{
		MCBGD = Spawn(class'MCBGDelegate');
	}
	
	PC = U.GetPC();
	HP = U.GetHP();
}

function GiveNewController() // Gives/replaces the current PlayerController with an entirely new one
{
	local SaveTimer ST;
	local BaseCam TC;
	local HUD TH;
	
	// Gets rid of any SaveTimers that may exist in the map and remembers a SaveTimer was used for the next time the level is reloaded
	foreach DynamicActors(class'SaveTimer', ST)
	{
		U.FancyDestroy(ST);
		
		bSaveTimerUsed = true;
	}
	
	// All code below this is part of the hack I (Master_64) devised that replaces the current PlayerController even though this is normally impossible
	TPC = PC;							// Saves the old PlayerController before hacking everything
	TH = TPC.myHUD;						// Saves the old HUD reference before hacking everything
	TPC.UnPossess();					// Unpossesses the now old PlayerController, causing both the current player's pawn and the current player's PlayerController to lose their object references
	PC = Spawn(NewController);			// Creates a new controller
	PC.Possess(HP);						// Possesses the original current player with the new controller
	PC.myHUD = TH;						// Obtains the HUD that was originally used within the old PlayerController (if this isn't done, the HUD will be broken)
	PC.SwitchToPawn(KWPawn(HP), 0.0);	// Officially tells the game that we're playing as the current player (without this, the current player will believe he isn't currently controlled)
	
	// Creating a new controller creates a new camera as well. The old camera still exists on the old PlayerController, so this deletes that
	foreach DynamicActors(class'BaseCam', TC)
	{
		if(TC != PC.Camera)
		{
			U.FancyDestroy(TC);
		}
	}
	
	U.SaveAGame(0, true);	// Saves all of the changes we just made
	U.LoadAGame(0, true);	// Loads all of the changes. Doing this properly connects the new controller we just made to the original current player (because somehow KnowWonder's backend code makes this work), allowing us to now play the game
}

state WaitForIntro // Waits until the time is right to execute the replace PlayerController hack
{
	function FadeViewToBlack()
	{
		local FadeViewDelegate Fader;
		
		Fader = Spawn(class'FadeViewDelegate');
		Fader.Init(1.0, 0.0, 0.0, 0.0, 0.0, MOVE_TYPE_LINEAR, false);
	}
	
	Begin:
	
	Sleep(0.01);
	
	// This value will be 0.0 until the player fully loads into the map
	while(SHHeroController(PC).TimeAfterLoading == 0.0)
	{
		Sleep(0.01);
	}
	
	Sleep(0.01);
	
	// If any cinematic cutscenes are playing, wait until that's done
	while(PC.bInCutScene())
	{
		bIntroCutscenePlayed = true;
		
		Sleep(0.01);
	}
	
	// If a cinematic intro cutscene just finished playing, then we need to wait on all KWCutControllers to finish up the cutscene in the background, since we can't save-load during a cinematic cutscene without causing a crash
	if(bIntroCutscenePlayed)
	{
		foreach DynamicActors(class'KWCutController', KWCC)
		{
			KWCCs[KWCCs.Length] = KWCC;
		}
		
		// Runs through all KWCutControllers and waits until they are deleted
		for(i = 0; i < KWCCs.Length; i++)
		{
			while(KWCCs[i] != none)
			{
				Sleep(0.01);
				
				// If for some reason a KWCutController is still doing background work (which shouldn't normally occur), we add 1 to the anti-softlock counter
				if(!PC.bInCutScene())
				{
					iAntiSoftlock++;
				}
				
				// When the anti-softlock counter reaches 100 (or in other words a full second has passed with nothing happening), then we stop waiting on this thread
				if(iAntiSoftlock >= 100)
				{
					break;
				}
			}
			
			iAntiSoftlock = 0;
		}
	}
	
	FadeViewToBlack();
	
	Sleep(0.01);
	
	// Gives/replaces the current PlayerController with an entirely new one
	GiveNewController();
	
	GotoState('');
}


defaultproperties
{
	NewController=class'MController'
}