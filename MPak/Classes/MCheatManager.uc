// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCheatManager extends CheatManager within MController
	Config(MPak);


exec function MPakVersion()
{
	local float fSavedAnnTime;
	local byte SavedAnnColorR, SavedAnnColorG, SavedAnnColorB;
	
	fSavedAnnTime = Outer.fAnnTime;
	SavedAnnColorR = Outer.AnnColorR;
	SavedAnnColorG = Outer.AnnColorG;
	SavedAnnColorB = Outer.AnnColorB;
	
	Outer.fAnnTime = 6.4;
	Outer.AnnColorR = 0;
	Outer.AnnColorG = 255;
	Outer.AnnColorB = 0;
	
	Announce("The current MPak version is:" @ class'MVersion'.default.Version);
	Outer.U.CMAndLog("The current MPak version is:" @ class'MVersion'.default.Version);
	
	Outer.fAnnTime = fSavedAnnTime;
	Outer.AnnColorR = SavedAnnColorR;
	Outer.AnnColorG = SavedAnnColorG;
	Outer.AnnColorB = SavedAnnColorB;
}

exec function MReviewJumpSpots(name TestLabel) // It's unknown what this console command does
{
	switch(TestLabel)
	{
		case 'Transloc':
			TestLabel = 'Begin';
			
			break;
		case 'Jump':
			TestLabel = 'Finished';
			
			break;
		case 'Combo':
			TestLabel = 'FinishedJumping';
			
			break;
		case 'LowGrav':
			TestLabel = 'FinishedComboJumping';
			
			break;
		default:
			break;
	}
	
	Outer.U.CMAndLog("TestLabel is" @ string(TestLabel));
	Outer.Level.Game.ReviewJumpSpots(TestLabel);
}

exec function ListStaticActors()
{
	local Actor A;
	local int i;
	
	foreach Outer.AllActors(class'Actor', A)
	{
		if(A.bStatic)
		{
			i++;
			
			Outer.Log(string(i) @ string(A));
		}
	}
	
	Outer.U.CMAndLog("Num static actors:" @ string(i));
}

exec function MListDynamicActors()
{
	local Actor A;
	local int i;
	
	foreach Outer.DynamicActors(class'Actor', A)
	{
		i++;
		
		Outer.Log(string(i) @ string(A));
	}
	
	Outer.U.CMAndLog("Num dynamic actors:" @ string(i));
}

exec function MFreezeFrame(float Delay)
{
	Outer.Level.Game.SetPause(true, Outer);
	Outer.Level.PauseDelay = Outer.Level.TimeSeconds + Delay;
}

exec function MWriteToLog()
{
	Outer.U.CMAndLog("NOW!");
}

exec function MSetFlash(float F)
{
	Outer.FlashScale.X = F;
}

exec function MKillViewedActor()
{
	if(Outer.ViewTarget != none)
	{
		if(Pawn(Outer.ViewTarget) != none && Pawn(Outer.ViewTarget).Controller != none)
		{
			Outer.U.FancyDestroy(Pawn(Outer.ViewTarget).Controller);
		}
		
		Outer.U.FancyDestroy(Outer.ViewTarget);
		Outer.SetViewTarget(none);
	}
}

exec function MLogScriptedSequences()
{
	local AIScript S;
	
	foreach Outer.AllActors(class'AIScript', S)
	{
		S.bLoggingEnabled =	!S.bLoggingEnabled;
	}
}

exec function MTeleport()
{
	local Actor HitActor;
	local vector HitNormal, HitLocation;
	
	HitActor = Outer.Trace(HitLocation, HitNormal, Outer.ViewTarget.Location + Outer.fTeleportDist * vector(Outer.Rotation), Outer.ViewTarget.Location, true);
	
	if(HitActor == None)
	{
		HitLocation = Outer.ViewTarget.Location + Outer.fTeleportDist * vector(Outer.Rotation);
	}
	else
	{
		HitLocation = HitLocation + Outer.ViewTarget.CollisionRadius * HitNormal;
	}
	
	Outer.U.MFancySetLocation(Outer.ViewTarget, HitLocation);
}

exec function MChangeSize(float F)
{
	if(Outer.Pawn.SetCollisionSize(Outer.Pawn.default.CollisionRadius * F, Outer.Pawn.default.CollisionHeight * F))
	{
		Outer.Pawn.SetDrawScale(F);
		Outer.U.MFancySetLocation(Outer.Pawn, Outer.Pawn.Location);
	}
}

exec function MLockCamera()
{
	if(Outer.bUseBaseCam && Outer.Camera != none)
	{
		if(Outer.Camera.GetStateName() != 'StateMenuCam')
		{
			Outer.LastState = Outer.GetStateName();
			Outer.GotoState('StateNoPawnMove');
			Outer.Camera.SetCameraMode(Outer.Camera.GetModeFromString("MenuCam"));
		}
		else
		{
			Outer.GotoState(Outer.LastState);
			Outer.Camera.InitTarget(Outer.Pawn, 0.0, true);
		}
	}
}

exec function MSetCameraDist(string S)
{
	local array<string> TokenArray;
	local BaseCam BC;
	
	TokenArray = Outer.U.Split(S);
	
	if(TokenArray.Length < 1)
	{
		Outer.Warn("Master Cheat Manager (MSetCameraDist) -- Missing arguments; aborting process");
		
		return;
	}
	
	foreach Outer.DynamicActors(class'BaseCam', BC)
	{
		BC.fDesiredLookAtDistance = float(TokenArray[0]);
		
		if(TokenArray.Length < 2)
		{
			return;
		}
		else if(bool(TokenArray[1]))
		{
			BC.fCurrLookAtDistance = float(TokenArray[0]);
		}
	}
}

exec function MCauseEvent(name EventName)
{
	Outer.TriggerEvent(EventName, Outer.Pawn, Outer.Pawn);
}

exec function UnCauseEvent(name EventName)
{
	Outer.UnTriggerEvent(EventName, Outer.Pawn, Outer.Pawn);
}

exec function MAmphibious()
{
	Outer.Pawn.UnderWaterTime = Outer.U.GetMaxFloat();
}

exec function MFly()
{
	Outer.Pawn.UnderWaterTime = Outer.Pawn.default.UnderWaterTime;
	Outer.U.CM("You feel much lighter");
	Outer.Pawn.SetCollision(true, true, true);
	Outer.Pawn.bCollideWorld = true;
	Outer.bCheatFlying = true;
	Outer.Pawn.bCanDoubleJump = false;
	Outer.GotoState('PlayerFlying');
}

exec function MGhost()
{
	if(!Outer.Pawn.IsA('Vehicle'))
	{
		Outer.Pawn.UnderWaterTime = -1.0;
		Outer.U.CM("You feel ethereal");
		Outer.Pawn.SetCollision(false, false, false);
		Outer.Pawn.bCollideWorld = false;
		Outer.bCheatFlying = true;
		Outer.Pawn.bCanDoubleJump = false;
		Outer.GotoState('PlayerFlying');
	}
	else
	{
		Outer.U.CMAndLog("Can't ghost in vehicles");
	}
}

exec function MWalk()
{
	Outer.bCheatFlying = false;
	Outer.Pawn.UnderWaterTime = Outer.Pawn.default.UnderWaterTime;
	Outer.Pawn.SetCollision(true, true, true);
	Outer.Pawn.SetPhysics(PHYS_Walking);
	Outer.Pawn.bCollideWorld = true;
	Outer.Pawn.bCanDoubleJump = Outer.Pawn.default.bCanDoubleJump;
	Outer.ClientReStart();
	Outer.Pawn.bPhysicsAnimUpdate = Outer.Pawn.default.bPhysicsAnimUpdate;
	
	if(Outer.Pawn.IsA('SHHeroPawn'))
	{
		SHHeroPawn(Outer.Pawn).FallOrginLocation = Outer.Pawn.Location;
	}
	
	Outer.Pawn.Landed(Outer.Pawn.Location);
}

exec function MGod(bool bGod)
{
	if(bGod)
	{
		Outer.bGodMode = true;
		SHHeroPawn(Outer.Pawn).AmInvunerable = true;
		Outer.U.CM("God mode on");
	}
	else
	{
		Outer.bGodMode = false;
		SHHeroPawn(Outer.Pawn).AmInvunerable = false;
		Outer.U.CM("God mode off");
	}
}

exec function MSloMo(float F)
{
	Outer.Level.Game.SetGameSpeed(F);
}

exec function SloMoSave(float F)
{
	Outer.Level.Game.SetGameSpeed(F);
	Outer.Level.Game.SaveConfig();
	Outer.Level.Game.GameReplicationInfo.SaveConfig();
}

exec function SetPotions(int I)
{
	Outer.U.SetInventory(class'Potion1Collection', I);
	Outer.U.SetInventory(class'Potion2Collection', I);
	Outer.U.SetInventory(class'Potion3Collection', I);
	Outer.U.SetInventory(class'Potion4Collection', I);
	Outer.U.SetInventory(class'Potion5Collection', I);
	Outer.U.SetInventory(class'Potion6Collection', I);
	Outer.U.SetInventory(class'Potion7Collection', I);
	Outer.U.SetInventory(class'Potion8Collection', I);
	Outer.U.SetInventory(class'Potion9Collection', I);
}

exec function SetCoins(int I)
{
	Outer.U.SetInventory(class'CoinCollection', I);
}

exec function MSetHealth(float H)
{
	Outer.U.SetHealth(Outer.Pawn, H, Outer.bModifyHealthKnockback,, Outer.bModifyHealthSFX);
}

exec function AddHealth(float H)
{
	Outer.U.AddHealth(Outer.Pawn, H, Outer.bModifyHealthKnockback,, Outer.bModifyHealthSFX);
}

exec function SetShamrocks(int I)
{
	Outer.U.SetShamrocks(I,, true);
}

exec function AddShamrocks(int I)
{
	Outer.U.AddShamrocks(I,, true);
}

exec function MSetJumpZ(string S)
{
	local array<string> TokenArray;
	
	TokenArray = Outer.U.Split(S);
	
	if(TokenArray.Length < 1)
	{
		Outer.Warn("Master Cheat Manager (MSetJumpZ) -- Missing arguments; aborting process");
		
		return;
	}
	
	if(TokenArray.Length > 1)
	{
		if(bool(TokenArray[1]))
		{
			if(Outer.Pawn.IsA('KWPawn'))
			{
				KWPawn(Outer.Pawn).DoubleJumpZ = float(TokenArray[0]);
			}
		}
		else
		{
			Outer.Pawn.JumpZ = float(TokenArray[0]);
		}
	}
	else
	{
		Outer.Pawn.JumpZ = float(TokenArray[0]);
	}
}

exec function MSetGravity(float F)
{
	Outer.PhysicsVolume.Gravity.Z = F;
}

exec function MSetSpeed(float F)
{
	if(Outer.Pawn.IsA('KWPawn'))
	{
		KWPawn(Outer.Pawn).GroundRunSpeed = F;
	}
}

exec function MKillAll(class<Actor> aClass)
{
	local Actor A;
	
	if(Outer.ClassIsChildOf(aClass, class'AIController'))
	{
		Outer.Level.Game.KillBots(Outer.Level.Game.NumBots);
		
		return;
	}
	
	if(Outer.ClassIsChildOf(aClass, class'Pawn'))
	{
		MKillAllPawns(class<Pawn>(aClass));
		
		return;
	}
	
	foreach Outer.AllActors(class'Actor', A)
	{
		if(Outer.ClassIsChildOf(A.Class, aClass))
		{
			Outer.U.FancyDestroy(A);
		}
	}
}

function MKillAllPawns(class<Pawn> aClass)
{
	local Pawn P;
	
	Outer.Level.Game.KillBots(Outer.Level.Game.NumBots);
	
	foreach Outer.AllActors(class'Pawn', P)
	{
		if(Outer.ClassIsChildOf(P.Class, aClass) && !P.IsPlayerPawn())
		{
			Outer.U.FancyDestroy(P);
		}
	}
}

exec function MKillPawns()
{
	MKillAllPawns(class'Pawn');
}

exec function MAvatar(string ClassName)
{
	local class<Actor> NewClass;
	local Pawn P;
	
	NewClass = Outer.U.GetClassByString(ClassName);
	
	foreach Outer.AllActors(class'Pawn', P)
	{
		if(P.Class == NewClass && P != Outer.Pawn)
		{
			if(Outer.Pawn.Controller != none)
			{
				Outer.Pawn.Controller.PawnDied(Outer.Pawn);
			}
			
			Outer.Possess(P);
		}
	}
}

exec function MSummon(string S)
{
	local class<Actor> NewClass;
	local vector SpawnLoc;
	local Actor A;
	
	NewClass = Outer.U.GetClassByString(S);
	
	if(Outer.Pawn != none)
	{
		SpawnLoc = Outer.Pawn.Location;
	}
	else
	{
		SpawnLoc = Outer.Location;
	}
	
	if(!Outer.U.MFancySpawn(NewClass, SpawnLoc + 72.0 * vector(Outer.Rotation) + Outer.U.Vec(0.0, 0.0, 1.0) * 15.0, Outer.Rotation, A, Outer.iSummonRetryAttempts))
	{
		Outer.U.CM("Failed to spawn actor");
		
		return;
	}
	
	Outer.U.GivePawnController(KWPawn(A));
}

exec function MPlayersOnly()
{
	Outer.Level.bPlayersOnly = !Outer.Level.bPlayersOnly;
}

exec function MCheatView(class<Actor> aClass, optional bool bQuiet)
{
	MViewClass(aClass, bQuiet, true);
}

exec function MFocusOn(optional class<Actor> aClass, optional bool bQuiet)
{
	local HUD H;
	
	foreach Outer.AllActors(class'HUD', H)
	{
		H.bShowDebugInfo = true;
		Outer.HUD.SetPropertyText("bPortalDebugView", "True");
	}
	
	if(aClass != none)
	{
		MViewClass(aClass, bQuiet);
	}
}

exec function MFocusOff()
{
	local HUD H;
	
	foreach Outer.AllActors(class'HUD', H)
	{
		Outer.HUD.SetPropertyText("bPortalDebugView", "False");
	}
}

exec function MRememberSpot()
{
	if(Outer.Pawn != none)
	{
		Outer.Destination = Outer.Pawn.Location;
	}
	else
	{
		Outer.Destination = Outer.Location;
	}
}

exec function MViewSelf(optional bool bQuiet)
{
	Outer.bBehindView = false;
	Outer.bViewBot = false;
	
	SetViewTarget(Outer.Pawn);
	
	if(!bQuiet)
	{
		Outer.U.CM(Outer.OwnCamera);
	}
	
	Outer.FixFOV();
}

exec function MViewActor(name ActorName)
{
	local Actor A;
	
	foreach Outer.AllActors(class'Actor', A)
	{
		if(A.Name == ActorName)
		{
			SetViewTarget(A);
			Outer.bBehindView = true;
			MHandleViewTargetCam(Outer.ViewTarget);
			
			break;
		}
	}
}

exec function MViewTag(name TagName)
{
	local Actor A;
	
	foreach Outer.AllActors(class'Actor', A, TagName)
	{
		SetViewTarget(A);
		Outer.bBehindView = true;
		MHandleViewTargetCam(Outer.ViewTarget);
		
		break;
	}
}

exec function MViewBot()
{
	local Actor first;
	local bool bFound;
	local Controller C;
	
	Outer.bViewBot = true;
	Outer.myHUD.bShowDebugInfo = true;
	Outer.myHUD.SetPropertyText("bDrawLines", "True");
	C = Outer.Level.ControllerList;
	
	if(C != none)
	{
		if(C.IsA('AIController') && C.Pawn != none)
		{
			SetDebug(false);
			
			if(bFound || first == none)
			{
				SetDebug(true);
				
				first = C.Pawn;
			}
			else
			{
				if(C.Pawn == Outer.ViewTarget || Outer.ViewTarget == none)
				{
					bFound = true;
				}
			}
		}
		
		C = C.nextController;
	}
	
	if(first != none)
	{
		SetViewTarget(first);
		Outer.bBehindView = true;
		Outer.U.CM("ALLRIGHT!!!");
		Outer.ViewTarget.BecomeViewTarget();
		Outer.FixFOV();
	}
	else
	{
		Outer.U.CM("DAMMIT!!!"); // Kids game by the way
		MViewSelf(true);
	}
}

function SetDebug(bool B) // Used in ViewBot to toggle debug mode
{
	local KWAIController KWAI;
	
	foreach Outer.DynamicActors(class'KWAIController', KWAI)
	{
		KWAI.bDebug = B;
	}
}

exec function MViewClass(class<Actor> aClass, optional bool bQuiet, optional bool bCheat)
{
	local Actor Other, first;
	local bool bFound;
	
	if(Outer.Level.Game != none && !Outer.Level.Game.bCanViewOthers)
	{
		return;
	}
	
	first = none;
	
	foreach Outer.AllActors(aClass, Other)
	{
		if(bFound || first == none)
		{
			first = Other;
			
			if(bFound)
			{
				break;
			}
		}
		
		if(Other == Outer.ViewTarget)
		{
			bFound = true;
		}
	}
	
	if(first != none)
	{
		if(!bQuiet)
		{
			if(Pawn(first) != none)
			{
				Outer.U.CM(Outer.ViewingFrom @ first.GetHumanReadableName());
			}
			else
			{
				Outer.U.CM(Outer.ViewingFrom @ string(first));
			}
		}
		
		SetViewTarget(first);
		Outer.bBehindView = Outer.ViewTarget != Outer.Pawn;
		
		if(Outer.bBehindView)
		{
			Outer.ViewTarget.BecomeViewTarget();
		}
		
		Outer.FixFOV();
		MHandleViewTargetCam(Outer.ViewTarget);
	}
	else
	{
		MViewSelf(bQuiet);
	}
}

function MHandleViewTargetCam(Actor ViewTarget); // Does nothing, but as it's in the game by default, it's kept in here

exec function MSetMinPibBossHealth()
{
	SetMinPibBossHealth();
}

exec function SetMinPibBossHealth()
{
	local BossPIB Boss;
	
	foreach Outer.DynamicActors(class'BossPIB', Boss)
	{
		Outer.U.SetHealth(Boss, 1.0);
	}
}

exec function MSetMinFGMBossHealth()
{
	SetMinFGMBossHealth();
}

exec function SetMinFGMBossHealth()
{
	local BossFGM Boss;
	
	foreach Outer.DynamicActors(class'BossFGM', Boss)
	{
		Outer.U.SetHealth(Boss, 1.0);
	}
}

exec function MSetMinFatKnightHealth()
{
	SetMinFatKnightHealth();
}

exec function SetMinFatKnightHealth()
{
	local FatKnight Boss;
	
	foreach Outer.DynamicActors(class'FatKnight', Boss)
	{
		Outer.U.SetHealth(Boss, 1.0);
	}
}

exec function ShowAINodes(bool bAINodesEnabled)
{
	if(bAINodesEnabled)
	{
		Outer.myHUD.bShowDebugInfo = true;
		Outer.myHUD.SetPropertyText("bDrawLines", "True");
		
		Outer.U.CM("AI nodes turned on");
	}
	else
	{
		Outer.myHUD.bShowDebugInfo = false;
		Outer.myHUD.SetPropertyText("bDrawLines", "False");
		
		Outer.U.CM("AI nodes turned off");
	}
}

exec function MInvisible(bool bInvisibilityEnabled)
{
	local bool B;
	
	B = bool(GetProp("CurrentPlayer bInvisible", true));
	
	if(!B && bInvisibilityEnabled)
	{
		Outer.U.CC("ToggleVisibility");
		
		Outer.U.CM("Invisibility turned on");
	}
	else if(B && !bInvisibilityEnabled)
	{
		Outer.U.CC("ToggleVisibility");
		
		Outer.U.CM("Invisibility turned off");
	}
}

exec function NoTarget(bool bNoTargetEnabled)
{
	if(Outer.Pawn.IsA('SHHeroPawn') && bNoTargetEnabled)
	{
		SHHeroPawn(Outer.Pawn).bInvisible = true;
		
		Outer.U.CM("NoTarget turned on");
	} 
	else
	{
		SHHeroPawn(Outer.Pawn).bInvisible = false;
		
		Outer.U.CM("NoTarget turned off");
	}
}

exec function FullDebug(bool bFullDebug)
{
	if(bFullDebug)
	{
		Outer.U.SetDebugMode(true);
		
		Outer.U.CM("Both debug modes turned on");
	}
	else
	{
		Outer.U.SetDebugMode(false);
		
		Outer.U.CM("Both debug modes turned off");
	}
}

exec function SummonNoRot(string S)
{
	local class<Actor> NewClass;
	local vector SpawnLoc;
	local rotator TempRot;
	local Actor A;
	
	NewClass = Outer.U.GetClassByString(S);
	
	if(Pawn != none)
	{
		SpawnLoc = Outer.Pawn.Location;
	}
	else
	{
		SpawnLoc = Outer.Location;
	}
	
	TempRot = Outer.Rotation;
	TempRot.Pitch = 0;
	
	if(!Outer.U.MFancySpawn(NewClass, SpawnLoc + 72.0 * vector(Outer.Rotation) + Outer.U.Vec(0.0, 0.0, 1.0) * 15.0, TempRot, A, Outer.iSummonRetryAttempts))
	{
		Outer.U.CM("Failed to spawn actor");
		
		return;
	}
	
	Outer.U.GivePawnController(KWPawn(A));
}

exec function SummonCoords(string S)
{
	local array<string> TokenArray;
	local class<Actor> NewClass;
	local vector SpawnLoc;
	local Actor A;
	
	TokenArray = Outer.U.Split(S);
	
	if(TokenArray.Length < 4)
	{
		Outer.Warn("Master Cheat Manager (SummonCoords) -- Missing arguments; aborting process");
		
		return;
	}
	
	NewClass = Outer.U.GetClassByString(TokenArray[0]);
	
	SpawnLoc.X = float(TokenArray[1]);
	SpawnLoc.Y = float(TokenArray[2]);
	SpawnLoc.Z = float(TokenArray[3]);
	
	if(!U.MFancySpawn(NewClass, SpawnLoc, Outer.U.Rota(0, 0, 0), A, Outer.iSummonRetryAttempts))
	{
		Outer.U.CM("Failed to spawn actor");
		
		return;
	}
	
	Outer.U.GivePawnController(KWPawn(A));
}

exec function SetProp(string S, optional bool bSilent)
{
	local array<string> TokenArray;
	local Actor TargetActor;
	local string ActorTag, Variable, Value;
	local name ActorTagName;
	local int i;
	
	TokenArray = Outer.U.Split(S);
	
	if(TokenArray.Length < 3)
	{
		Outer.Warn("Master Cheat Manager (SetProp) -- Missing arguments; aborting process");
		
		return;
	}
	
	if(Caps(TokenArray[0]) == "CURRENTPLAYER")
	{
		ActorTag = string(Outer.Pawn.Tag);
		ActorTagName = Outer.Pawn.Tag;
	}
	else
	{
		ActorTag = TokenArray[0];
		ActorTagName = Outer.U.SName(TokenArray[0]);
	}
	
	Variable = TokenArray[1];
	Value = TokenArray[2];
	
	// If further strings are found in the split strings provided, we assume it's all a single string and merge any further strings with the <Value>
	if(TokenArray.Length > 3)
	{
		for(i = 3; i < TokenArray.Length; i++)
		{
			Value = Value @ TokenArray[i];
		}
	}
	
	foreach Outer.AllActors(class'Actor', TargetActor, ActorTagName)
	{
		TargetActor.SetPropertyText(Variable, Value);
		
		if(!bSilent)
		{
			Outer.U.CM("Set Prop" @ ActorTag @ Variable @ "=" @ Value);
		}
	}
}

exec function string GetProp(string S, optional bool bSilent)
{
	local array<string> TokenArray;
	local Actor TargetActor;
	local string ActorTag, Variable, Value;
	local name ActorTagName;
	
	TokenArray = Outer.U.Split(S);
	
	if(TokenArray.Length < 2)
	{
		Outer.Warn("Master Cheat Manager (GetProp) -- Missing arguments; aborting process");
		
		return "";
	}
	
	if(Caps(TokenArray[0]) == "CURRENTPLAYER")
	{
		ActorTagName = Outer.Pawn.Tag;
		ActorTag = string(Outer.Pawn.Tag);
	}
	else
	{
		ActorTagName = Outer.U.SName(TokenArray[0]);
		ActorTag = TokenArray[0];
	}
	
	Variable = TokenArray[1];
	
	foreach AllActors(class'Actor', TargetActor, ActorTagName)
	{
		Value = TargetActor.GetPropertyText(Variable);
		
		if(!bSilent)
		{
			Outer.U.CM("Get Prop" @ ActorTag @ Variable @ "=" @ Value);
		}
	}
	
	return Value;
}

exec function name WhoAmI()
{
	Outer.U.CMAndLog("I am currently:" @ string(Outer.Pawn.Name));
	
	return Outer.Pawn.Name;
}

exec function Rocket()
{
	Outer.GotoState('PlayerRocketing');
	
	Outer.U.CM("You feel like a rocket");
}

exec function Spider()
{
	Outer.GotoState('PlayerSpidering');
	
	Outer.U.CM("You feel like a spider");
}

exec function Driving()
{
	Outer.GotoState('PlayerDriving');
	
	Outer.U.CM("You feel like a desert bus");
}

exec function Announce(string Msg)
{
	Outer.U.Announce(Msg, Outer.fAnnTime, Outer.U.MakeColor(Outer.AnnColorR, Outer.AnnColorG, Outer.AnnColorB, 255));
	
	Outer.U.CM("Announcing");
}

exec function AnnounceTime(float F)
{
	Outer.fAnnTime = F;
	
	Outer.U.CM("Announcement settings changed: ( Announcement time =" @ string(Outer.fAnnTime) @ ")");
}

exec function AnnounceColor(string S)
{
	local array<string> TokenArray;
	
	TokenArray = Outer.U.Split(S);
	
	if(TokenArray.Length < 3)
	{
		Outer.Warn("Master Cheat Manager (AnnounceColor) -- Missing arguments; aborting process");
		
		return;
	}
	
	Outer.AnnColorR = float(TokenArray[0]);
	Outer.AnnColorG = float(TokenArray[1]);
	Outer.AnnColorB = float(TokenArray[2]);
	
	Outer.U.CM("Announcement settings changed: ( Announcement color (Red):" @ string(Outer.AnnColorR) @ "| Announcement color (Green):" @ string(Outer.AnnColorG) @ "| Announcement color (Blue):" @ string(Outer.AnnColorB) @ ")");
}

exec function TP(string S)
{
	local array<string> TokenArray;
	local string X, Y, Z;
	local vector Loc;
	
	TokenArray = Outer.U.Split(S);
	
	if(TokenArray.Length < 3)
	{
		Outer.Warn("Master Cheat Manager (TP) -- Missing arguments; aborting process");
		
		return;
	}
	
	X = TokenArray[0];
	Y = TokenArray[1];
	Z = TokenArray[2];
	
	Loc.X = float(X);
	Loc.Y = float(Y);
	Loc.Z = float(Z);
	
	OldTPLoc = Outer.Pawn.Location;
	
	if(!Outer.U.MFancySetLocation(Outer.Pawn, Loc, Outer.iTPRetryAttempts))
	{
		Outer.U.CM("Failed to teleport to:" @ X @ Y @ Z);
		
		return;
	}
	
	Outer.bCanTPBack = true;
	
	Outer.U.CM("Teleporting to:" @ X @ Y @ Z);
}

exec function TPBack()
{
	if(!Outer.bCanTPBack)
	{
		return;
	}
	
	if(Outer.bTPBackOncePerTP)
	{
		Outer.bCanTPBack = false;
	}
	
	if(!Outer.U.MFancySetLocation(Outer.Pawn, Outer.OldTPLoc, Outer.iTPRetryAttempts))
	{
		Outer.U.CM("Failed to teleport to:" @ string(Outer.OldTPLoc.X) @ string(Outer.OldTPLoc.Y) @ string(Outer.OldTPLoc.Z));
		
		return;
	}
	
	Outer.U.CM("Teleporting to:" @ string(Outer.OldTPLoc.X) @ string(Outer.OldTPLoc.Y) @ string(Outer.OldTPLoc.Z));
}

exec function WriteString(string S)
{
	Outer.U.CMAndLog(S);
}

exec function WriteStrings(string S)
{
	local array<string> TokenArray;
	local int i;
	
	TokenArray = Outer.U.Split(S);
	
	if(TokenArray.Length < 1)
	{
		Outer.Warn("Master Cheat Manager (WriteStrings) -- Missing arguments; aborting process");
		
		return;
	}
	
	for(i = 0; i < TokenArray.Length; i++)
	{
		Outer.U.CMAndLog(TokenArray[i]);
	}
}

exec function UpdateInv()
{
	Outer.AddCoins(0);
	Outer.AddPotions(0);
	
	Outer.Log("Updated inventory");
}

exec function SetBoth(int I)
{
	SetCoins(I);
	SetPotions(I);
	
	Outer.U.CM("Set" @ string(I) @ "coins and potions to the player");
}

exec function AddBoth(int I)
{
	Outer.AddCoins(I);
	Outer.AddPotions(I);
	
	Outer.U.CM("Added" @ string(I) @ "coins and potions to the player");
}

exec function BossCheat()
{
	local BanditBoss Boss;
	
	SetMinPibBossHealth();
	SetMinFGMBossHealth();
	SetMinFatKnightHealth();
	
	foreach Outer.DynamicActors(class'BanditBoss', Boss)
	{
		Outer.U.SetHealth(Boss, 1.0);
	}
	
	Outer.U.CM("All main bosses are now at 1 HP");
}

exec function ChangeState(string S)
{
	local array<string> TokenArray;
	
	TokenArray = Outer.U.Split(S);
	
	if(TokenArray.Length < 1)
	{
		Outer.Warn("Master Cheat Manager (ChangeState) -- Missing arguments; aborting process");
		
		return;
	}
	
	Outer.NewState = Outer.U.SName(TokenArray[0]);
	
	if(TokenArray.Length > 1)
	{
		if(bool(TokenArray[1]))
		{
			Outer.Pawn.GotoState(Outer.NewState);
		}
		else
		{
			Outer.GotoState(Outer.NewState);
		}
	}
	else
	{
		Outer.GotoState(Outer.NewState);
	}
	
	Outer.U.CM("Switched to state:" @ Outer.NewState);
}

exec function ChangePhysics(int I)
{
	Outer.Pawn.SetPhysics(EPhysics(I));
	
	Outer.U.CM("Switched to physics:" @ string(Outer.Pawn.Physics));
}

exec function AntiAntiCheat()
{
	local MAntiCheat AC;
	
	foreach Outer.DynamicActors(class'MAntiCheat', AC)
	{
		AC.TickEnabled(false);
		Outer.U.FancyDestroy(AC);
	}
	
	Outer.U.CM("M.A.C. (Master's Anti-Cheat) has been permanently disabled");
}

exec function Execute(string S, optional bool bIsSleeping)
{
	local MConsoleCommandDelegate CCD;
	local array<string> TokenArray, ConsoleCommands;
	local float F;
	local int i, iCurrentCC;
	
	TokenArray = Outer.U.Split(S);
	
	if(!bIsSleeping)
	{
		if(TokenArray.Length < 1)
		{
			Outer.Warn("Master Cheat Manager (Execute) -- Missing arguments; aborting process");
			
			return;
		}
	}
	else if(TokenArray.Length < 2)
	{
		Outer.Warn("Master Cheat Manager (SleepFor) -- Missing arguments; aborting process");
		
		return;
	}
	
	if(ExecuteLoopCheck(TokenArray))
	{
		Outer.Warn("Master Cheat Manager (Execute) -- Infinite loop found; aborting process");
		
		return;
	}
	
	if(bIsSleeping)
	{
		F = float(TokenArray[0]);
	}
	
	ConsoleCommands[0] = TokenArray[int(bIsSleeping)];
	
	// String merger
	for(i = 1 + int(bIsSleeping); i < TokenArray.Length; i++)
	{
		// If the keyword "|" is used between the command, we queue another console command to run
		if(Caps(TokenArray[i]) == "|")
		{
			iCurrentCC++;
			
			ConsoleCommands[iCurrentCC] = "";
			
			continue;
		}
		
		if(ConsoleCommands[iCurrentCC] == "")
		{
			// Starting a new console command
			ConsoleCommands[iCurrentCC] = TokenArray[i];
		}
		else 
		{
			// Adding a second part to the console command
			ConsoleCommands[iCurrentCC] = ConsoleCommands[iCurrentCC] @ TokenArray[i];
		}
	}
	
	if(!bIsSleeping)
	{
		Outer.U.CM("Executing the following console commands:");
	}
	else
	{
		Outer.U.CM("Sleeping for" @ string(F) @ "seconds, then executing the following console commands:");
	}
	
	for(i = 0; i < ConsoleCommands.Length; i++)
	{
		Outer.U.CM(ConsoleCommands[i]);
	}
	
	CCD = Outer.Spawn(class'MConsoleCommandDelegate');
	
	if(bIsSleeping)
	{
		CCD.fSleepFor = F;
	}
	
	CCD.ConsoleCommandsToRun = ConsoleCommands;
	CCD.GotoState('ExecuteCommands');
}

function bool ExecuteLoopCheck(array<string> TokenArray) // Returns true if an infinite loop is about to be executed within Execute or SleepFor
{
	local bool bLoopFound;
	local int i;
	
	for(i = 0; i < TokenArray.Length; i++)
	{
		if(Caps(TokenArray[i]) == "EXECUTE" || Caps(TokenArray[i]) == "SLEEPFOR")
		{
			bLoopFound = true;
			
			break;
		}
	}
	
	return bLoopFound;
}

exec function SleepFor(string S)
{
	local array<string> TokenArray;
	
	TokenArray = Outer.U.Split(S);
	
	// If true, this console command will act like Execute instead of SleepFor, as for this to be true, it would mean no delay was given
	if(float(TokenArray[0]) < 0.0)
	{
		Execute(S);
	}
	else
	{
		Execute(S, true);
	}
}

exec function PlayASound(string S)
{
	local Sound SoundToPlay;
	
	SoundToPlay = Outer.U.PlayASound(S,, Outer.fPlayASoundVolume);
	
	Outer.U.CM("Playing sound:" @ string(SoundToPlay));
}

exec function PlayADialog(string S)
{
	if(Outer.Pawn.IsA('KWPawn'))
	{
		KWPawn(Outer.Pawn).DeliverLocalizedDialog(S, true, 0, "HPDialog",, true, 1.4, false);
		
		Outer.U.CM("Playing dialog:" @ S);
	}
	else
	{
		Outer.Warn("Master Cheat Manager (PlayADialog) -- Pawn isn't a KWPawn; aborting process");
	}
}

exec function PlayAMusic(string S)
{
	local string sCurrentMusic;
	
	sCurrentMusic = Outer.U.GetCurrentMusic();
	
	Outer.StopAllMusic(1.0);
	
	if(S != "")
	{
		Outer.PlayMusic(S, 1.0);
	}
	
	if(Outer.U.GetCurrentMusic() != sCurrentMusic)
	{
		if(Outer.U.GetCurrentMusic() != "")
		{
			Outer.U.CM("Playing music:" @ Outer.U.GetCurrentMusic());
		}
		else
		{
			Outer.U.CM("Stopping music");
		}
	}
	else
	{
		Outer.U.CM("Music name" @ S @ "is invalid");
	}
}

exec function RefreshJumpVars()
{
	if(Outer.Pawn.IsA('KWPawn'))
	{
		KWPawn(Outer.Pawn).SetJumpVars();
		
		Outer.U.CM("Refreshed all jump variables");
	}
	else
	{
		Outer.Warn("Master Cheat Manager (RefreshJumpVars) -- Pawn isn't a KWPawn; aborting process");
	}
}

exec function SetGameState(string S)
{
	KWGame(Outer.Level.Game).SetGameState(S);
	
	Outer.U.CM("Set GameState to:" @ KWGame(Outer.Level.Game).CurrentGameState);
}

exec function string GetGameState()
{
	Outer.U.CM("GameState is currently:" @ KWGame(Outer.Level.Game).CurrentGameState);
	
	return KWGame(Outer.Level.Game).CurrentGameState;
}

exec function DropCarryingActor(string S)
{
	if(Pawn.IsA('KWPawn'))
	{
		if(bool(S))
		{
			Outer.U.FancyDestroy(KWPawn(Outer.Pawn).aHolding);
		}
		
		KWPawn(Outer.Pawn).DropCarryingActor();
		
		Outer.U.CM("Dropping carried actor");
	}
}

exec function ConsoleKey(byte I)
{
	Outer.U.CC("Set ini:Engine.Engine.Console ConsoleKey" @ string(I));
	
	Outer.U.CM("Rebound the console key to key:" @ Outer.U.CC("KeyName" @ string(I)));
}

exec function ToggleHud()
{
	Outer.myHUD.bHideHud = !Outer.myHUD.bHideHud;
	
	Outer.U.CM("Toggled the visibility of the HUD to:" @ Outer.U.BoolToString(Outer.myHUD.bHideHud));
}

exec function PlayAMovie(string S)
{
	if(Outer.U.PlayMovie(S, true, false))
	{
		Outer.U.CM("Playing movie:" @ Outer.U.FormatMovieString(S));
	}
	else
	{
		Outer.U.CM("Failed to play movie:" @ Outer.U.FormatMovieString(S));
	}
}

exec function SetCrosshairVisibility(bool B)
{
	Outer.bShowCrosshair = B;
}

exec function SetCrosshairDistance(float F)
{
	if(Outer.Cursor != none)
	{
		Outer.Cursor.SetLOSDistance(F);
	}
}


// Command Aliases

exec function LogAIS()
{
	MLogScriptedSequences();
}

exec function CE(name EventName)
{
	MCauseEvent(EventName);
}

exec function UCE(name EventName)
{
	UnCauseEvent(EventName);
}

exec function SH(float F)
{
	MSetHealth(F);
}

exec function SP(int I)
{
	SetPotions(I);
}

exec function SC(int I)
{
	SetCoins(I);
}

exec function SB(int I)
{
	SetPotions(I);
	SetCoins(I);
}

exec function AH(float F)
{
	AddHealth(F);
}

exec function AP(int I)
{
	AddPotions(I);
}

exec function AC(int I)
{
	AddCoins(I);
}

exec function AB(int I)
{
	AddPotions(I);
	AddCoins(I);
}

exec function BC()
{
	BossCheat();
}

exec function MV()
{
	MPakVersion();
}

exec function FD(bool B)
{
	FullDebug(B);
}

exec function AAC()
{
	AntiAntiCheat();
}

exec function SCV(bool B)
{
	SetCrosshairVisibility(B);
}

exec function SCD(float F)
{
	SetCrosshairDistance(F);
}