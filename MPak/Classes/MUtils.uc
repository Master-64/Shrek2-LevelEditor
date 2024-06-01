// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MUtils extends MInfo
	Notplaceable
	Config(MPak);


enum EFont
{
	F_DefaultFont,
	F_ConsoleFont,
	F_SmallFont,
	F_MediumFont,
	F_FontEurostile8,
	F_FontEurostile9,
	F_FontEurostile11,
	F_FontEurostile12,
	F_FontEurostile14,
	F_FontEurostile17,
	F_FontEurostile21,
	F_FontEurostile24,
	F_FontEurostile29,
	F_FontEurostile37,
	F_FontNeuzeit8,
	F_FontNeuzeit9,
	F_FontNeuzeit11,
	F_FontNeuzeit12,
	F_FontNeuzeit14,
	F_FontNeuzeit17,
	F_FontNeuzeit21,
	F_FontNeuzeit24,
	F_FontNeuzeit29,
	F_FontNeuzeit37,
	F_FontLarge,
	F_FontLarge1024x768,
	F_FontLarge800x600,
	F_FontMedium,
	F_FontMedium1024x768,
	F_FontMedium800x600,
	F_FontSmall,
	F_FontSmallText800x600,
	F_FontMono,
	F_FontMono800x600,
	F_jFontLarge,
	F_jFontLarge1024x768,
	F_jFontLarge800x600,
	F_jFontMedium,
	F_jFontMedium1024x768,
	F_jFontMedium800x600,
	F_jFontSmall,
	F_jFontSmallText800x600,
	F_jFontMono,
	F_jFontMono800x600,
	F_HugeInkFont,
	F_BigInkFont,
	F_MedInkFont,
	F_SmallInkFont,
	F_SHBigInkFont,
	F_SHMedInkFont,
	F_SHSmallInkFont,
	F_SHTinyInkFont,
	F_BigArielFont,
	F_MedArielFont,
	F_SmallArielFont,
	F_TinyArielFont
};

const MaxFloat = 340282346638528860000000000000000000000.0f;
const sLoremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var array<KWHudItem> HudItems;
var BaseCam Cam;
var int CrcTable[256];
var MInputManager IM;
var float fDeltaTime, fLevelLoadTime;
var private float fOriginalLevelLoadTime;
var private bool bLevelLoaded;
var transient Pawn tHP, tICP;
var transient name nTemp;


event PreBeginPlay()
{
	super.PreBeginPlay();
	
	IM = Spawn(class'MInputManager');
}

event PostBeginPlay()
{
	super.PostBeginPlay();
	
	// LevelInfo.InventoryCarrierPawn is only updated once and should never be adjusted from that point
	CoreGetICP();
}

event Tick(float DeltaTime)
{
    fDeltaTime = DeltaTime;
	
	if(bLevelLoaded)
	{
		fOriginalLevelLoadTime = fDeltaTime;
		fLevelLoadTime = fOriginalLevelLoadTime;
		
		bLevelLoaded = false;
	}
	else
	{
		fLevelLoadTime = 0.0;
	}
}

event PostLoadGame(bool bLoadFromSaveGame)
{
	local int i;
	
	if(PC == none)
	{
		GetPC();
	}
	
	bLevelLoaded = true;
	
	// Destroy any existing MInteractionUtility's since they can overlap and cause millions of errors
	for(i = 0; i < PC.Player.LocalInteractions.Length; i++)
	{
		if(PC.Player.LocalInteractions[i].IsA('MInteractionUtility'))
		{
			PC.Player.InteractionMaster.RemoveInteraction(PC.Player.LocalInteractions[i]);
		}
	}
	
	PC.Player.InteractionMaster.AddInteraction("MPak.MInteractionUtility", PC.Player);
}

function KWHeroController GetPC()
{
	PC = KWGame(Level.Game).GetHeroController();
	
	return PC;
}

protected function Pawn CoreGetHP()
{
	// Primary logic for getting HP
	// This uses a much quicker calculation than a GetProp and a SetProp
	// Won't work if the player is in a cinematic cutscene, but that's fine
	if(PC == none)
	{
		GetPC();
		
		if(PC == none)
		{
			tHP = none;
			
			SetPropertyText("tHP", Level.GetPropertyText("PlayerHeroActor"));
			
			HP = tHP;
			
			return HP;
		}
	}
	
	if(PC.Pawn != none)
	{
		HP = PC.Pawn;
		
		return HP;
	}
	
	// If the above logic didn't work, just run a GetProp and a SetProp to more-than-likely get HP
	tHP = none;
	
	SetPropertyText("tHP", Level.GetPropertyText("PlayerHeroActor"));
	
	HP = tHP;
	
	return HP;
}

function Pawn GetHP()
{
	return CoreGetHP();
}

protected function CoreGetICP()
{
	SetPropertyText("tICP", Level.GetPropertyText("InventoryCarrierPawn"));
	
	ICP = tICP;
}

function Pawn GetICP()
{
	return ICP;
}

function KWHud GetHUD()
{
	if(PC == none)
	{
		GetPC();
	}
	
	HUD = KWHud(PC.myHUD);
	
	return HUD;
}

function array<KWHudItem> GetHudItems()
{
	if(HUD == none)
	{
		GetHUD();
	}
	
	HudItems = HUD.HudItems;
	
	return HUDItems;
}

function BaseCam GetCam()
{
	if(PC == none)
	{
		GetPC();
	}
	
	Cam = PC.Camera;
	
	return Cam;
}

function string CC(string S)
{
	if(PC == none)
	{
		GetPC();
	}
	
	return PC.ConsoleCommand(S);
}

function CrcInit() // CRC32 function made by Mychaeel, permission granted
{
	local int CrcValue, IndexBit, IndexEntry;
	
	const CrcPolynomial = 0xedb88320;
  
	for(IndexEntry = 0; IndexEntry < 256; IndexEntry++)
	{
		CrcValue = IndexEntry;
		
		for(IndexBit = 8; IndexBit > 0; IndexBit--)
		{
			if((CrcValue & 1) != 0)
			{
				CrcValue = (CrcValue >>> 1) ^ CrcPolynomial;
			}
			else
			{
				CrcValue = CrcValue >>> 1;
			}
		}
		
		CrcTable[IndexEntry] = CrcValue;
	}
}

function int Crc(coerce string sText) // CRC32 function made by Mychaeel, permission granted
{
	local int CrcValue, IndexChar;
	
	CrcValue = 0xffffffff;
	
	for(IndexChar = 0; IndexChar < Len(sText); IndexChar++)
	{
		CrcValue = (CrcValue >>> 8) ^ CrcTable[Asc(Mid(sText, IndexChar, 1)) ^ (CrcValue & 0xff)];
	}
	
	return CrcValue;
}

static function int IsBool(string S)
{
	if(S == "")
	{
		return -1;
	}
	
	S = Caps(S);
	
	if(InStr(S, "TRUE") > -1 && Len(S) == 4)
	{
		return 1;
	}
	else if(InStr(S, "FALSE") > -1 && Len(S) == 5)
	{
		return 0;
	}
	
	return -1;
}

function bool MFancySetLocation(Actor TargetActor, optional vector NewLocation, optional int iSetLocationAttempts, optional bool bZOnly)
{
	local float R;
	
	if(TargetActor == none)
	{
		return false;
	}
	
	if(iSetLocationAttempts == 0)
	{
		iSetLocationAttempts = 25;
	}
	else
	{
		iSetLocationAttempts = Max(iSetLocationAttempts, 1);
	}
	
	if(TargetActor.SetLocation(NewLocation))
	{
		return true;
	}
	
	for(R = 25.0; R <= (float(iSetLocationAttempts) * 25.0); R += 25.0)
	{
		if(TargetActor.SetLocation(NewLocation + Vec(0.0, 0.0, R)))
		{
			return true;
		}
		
		if(TargetActor.SetLocation(NewLocation + Vec(0.0, 0.0, -R)))
		{
			return true;
		}
		
		if(!bZOnly)
		{
			if(TargetActor.SetLocation(NewLocation + Vec(R, 0.0, 0.0)))
			{
				return true;
			}
			
			if(TargetActor.SetLocation(NewLocation + Vec(-R, 0.0, 0.0)))
			{
				return true;
			}
			
			if(TargetActor.SetLocation(NewLocation + Vec(0.0, R, 0.0)))
			{
				return true;
			}
			
			if(TargetActor.SetLocation(NewLocation + Vec(0.0, -R, 0.0)))
			{
				return true;
			}
		}
	}
	
	return false;
}

function bool FancySetRotation(Actor TargetActor, optional rotator NewRotation, optional float fAccuracy, optional bool bYawOnly)
{
	local float fAdjustValue;
	local rotator CurrRot, DeltaRot, OldDeltaRot;
	local int i, iIterationMax;
	
	if(TargetActor == none)
	{
		return false;
	}
	
	if(fAccuracy == 0.0)
	{
		fAccuracy = 0.0001220703125;
	}
	
	CurrRot = TargetActor.Rotation;
	
	DeltaRot = NewRotation - CurrRot;
	
	if(bYawOnly)
	{
		DeltaRot.Pitch = 0;
		DeltaRot.Roll = 0;
	}
	
	fAdjustValue = 1.0 - fAccuracy;
	
	iIterationMax = int(65536.0 * fAccuracy);
	
	for(i = 0; i < iIterationMax; i++)
	{
		if(Abs(DeltaRot.Pitch) > fAccuracy)
		{
			OldDeltaRot = DeltaRot;
			
			DeltaRot.Pitch *= fAdjustValue * (i + 1);
			
			if(TargetActor.SetRotation(CurrRot + DeltaRot))
			{
				return true;
			}
			
			DeltaRot = OldDeltaRot;
		}
		
		if(Abs(DeltaRot.Yaw) > fAccuracy)
		{
			OldDeltaRot = DeltaRot;
			
			DeltaRot.Yaw *= fAdjustValue * (i + 1);
			
			if(TargetActor.SetRotation(CurrRot + DeltaRot))
			{
				return true;
			}
			
			DeltaRot = OldDeltaRot;
		}
		
		if(Abs(DeltaRot.Roll) > fAccuracy)
		{
			OldDeltaRot = DeltaRot;
			
			DeltaRot.Roll *= fAdjustValue * (i + 1);
			
			if(TargetActor.SetRotation(CurrRot + DeltaRot))
			{
				return true;
			}
			
			DeltaRot = OldDeltaRot;
		}
	}
	
	return false;
}

function bool MFancySpawn(class<Actor> ClassType, optional vector vSpawnLocation, optional rotator rSpawnRotation, optional out Actor outActor, optional int iSpawnAttempts, optional bool bZOnly)
{
	local float R;
	local Actor A;
	
	if(ClassType == none)
	{
		return false;
	}
	
	if(iSpawnAttempts == 0)
	{
		iSpawnAttempts = 25;
	}
	else
	{
		iSpawnAttempts = Max(iSpawnAttempts, 1);
	}
	
	A = Spawn(ClassType,,, vSpawnLocation, rSpawnRotation);
	
	if(A != none)
	{
		outActor = A;
		
		return true;
	}
	
	for(R = 25.0; R <= (float(iSpawnAttempts) * 25.0); R += 25.0)
	{
		A = Spawn(ClassType,,, vSpawnLocation + Vec(0.0, 0.0, R), rSpawnRotation);
		
		if(A != none)
		{
			outActor = A;
			
			return true;
		}
		
		A = Spawn(ClassType,,, vSpawnLocation + Vec(0.0, 0.0, -R), rSpawnRotation);
		
		if(A != none)
		{
			outActor = A;
			
			return true;
		}
		
		if(!bZOnly)
		{
			A = Spawn(ClassType,,, vSpawnLocation + Vec(R, 0.0, 0.0), rSpawnRotation);
			
			if(A != none)
			{
				outActor = A;
				
				return true;
			}
			
			A = Spawn(ClassType,,, vSpawnLocation + Vec(-R, 0.0, 0.0), rSpawnRotation);
			
			if(A != none)
			{
				outActor = A;
				
				return true;
			}
			
			A = Spawn(ClassType,,, vSpawnLocation + Vec(0.0, R, 0.0), rSpawnRotation);
			
			if(A != none)
			{
				outActor = A;
				
				return true;
			}
			
			A = Spawn(ClassType,,, vSpawnLocation + Vec(0.0, -R, 0.0), rSpawnRotation);
			
			if(A != none)
			{
				outActor = A;
				
				return true;
			}
		}
	}
	
	return false;
}

function FancyDestroy(Actor A)
{
	local SHSavePoint SHSP;
	local TinCup TC;
	
	if(A == none)
	{
		return;
	}
	
	if(A.IsA('Pawn'))
	{
		if(Pawn(A).Controller != none)
		{
			Pawn(A).Controller.Destroy();
		}
		
		if(A.IsA('SavePointFairy'))
		{
			foreach DynamicActors(class'SHSavePoint', SHSP)
			{
				if(SHSP.tinkerbell == SavePointFairy(A))
				{
					SHSP.Destroy();
				}
			}
			
			if(SavePointFairy(A).TrailParticles != none)
			{
				SavePointFairy(A).TrailParticles.Destroy();
			}
		}
		
		if(A.IsA('Trap'))
		{
			if(Trap(A).TrapLeavesSample != none)
			{
				Trap(A).TrapLeavesSample.Destroy();
			}
		}
		
		if(A.IsA('BossFGM'))
		{
			if(BossFGM(A).FlyEmitter != none)
			{
				BossFGM(A).FlyEmitter.Destroy();
			}
			
			if(BossFGM(A).Spell1_AimEmitter != none)
			{
				BossFGM(A).Spell1_AimEmitter.Destroy();
			}
			
			if(BossFGM(A).Spell2_AimEmitter != none)
			{
				BossFGM(A).Spell2_AimEmitter.Destroy();
			}
			
			if(BossFGM(A).Spell2_AimEmitter != none)
			{
				BossFGM(A).Spell2_AimEmitter.Destroy();
			}
			
			if(BossFGM(A).Spell1_CastEmitter != none)
			{
				BossFGM(A).Spell1_CastEmitter.Destroy();
			}
			
			if(BossFGM(A).Spell2_CastEmitter != none)
			{
				BossFGM(A).Spell2_CastEmitter.Destroy();
			}
			
			if(BossFGM(A).Spell3_CastEmitter != none)
			{
				BossFGM(A).Spell3_CastEmitter.Destroy();
			}
		}
		
		if(A.IsA('PrisonerTinCup'))
		{
			foreach DynamicActors(class'TinCup', TC)
			{
				if(TC.Owner == A)
				{
					TC.Destroy();
					
					break;
				}
			}
		}
	}
	else if(A.IsA('KWPickup'))
	{
		if(KWPickup(A).AmbientFX != none)
		{
			KWPickup(A).AmbientFX.Destroy();
		}
	}
	
	A.Destroy();
}

function GivePawnController(KWPawn P)
{
	if(P == none)
	{
		return;
	}
	
	P.CreateKWAIController();
	
	if(P.IsA('SHEnemy'))
	{
		SHEnemy(P).bSpawned = true;
	}
	
	if(P.IsA('EnemyBoss'))
	{
		EnemyBoss(P).StartCombatController();
	}
	
	if(P.IsA('SHHeroPawn'))
	{
		P.SetPropertyText("bIsMainPlayer", "False");
	}
	
	P.PostPersistentDataRestored();
}

function float GetDefaultJumpValue(SHHeroPawn SHHP, bool bGetDoubleJumpZ, optional bool bAccountForCurrentGravity)
{
	local float fGravityZ;
	
	if(!bAccountForCurrentGravity)
	{
		fGravityZ = PhysicsVolume.default.Gravity.Z;
	}
	else
	{
		fGravityZ = SHHP.PhysicsVolume.Gravity.Z;
	}
	
	if(!bGetDoubleJumpZ)
	{
		if(SHHP.IsA('Donkey'))
		{
			return Sqrt((-2.0 * Donkey(SHHP).default.fJumpHeight) * fGravityZ);
		}
		else if(SHHP.IsA('PIB'))
		{
			return Sqrt((-2.0 * PIB(SHHP).default.fJumpHeight) * fGravityZ);
		}
		else
		{
			return Sqrt((-2.0 * SHHP.default.fJumpHeight) * fGravityZ);
		}
	}
	else
	{
		if(SHHP.IsA('Donkey'))
		{
			return Sqrt((-2.0 * Donkey(SHHP).default.fDoubleJumpHeight) * fGravityZ);
		}
		else if(SHHP.IsA('PIB'))
		{
			return Sqrt((-2.0 * PIB(SHHP).default.fDoubleJumpHeight) * fGravityZ);
		}
		else
		{
			return Sqrt((-2.0 * SHHP.default.fDoubleJumpHeight) * fGravityZ);
		}
	}
}

function float GetDefaultJumpDistScalarValue(SHHeroPawn SHHP, optional bool bAccountForCurrentGravity)
{
	local float Time, Distance, fGravityZ;
	
	if(!bAccountForCurrentGravity)
	{
		fGravityZ = PhysicsVolume.default.Gravity.Z;
	}
	else
	{
		fGravityZ = SHHP.PhysicsVolume.Gravity.Z;
	}
	
	Time = -GetDefaultJumpValue(SHHP, false) / fGravityZ;
	Distance = (SHHP.default.GroundSpeed * Time) * 2.0;
	
	return SHHP.default.fJumpDist / Distance;
}

function CLog(array<string> Log, optional string FileName, optional string Directory)
{
	if(Log.Length == 0)
	{
		return;
	}
	
	if(FileName == "")
	{
		FileName = "Unnamed.txt";
	}
	
	if(Directory == "")
	{
		Directory = "..\\System\\MPak\\";
	}
	
	SaveStringArray(Log, Directory $ FileName);
}

function name MergeNames(name N1, name N2)
{
	SetPropertyText("nTemp", string(N1) $ string(N2));
	
	return nTemp;
}

function name SName(string S)
{
	SetPropertyText("nTemp", S);
	
	return nTemp;
}

function string GetCurrentMusic()
{
	local array<string> TokenArray;
	local string S;
	
	FindCurrentMusic(S);
	
	S = Caps(S);
	
	TokenArray = Split(S, "\\");
	
	if(TokenArray.Length != 0)
	{
		S = TokenArray[TokenArray.Length - 1];
	}
	
	if(Right(S, 4) == ".OGG")
	{
		S = Left(S, Len(S) - 4);
	}
	
	return S;
}

static function bool IsNameInNameArray(name N, array<name> Ns)
{
	local int i;
	
	for(i = 0; i < Ns.Length; i++)
	{
		if(N == Ns[i])
		{
			return true;
		}
	}
	
	return false;
}

function int GetCurrentSaveSlot()
{
	return Clamp(int(GetIniEntry("SHGame.SHFEGUIPage", "GameSlot", "System")), 0, 9999);
}

function string GetCurrentMap()
{
	local array<string> TokenArray;
	
	TokenArray = Split(Level.GetLocalURL(), "?");
	
	if(Caps(Right(TokenArray[0], 4)) == Caps(".unr"))
	{
		TokenArray[0] = Left(TokenArray[0], Len(TokenArray[0]) - 4);
	}
	
	return TokenArray[0];
}

static function string GetMPakVersion()
{
	return class'MVersion'.default.Version;
}

function SetHealth(Pawn P, float fHealth, optional bool bDontTakeKnockback, optional bool bBypassHealthCap, optional bool bPlayBumpline)
{
	ModifyHealth(P, fHealth, bDontTakeKnockback, bBypassHealthCap, bPlayBumpline);
}

function AddHealth(Pawn P, float fHealth, optional bool bDontTakeKnockback, optional bool bBypassHealthCap, optional bool bPlayBumpline)
{
	ModifyHealth(P, GetHealth(P) + fHealth, bDontTakeKnockback, bBypassHealthCap, bPlayBumpline);
}

function KillPawn(Pawn P, optional bool bPlayBumpline)
{
	ModifyHealth(P, 0.0, true,, bPlayBumpline);
}

function float GetHealth(Pawn P)
{
	if(P.IsA('KWPawn'))
	{
		// This could technically result in inaccuracies but this shouldn't normally matter
		// This method saves a lot of performance over a GetProp so it's worth it to do so
		// However, this method can't return health values above 100, so run a GetProp if we have to
		if(GetMaxHealth(P) <= 100.0)
		{
			return KWPawn(P).GetHealth() * 100.0;
		}
		else
		{
			return float(P.GetPropertyText("Health"));
		}
	}
	else
	{
		return float(P.GetPropertyText("Health"));
	}
}

function float GetMaxHealth(Pawn P)
{
	if(P.IsA('SHHeroPawn'))
	{
		if(!IsShrek22())
		{
			return float(KWPawn(ICP).GetInventoryCount('Shamrock') + 1) * KWPawn(P).MaxHealth;
		}
		else
		{
			return KWPawn(P).MaxHealth + (20.0 * float(KWPawn(ICP).GetInventoryCount('Shamrock')));
		}
	}
	else if(P.IsA('KWPawn'))
	{
		return KWPawn(P).MaxHealth;
	}
	else
	{
		return 100.0; // Can't call P.default.Health without a crash, so I'm simply assuming 100.0 since this is Engine.Pawn's default
	}
}

private function ModifyHealth(Pawn P, float fHealth, optional bool bDontTakeKnockback, optional bool bBypassHealthCap, optional bool bPlaySound)
{
	local float fMaxHealth, fHealthDifference;
	local class<DamageType> DT;
	
	if(P == none)
	{
		return;
	}
	
	if(PC == none)
	{
		GetPC();
	}
	
	if(fHealth <= 0.0)
	{
		bDontTakeKnockback = true;
	}
	
	fMaxHealth = GetMaxHealth(P);
	fHealthDifference = GetHealth(P) - fHealth;
	
	if(!bBypassHealthCap)
	{
		fHealth = FClamp(fHealth, 0.0, fMaxHealth);
	}
	
	if(fHealthDifference == 0.0 || fHealth == GetHealth(P))
	{
		return;
	}
	
	if(fHealthDifference <= 0.0)
	{
		P.SetPropertyText("Health", string(fHealth));
		
		if(bPlaySound && P.IsA('SHHeroPawn'))
		{
			PlayASound3D(P, "Items.pickup_HeroBar");
			
			SHHeroPawn(P).PlayPickupEnergyBarBumpLine();
		}
	}
	else
	{
		if(P.Physics != PHYS_Walking)
		{
			DT = class'fell';
		}
		
		if(P.IsA('MHeroPawn'))
		{
			fHealthDifference *= MHeroPawn(P).fDamageMultiplier;
		}
		
		if(P.IsA('SHHeroPawn'))
		{
			SHHeroPawn_TakeDamage(SHHeroPawn(P), fHealthDifference, none, P.Location, Vect(0.0, 0.0, 0.0), DT, bDontTakeKnockback, bPlaySound);
		}
		else if(P.IsA('SHEnemy'))
		{
			SHEnemy_TakeDamage(SHEnemy(P), fHealthDifference, none, P.Location, Vect(0.0, 0.0, 0.0), DT);
		}
		else if(P.IsA('BreakableObject'))
		{
			BreakableObject_TakeDamage(BreakableObject(P), fHealthDifference, none, P.Location, Vect(0.0, 0.0, 0.0), DT);
		}
		else
		{
			Pawn_TakeDamage(P, fHealthDifference, none, P.Location, Vect(0.0, 0.0, 0.0), DT);
		}
		
		if(bPlaySound)
		{
			PlayASound3D(P, "Peasants.Peasant_punch01");
		}
	}
	
	if(GetHP() == P)
	{
		ShrekController(PC).UpdateHealthManagerStatus();
	}
}

private function SHHeroPawn_TakeDamage(SHHeroPawn P, float fDamage, Pawn instigatedBy, vector vHitLocation, vector vMomentum, class<DamageType> DamageType, optional bool bDontTakeKnockback, optional bool bPlayBumpline)
{
	local bool bForwardDamage, bWasHolding;
	
	if(GetHealth(P) <= 0.0 || P.AmInvunerable || P.InGodMode() || (instigatedBy != none && instigatedBy.IsA('SHHeroPawn')) || P.IsInState('stateKnockBack') || P.IsInState('stateKnockForward') || P.IsInState('stateUpEndFront') || P.IsInState('stateUpEndBack') || P.IsInState('stateSwingingDeath') || !P.StateIsInterruptible() || (P.Physics != PHYS_Walking && DamageType != class'fell' && DamageType != class'SwingingDeathDamage' && DamageType != class'EnvironmentDamage'))
	{
		return;
	}
	
	if(DamageType == class'ForwardAttackDamage')
	{
		bForwardDamage = true;
	}
	
	if(P.aHolding != none)
	{
		bWasHolding = true;
		
		if(P.aHolding == instigatedBy)
		{
			P.PlayerThrowCarryingActorGeneral(100.0);
			P.StateBeforeKnockBack = 'StateIdle';
		}
		
		if(!bDontTakeKnockback && GetHealth(HP) > 0.0)
		{
			P.GoToStateKnock(bForwardDamage);
		}
	}
	else if(!bDontTakeKnockback && DamageType == class'UpEndFrontDamage')
	{
		GotoState('stateUpEndFront');
	}
	else if(!bDontTakeKnockback && DamageType == class'UpEndBackDamage')
	{
		GotoState('stateUpEndBack');
	}
	else if(DamageType == class'SwingingDeathDamage')
	{
		P.TearOffMomentum = vMomentum;
		
		GotoState('stateSwingingDeath');
	}
	
	if(!bDontTakeKnockback && !bWasHolding)
	{
		P.GoToStateKnock(bForwardDamage);
	}
	
	if(bPlayBumpline)
	{
		if(PercentChance(0.5))
		{
			P.PlayPainSound();
		}
		else
		{
			P.SayHurtBumpLine();
		}
	}
	
	Pawn_TakeDamage(P, fDamage, instigatedBy, vHitLocation, vMomentum, DamageType);
}

private function SHEnemy_TakeDamage(SHEnemy P, float fDamage, Pawn instigatedBy, vector vHitLocation, vector vMomentum, class<DamageType> DamageType)
{
	local int DeathType;
	
	GetHP();
	
	CM(string(P.Name) $ ": has been damaged. Damage =" @ string(fDamage) $ ".  Health =" @ string(GetHealth(P)));
	
	if(GetHealth(P) <= 0.0)
	{
		SHEnemyController(P.Controller).alreadyDeadRealityCheck++;
		
		if(SHEnemyController(P.Controller).alreadyDeadRealityCheck < 3)
		{
			return;
		}
		else
		{
			P.Controller.GotoState('stateFaint');
		}
	}
	
	if((DamageType == class'Crushed' && !instigatedBy.IsA('SHHeroPawn')) || IsInState('TakeDamage') || IsInState('stateAirAttack') || IsInState('stateFrozenAttack') || IsInState('stateTinyAttack') || IsInState('stateLoveAttack') || IsInState('stateSleepAttack') || IsInState('stateSurpriseAttack') || IsInState('stateStinkAttack') || IsInState('stateSpecialAttack'))
	{
		return;
	}
	
	P.SetPropertyText("Health", string(GetHealth(P) - fDamage));
	
	P.MakeNoise(1);
	
	if(SHHeroPawn(HP).bInvisible || SHHeroPawn(HP).bShrink)
	{
		P.Controller.GotoState('stateSurpriseAttack');
	}
	else if(IsInState('Freeze'))
	{
		P.Controller.GotoState('stateFrozenAttack');
	}
	else if(IsInState('Stink') || IsInState('UnStink'))
	{
		P.Controller.GotoState('stateStinkAttack');
	}
	else if(IsInState('Shrink') || IsInState('Grow'))
	{
		P.Controller.GotoState('stateTinyAttack');
	}
	else if((IsInState('LoveHero') || IsInState('LoveLookAtHero')) || IsInState('StopLoveHero'))
	{
		P.Controller.GotoState('stateLoveAttack');
	}
	else if(IsInState('Sleeping') || IsInState('WakeUp'))
	{
		P.Controller.GotoState('stateSleepAttack');
	}
	else if(fDamage == 4.0)
	{
		P.Controller.GotoState('stateSpecialAttack');
	}
	else if(DamageType == class'TrapDamage')
	{
		CMAndLog(string(P.Name) @ "received damage from a Trap. Going to stateFaint");
		P.Controller.GotoState('stateFaint');
	}
	else if(DamageType == class'WalkingKickDamage')
	{
		P.Controller.GotoState('stateWalkingKick');
	}
	else if(DamageType == class'Crushed' && instigatedBy.IsA('SHHeroPawn'))
	{
		if(instigatedBy.IsInState('stateStartAirAttack') || instigatedBy.IsInState('stateContinueAirAttack'))
		{
			P.bCanBeBaseForPawns = true;
			P.Controller.GotoState('stateAirAttack');
		}
		else
		{
			P.SetPropertyText("Health", string(GetHealth(P) + fDamage));
			
			CM(string(P.Name) $ ": has been damaged by Crush. Give the health back. Health =" @ string(GetHealth(P)));
		}											
	}
	else if(GetHealth(P) > 0.0)
	{
		P.Controller.GotoState('stateTakeDamage');
	}
	else if(P.Controller.IsA('PreCombatController'))
	{
		P.Controller.GotoState('stateFaint');
	}
	else
	{
		DeathType = ((Floor(fDamage) - 1) * 3) + Rand(3);
		
		if(DeathType > 0 && DeathType <= 8)
		{
			P.Controller.GotoState(P.DeathTypeName[DeathType]);
		}
		else
		{
			P.Controller.GotoState(P.DeathTypeName[Rand(P.DeathTypeName.Length)]);
		}
	}
	
	P.bWasHitInThisAttack = true;
}

private function BreakableObject_TakeDamage(BreakableObject P, float fDamage, Pawn instigatedBy, vector vHitLocation, vector vMomentum, class<DamageType> DamageType)
{
	if(DamageType != class'RegularAttackDamage' && DamageType != class'SpecialAttackDamage' && DamageType != class'ExplodingObjectDamage')
	{
		return;
	}
	
	Pawn_TakeDamage(P, fDamage, instigatedBy, vHitLocation, vMomentum, DamageType);
	
	if(U.GetHealth(P) > 0.0)
	{
		return;
	}
	
	if(!P.bSpecialAttackOnly || DamageType == class'SpecialAttackDamage')
	{
		P.GotoState('stateBreaking');
	}
}

private function Pawn_TakeDamage(Pawn P, float fDamage, Pawn instigatedBy, vector vHitLocation, vector vMomentum, class<DamageType> DamageType)
{
	local bool bAlreadyDead;
	local Controller Killer;
	
	if(P.InGodMode())
	{
		return;
	}
	
	if(DamageType == none)
	{
		if(instigatedBy != none)
		{
			Warn("No damagetype for damage by" @ string(instigatedBy) @ "with weapon" @ string(instigatedBy.Weapon));
		}
		
		DamageType = class'DamageType';
	}
	
	if(P.Role < ROLE_Authority)
	{
		Log(string(P) @ "client damage type" @ string(DamageType) @ "by" @ string(instigatedBy));
		
		return;
	}
	
	bAlreadyDead = GetHealth(P) <= 0.0;
	
	if(P.Physics == PHYS_Walking)
	{
		vMomentum.Z = FMax(vMomentum.Z, 0.4 * VSize(vMomentum));
	}
	
	if(instigatedBy == self || ((P.Controller != none) && instigatedBy != none && instigatedBy.Controller != none && instigatedBy.Controller.SameTeamAs(P.Controller)))
	{
		vMomentum *= 0.6;
	}
	
	vMomentum /= P.Mass;
	
	P.SetPropertyText("Health", string(GetHealth(P) - fDamage));
	
	if(vHitLocation == Vect(0.0, 0.0, 0.0))
	{
		vHitLocation = P.Location;
	}
	
	if(bAlreadyDead)
	{
		Warn(string(self) @ "took regular damage" @ string(DamageType) @ "from" @ string(instigatedBy) @ "while already dead at" @ string(Level.TimeSeconds));
		
		P.ChunkUp(P.Rotation, DamageType);
		
		return;
	}
	
	P.PlayHit(fDamage, instigatedBy, vHitLocation, DamageType, vMomentum);
	
	if(GetHealth(P) <= 0.0)
	{
		if(instigatedBy != none)
		{
			Killer = instigatedBy.GetKillerController();
		}
		
		if(P.bPhysicsAnimUpdate)
		{
			P.TearOffMomentum = vMomentum;
		}
		
		P.Died(Killer, DamageType, vHitLocation);
	}
	else
	{
		if(instigatedBy != none && instigatedBy != P && P.Controller != none && instigatedBy.Controller != none && instigatedBy.Controller.SameTeamAs(P.Controller))
		{
			vMomentum *= 0.5;
		}
		
		P.AddVelocity(vMomentum);
		
		if(P.Controller != none)
		{
			P.Controller.NotifyTakeHit(instigatedBy, vHitLocation, Ceiling(fDamage), DamageType, vMomentum);
		}
	}
	
	P.MakeNoise(1.0);
}

function SetShamrocks(int iShamrockCount, optional bool bBypassHealthCap, optional bool bPlayBumpline)
{
	ModifyShamrocks(iShamrockCount, bBypassHealthCap, bPlayBumpline);
}

function AddShamrocks(int iShamrockCount, optional bool bBypassHealthCap, optional bool bPlayBumpline)
{
	ModifyShamrocks(KWPawn(ICP).GetInventoryCount('Shamrock') + iShamrockCount, bBypassHealthCap, bPlayBumpline);
}

private function ModifyShamrocks(int iShamrockCount, optional bool bBypassHealthCap, optional bool bPlayBumpline)
{
	local int iOldShamrockCount;
	local Shrek S;
	
	GetHP();
	
	if(!bBypassHealthCap)
	{
		if(!IsShrek22())
		{
			iShamrockCount = Clamp(iShamrockCount, -1, 5);
		}
		else
		{
			iShamrockCount = Clamp(iShamrockCount, -1, 8);
		}
	}
	
	iOldShamrockCount = KWPawn(ICP).GetInventoryCount('Shamrock');
	
	KWPawn(ICP).AddToInventoryCollection(class'ShamrockCollection', -KWPawn(ICP).GetInventoryCount('Shamrock'));
	KWPawn(ICP).AddToInventoryCollection(class'ShamrockCollection', iShamrockCount);
	
	foreach DynamicActors(class'Shrek', S)
	{
		S.TotalHealthIcons = iShamrockCount;
	}
	
	SetHealth(HP, GetMaxHealth(HP),, bBypassHealthCap);
	
	if(!bBypassHealthCap && GetHealth(HP) > 1000.0)
	{
		SetHealth(HP, 1000.0,, bBypassHealthCap);
	}
	
	if(bPlayBumpline && iShamrockCount >= iOldShamrockCount)
	{
		PlayASound3D(HP, "Items.PickupShamrock");
		
		if(HP.IsA('SHHeroPawn'))
		{
			SHHeroPawn(HP).PlayPickupShamrockBumpLine();
		}
	}
}

function Sound PlayASound(optional string sSoundString, optional Sound SoundOverride, optional float fVolume, optional bool bMoveCurrentPlayersMouth, optional Actor.ESoundSlot SoundSlot)
{
	local Sound SoundToPlay;
	local string MB;
	
	if(PC == none)
	{
		GetPC();
	}
	
	GetHP();
	
	if(fVolume <= 0.0)
	{
		fVolume = 0.4;
	}
	
	if(SoundOverride != none)
	{
		SoundToPlay = SoundOverride;
	}
	
	if(SoundToPlay == none && sSoundString != "")
	{
		SoundToPlay = Sound(DynamicLoadObject(sSoundString, class'Sound', true));
	}
	
	if(SoundToPlay == none)
	{
		return none;
	}
	
	if(!bMoveCurrentPlayersMouth)
	{
		MB = HP.GetPropertyText("MouthBone");
		HP.SetPropertyText("MouthBone", "");
	}
	
	PC.ClientPlaySound(SoundToPlay, true, fVolume, SoundSlot);
	
	if(!bMoveCurrentPlayersMouth)
	{
		HP.SetPropertyText("MouthBone", MB);
	}
	
	return SoundToPlay;
}

function Sound PlayASound3D(Actor A, optional string sSoundString, optional Sound SoundOverride, optional float fVolume, optional float fRadius, optional float fPitch, optional bool bMoveCurrentPlayersMouth, optional Actor.ESoundSlot SoundSlot)
{
	local Sound SoundToPlay;
	local string MB;
	
	if(fVolume <= 0.0)
	{
		fVolume = 0.4;
	}
	
	if(fRadius <= 0.0)
	{
		fRadius = 8192.0;
	}
	
	if(fPitch <= 0.0)
	{
		fPitch = 1.0;
	}
	
	if(SoundOverride != none)
	{
		SoundToPlay = SoundOverride;
	}
	
	if(SoundToPlay == none && sSoundString != "")
	{
		SoundToPlay = Sound(DynamicLoadObject(sSoundString, class'Sound', true));
	}
	
	if(SoundToPlay == none)
	{
		return none;
	}
	
	if(!bMoveCurrentPlayersMouth && A.IsA('Pawn'))
	{
		MB = A.GetPropertyText("MouthBone");
		A.SetPropertyText("MouthBone", "");
	}
	
	A.PlaySound(SoundToPlay, SoundSlot, fVolume, true, fRadius, fPitch, true);
	
	if(!bMoveCurrentPlayersMouth && A.IsA('Pawn'))
	{
		A.SetPropertyText("MouthBone", MB);
	}
	
	return SoundToPlay;
}

function bool DoesMapFileExist(string sMapName)
{
	local int i;
	local array<string> sMaps;
	
	sMapName = Caps(sMapName);
	
	sMaps = GetAvailableMaps();
	
	for(i = 0; i < sMaps.Length; i++)
	{
		if(sMapName == Caps(sMaps[i]))
		{
			return true;
		}
	}
	
	return false;
}

function array<string> GetAvailableMaps(optional bool bDoNotRemoveUnr)
{
	local int i;
	local string sFirstMap, sNextMap;
	local array<string> sMaps;
	
	sFirstMap = GetMapName("", "", 0);
	
	QuickStringInsert(sMaps, sFirstMap);
	
	sNextMap = GetMapName("", sFirstMap, 1);
	
	while(sFirstMap != sNextMap)
	{
		QuickStringInsert(sMaps, sNextMap);
		
		sNextMap = GetMapName("", sNextMap, 1);
	}
	
	if(!bDoNotRemoveUnr)
	{
		for(i = 0; i < sMaps.Length; i++)
		{
			if(Caps(Right(sMaps[i], 4)) == ".UNR")
			{
				sMaps[i] = Left(sMaps[i], Len(sMaps[i]) - 4);
			}
		}
	}
	
	return sMaps;
}

static function QuickStringInsert(out array<string> sStrings, string sString)
{
	sStrings.Insert(sStrings.Length, 1);
	sStrings[sStrings.Length - 1] = sString;
}

static function bool IsValueInRange(int iValue, int iMinRange, int iMaxRange)
{
    return iValue >= iMinRange && iValue <= iMaxRange;
}

function bool IsStringDate(string sDate)
{
	local array<string> TokenArray;
	
	TokenArray = Split(sDate, "/");
	
	if(int(TokenArray[0]) != 0 && IsValueInRange(int(TokenArray[0]), 1, 12) && int(TokenArray[1]) != 0 && IsValueInRange(int(TokenArray[1]), 1, 31) && int(TokenArray[2]) != 0 && TokenArray.Length == 3)
	{
		return true;
	}
	
	return false;
}

function bool IsCurrentDateInRange(string sStartDate, string sEndDate)
{
	local int iCurrentDay, iCurrentMonth, iCurrentYear, iStartDay, iStartMonth, iStartYear, iEndDay, iEndMonth, iEndYear;
	local bool bIsAfterStart, bIsBeforeEnd;
	local array<string> TokenArray;
	
	// Parse the current date string into day, month, and year components
	iCurrentDay = Abs(Level.Day);
	iCurrentMonth = Abs(Level.Month);
	iCurrentYear = Abs(Level.Year);
	
	// Parse the start date string into day, month, and year components
	TokenArray = Split(sStartDate, "/");
	
	// Confirms that a date was given to some extent
	if(TokenArray.Length != 3)
	{
		return false;
	}
	
	iStartDay = Abs(int(TokenArray[1]));
	iStartMonth = Abs(int(TokenArray[0]));
	iStartYear = Abs(int(TokenArray[2]));
	
	// Parse the end date string into day, month, and year components
	TokenArray = Split(sEndDate, "/");
	
	// Confirms that a date was given to some extent
	if(TokenArray.Length != 3)
	{
		return false;
	}
	
	iEndDay = Abs(int(TokenArray[1]));
	iEndMonth = Abs(int(TokenArray[0]));
	iEndYear = Abs(int(TokenArray[2]));
	
	// Compare the input date with the start and end dates and confirms that the current date is after the starting date and before the ending date
	bIsAfterStart = (iCurrentYear > iStartYear) || (iCurrentYear == iStartYear && iCurrentMonth > iStartMonth) || (iCurrentYear == iStartYear && iCurrentMonth == iStartMonth && iCurrentDay >= iStartDay);
	bIsBeforeEnd = (iCurrentYear < iEndYear) || (iCurrentYear == iEndYear && iCurrentMonth < iEndMonth) || (iCurrentYear == iEndYear && iCurrentMonth == iEndMonth && iCurrentDay <= iEndDay);
	
	// Return true if the input date falls within the range, false otherwise
	return bIsAfterStart && bIsBeforeEnd;
}

function PopupText(string sPopupMessage, string sTopPopupMessage, float fPopupDuration, Color cTextColor)
{
	if(PC == none)
	{
		GetPC();
	}
	
	if(HUD == none)
	{
		GetHUD();
	}
	
	if(!PC.bInCutscene())
	{
		if(sTopPopupMessage == "")
		{
			HUD.StartCutScene(true);
		}
		else
		{
			HUD.StartCutScene();
		}
	}
	
	HUD.CutTextController.colorCutText = cTextColor;
	
	if(sPopupMessage != "")
	{
		HUD.SetSubtitleText(sPopupMessage, fPopupDuration);
	}
	
	if(sTopPopupMessage != "" && HUD.CutTextController != none)
	{
		HUD.CutTextController.SetCutCommentText(sTopPopupMessage);
	}
}

static function int cRNG(int iSeed, optional int iComplexity)
{
	local int i;
	
	if(iComplexity <= 0)
	{
		iComplexity = 5;
	}
	
	for(i = 0; i < iComplexity; i++)
	{
		iSeed = (1664525 * iSeed + 1013904223) % 2147483647;
		iSeed = (iSeed ^ 0xABCDEF) + 0x12345678;
	}
	
	return iSeed;
}

static function Next(out int iSeed)
{
	iSeed = cRNG(iSeed);
}

static function float Pow(float Base, int Exponent)
{
	return Base ** Exponent;
}

static function RotateVector(out vector A, vector B, float Degree)
{
	local float Magnitude;
	local vector C;
	
	Degree = Degree * Pi / 180.0;
	Magnitude = VSize(A);
	A = Normal(A);
	B = Normal(B);
	
	if(A Dot B == -1.0)
	{
		B.x += 0.0001;
	}
	
	C = Normal(B - (A Dot B) * A);
	
	A = Normal(A * Cos(Degree) + C * Sin(Degree)) * Magnitude;
}

static function string Upper(coerce string Text)
{
	return Caps(Text);
}

static function string Lower(coerce string Text)
{
	local int IndexChar;
	
	for(IndexChar = 0; IndexChar < Len(Text); IndexChar++)
	{
		if(Mid(Text, IndexChar, 1) >= "A" && Mid(Text, IndexChar, 1) <= "Z")
		{
			Text = Left(Text, IndexChar) $ Chr(Asc(Mid(Text, IndexChar, 1)) + 32) $ Mid(Text, IndexChar + 1);
		}
	}
	
	return Text;
}

static function bool IsUpper(coerce string S)
{
	return S == Caps(S);
}

static function bool IsLower(coerce string S)
{
    return S == Lower(S);
}

static function string AlphaNumeric(string S)
{
	local string Result;
	local int i, iChar;
	
	for(i = 0; i < Len(S); i++)
	{
		iChar = Asc(Right(S, Len(S) - i));
		
		if(iChar == Clamp(iChar, 48, 57)) // 0-9
		{
			Result = Result $ Chr(iChar);
		}
		else if(iChar == Clamp(iChar, 65, 90)) // A-Z
		{
			Result = Result $ Chr(iChar);
		}
		else if(iChar == Clamp(iChar, 97, 122)) // a-z
		{
			Result = Result $ Chr(iChar - 32);
		}
	}
	
	return Result;
}

static function bool IsNumeric(string S)
{
    local int i, iChar;
    local bool bDecimalPointFound;
	
	if(S == "")
	{
		return false;
	}
    
    for(i = 0; i < Len(S); i++)
    {
        iChar = Asc(Mid(S, i, 1));
        
        if(iChar == 46) // .
        {
            if(bDecimalPointFound)
            {
				// 2 periods found
                return false;
            }
			
            bDecimalPointFound = true;
        }
        else if(iChar < 48 || iChar > 57) // 0-9
        {
            return false;
        }
    }
    
    return true;
}

function string GuessArrayTypeFromString(string sArrayText)
{
	local array<string> TokenArray;
	local int i, iBestGuess;
	local int iVarGuess[7];
	
	if(Left(sArrayText, 1) == "(" && Right(sArrayText, 1) == ")")
	{
		sArrayText = Mid(sArrayText, 1, Len(sArrayText) - 2);
	}
	
	TokenArray = Split(sArrayText, ",");

	for(i = 0; i < TokenArray.Length; i++)
	{
		if(IsNumeric(TokenArray[i]))
		{
			iVarGuess[0]++; // Float
		}
		else if(InStr(TokenArray[i], "X=") > -1 && InStr(TokenArray[i], "Y=") > -1 && InStr(TokenArray[i], "Z=") > -1)
		{
			iVarGuess[1]++; // Vector
		}
		else if(InStr(TokenArray[i], "Pitch=") > -1 && InStr(TokenArray[i], "Yaw=") > -1 && InStr(TokenArray[i], "Roll=") > -1)
		{
			iVarGuess[2]++; // Rotator
		}
		else if(InStr(TokenArray[i], "'") > -1 && InStr(TokenArray[i], GetCurrentMap()) > -1 && InStr(TokenArray[i], ".") > -1)
		{
			iVarGuess[3]++; // Object
		}
		else if(InStr(TokenArray[i], "R=") > -1 && InStr(TokenArray[i], "G=") > -1 && InStr(TokenArray[i], "B=") > -1 && InStr(TokenArray[i], "A=") > -1)
		{
			iVarGuess[4]++; // Color
		}
		else if(Left(TokenArray[i], 1) == "'" && Right(TokenArray[i], 1) == "'")
		{
			iVarGuess[5]++; // Name
		}
		else
		{
			iVarGuess[6]++; // String
		}
	}
	
	for(i = 0; i < 7; i++)
	{
		if(iBestGuess < iVarGuess[i])
		{
			iBestGuess = iVarGuess[i];
		}
	}
	
	switch(iBestGuess)
	{
		case 0:
			return "Float";
		case 1:
			return "Vector";
		case 2:
			return "Rotator";
		case 3:
			return "Object";
		case 4:
			return "Color";
		case 5:
			return "Name";
		case 6:
			return "String";
	}
}

static function bool IsLeapYear(int I)
{
	return I % 4 == 0;
}

static function bool IsDivisible(float A, float B)
{
	return A % B == 0.0;
}

static function int Floor(float fValue)
{
	local int Result;
	
	Result = int(fValue);
	
	if(fValue < 0.0 && float(Result) != fValue)
	{
		Result--;
	}
	
	return Result;
}

static function int Ceiling(float fValue)
{
	local int Result;
	
	Result = int(fValue);
	
	if(fValue > 0.0 && float(Result) != Result)
	{
		Result++;
	}
	
	return Result;
}

static function float Round(float fValue, optional float Step)
{
	if(Step <= 0.0)
	{
		Step = 1.0;
	}
	
	return Floor((fValue + (Step * 0.5)) / Step) * Step;
}

static function int Truncate(float fValue)
{
	if(fValue >= 0.0)
	{
		return int(fValue);
	}
	else
	{
		return int(fValue) + 1;
	}
}

static function string GetStopwatch(float fTimeSeconds, optional bool bShowMilliseconds, optional int iMillisecondPrecision, optional bool bShowHours, optional bool bDoNotShowMinutes)
{
	local int TotalSeconds, TotalMinutes, Hours, Minutes, Seconds;
	local float Milliseconds;
	local string TimeString;
	
	TotalSeconds = Floor(fTimeSeconds);
	TotalMinutes = TotalSeconds / 60;
	Hours = TotalMinutes / 60;
	Minutes = TotalMinutes % 60;
	Seconds = fTimeSeconds % 60;
	Milliseconds = fTimeSeconds - TotalSeconds;
	
	if(bShowHours)
	{
		if(Hours < 10)
		{
			TimeString = TimeString $ "0";
		}
		
		TimeString = string(Hours) $ ":";
	}
	
	if(!bDoNotShowMinutes)
	{
		if(Minutes < 10)
		{
			TimeString = TimeString $ "0";
		}
		
		TimeString = TimeString $ string(Minutes) $ ":";
	}
	
	if(Seconds < 10)
	{
		TimeString = TimeString $ "0";
	}
	
	if(!bDoNotShowMinutes)
	{
		TimeString = TimeString $ string(Seconds);
	}
	else
	{
		TimeString = TimeString $ string(Seconds + (Minutes * 60) + (Hours * 3600));
	}
	
	if(bShowMilliseconds)
	{
		if(iMillisecondPrecision <= 0)
		{
			iMillisecondPrecision = 2;
		}
		
		TimeString = TimeString $ "." $ Mid(FloatToString(Milliseconds, iMillisecondPrecision), 2);
	}
	
	return TimeString;
}

static final function string FloatToString(float fValue, optional int iPrecision)
{
	local int IntPart;
	local float FloatPart;
	local string IntString, FloatString;
	
	iPrecision = Max(iPrecision, 0);
	
	if(iPrecision == 0)
	{
		return Left(string(fValue), InStr(string(fValue), "."));
	}
	
	if(fValue < 0)
	{
		IntString = "-";
		fValue *= -1;
	}
	
	IntPart = int(fValue);
	FloatPart = fValue - IntPart;
	IntString = IntString $ string(IntPart);
	FloatString = string(int(FloatPart * 10 ** iPrecision));
	
	while(Len(FloatString) < iPrecision)
	{
		FloatString = "0" $ FloatString;
	}
	
	return IntString $ "." $ FloatString;
}

static function string Capitalize(string Source, optional string Delimiter, optional bool bLowerFirst, optional bool bOnlyFirstWord)
{
	local int i;
	local string Text, Result, Char;
	local bool bNewWord;
	
	Text = Source;
	
	if(Delimiter == "")
	{
		Delimiter = " ";
	}
	
	if(bLowerFirst)
	{
		Text = Lower(Text);
	}
	
	for(i = 0; i < Len(Text); i++)
	{
		Char = Mid(Text, i, 1);
		
		if(!bNewWord)
		{
			bNewWord = true;
			
			Result = Result $ Caps(Char);
		}
		else
		{
			Result = Result $ Char;
		}
		
		if(Char == Delimiter && !bOnlyFirstWord)
		{
			bNewWord = true;
		}
	}
	
	return Result;
}

function bool PlayAMusic(string sMusic, optional float fFadeInTime, optional bool bDoNotLoop, optional bool bStab)
{
	local int i;
	local string sOldMusic, sAltMusic;
	local KWMusicTrigger MT;
	
	sMusic = Caps(sMusic);
	sOldMusic = Caps(GetCurrentMusic());
	
	if(InStr(sMusic, " | ") > -1)
	{
		sAltMusic = Mid(sMusic, InStr(sMusic, " | ") + 3);
		
		sMusic = Left(sMusic, InStr(sMusic, " | "));
	}
	
	if(bDoNotLoop || bStab)
	{
		MT = Spawn(class'KWMusicTrigger');
		MT.SetCollision(false, false, false);
	}
	
	for(i = 0; i < 2; i++)
	{
		if(i == 1)
		{
			if(Caps(GetCurrentMusic()) == sOldMusic && sAltMusic != "")
			{
				sMusic = sAltMusic;
			}
			else
			{
				break;
			}
		}
		
		if(MT == none)
		{
			PlayMusic(sMusic, fFadeInTime);
		}
		else
		{
			MT.Song = sMusic;
			MT.FadeInTime = fFadeInTime;
			MT.DoNotLoop = bDoNotLoop;
			MT.Stab = bStab;
			
			MT.DoIt(self);
		}
	}
	
	if(MT != none)
	{
		FancyDestroy(MT);
	}
	
	return Caps(GetCurrentMusic()) != sOldMusic;
}

function bool StopAMusic(optional float fFadeOutTime)
{
	local string sOldMusic;
	
	sOldMusic = Caps(GetCurrentMusic());
	
	StopAllMusic(fFadeOutTime);
	
	return Caps(GetCurrentMusic()) != sOldMusic;
}

static function float FastInverseSqrt(float fValue, optional int iIterations)
{
	local int i;
	local float fResult;
	
	if(iIterations <= 0)
	{
		iIterations = 2;
	}
	
	fResult = fValue;
	
	for(i = 0; i < iIterations; i++)
	{
		fResult *= fResult * (1.5 - fValue * fResult * fResult);
	}
	
	return fResult;
}

function vector SetMouseCoords(vector V)
{
	CC("SetMouse" @ string(V.X) $ string(V.Y));
	
	return GetMouseCoords();
}

function vector GetMouseCoords()
{
	if(PC == none)
	{
		GetPC();
	}
	
    return Vec(PC.Player.WindowsMouseX, PC.Player.WindowsMouseY, 0.0);
}

function bool IsMouseAvailable()
{
	if(PC == none)
	{
		GetPC();
	}
	
	return PC.Player.bWindowsMouseAvailable;
}

function bool IsMouseVisible()
{
	if(PC == none)
	{
		GetPC();
	}
	
	return PC.Player.bShowWindowsMouse;
}

function bool SetMouseVisibility(bool B)
{
	if(PC == none)
	{
		GetPC();
	}
	
	PC.Player.bShowWindowsMouse = B;
	
	return IsMouseVisible();
}

function int CopySavedGame(int iCopyFromID, int iPasteAsID)
{
	local int I;
	
	I -= int(SaveGameExists(iPasteAsID));
	
	CC("CopySavedGame" @ string(iCopyFromID) @ string(iPasteAsID));
	
	I += int(SaveGameExists(iPasteAsID));
	
	return I;
}

function float GetFPSCap()
{
	return float(CC("GetMaxTickRate"));
}

function Screenshot()
{
	CC("Shot");
}

function RestartSound()
{
	local string S;
	
	S = GetCurrentMusic();
	
	CC("Sound_Reboot");
	
	PlayAMusic(S);
}

function SetNearClip(float F)
{
	CC("NearClip" @ string(F));
}

function bool IsFullscreen()
{
	return bool(CC("IsFullscreen"));
}

function Quit()
{
	CC("Quit");
}

function UnloadMutators(optional string sMapName)
{
	if(sMapName == "")
	{
		sMapName = GetCurrentMap();
	}
	
	CC("Start" @ sMapName);
}

function int SaveAGame(int iSlot, optional bool bSaveToCurrentSaveSlot)
{
	iSlot = Clamp(iSlot, 0, 9999);
	
	if(bSaveToCurrentSaveSlot)
	{
		iSlot = GetCurrentSaveSlot();
	}
	
	CC("SaveGame" @ string(iSlot));
	
	return iSlot;
}

function bool LoadAGame(int iSlot, optional bool bLoadCurrentSaveSlot)
{
	iSlot = Clamp(iSlot, 0, 9999);
	
	if(bLoadCurrentSaveSlot)
	{
		iSlot = GetCurrentSaveSlot();
	}
	
	if(SaveGameExists(iSlot))
	{
		CC("LoadGame" @ string(iSlot));
		
		return true;
	}
	
	return false;
}

function bool PlayMovie(string sMovieName, bool bUseSound, optional bool bLoopMovie)
{
	local Movie M;
	
	if(HUD == none)
	{
		GetHUD();
	}
	
	GetHP();
	
	M = GetCurrentMovie();
	
	if(M == none)
	{
		return false;
	}
	
	if(M.IsPlaying())
	{
		return false;
	}
	
	HUD.SetPropertyText("MoviePosX", "-1");
	HUD.SetPropertyText("MoviePosY", "-1");
	
	if(sMovieName == "")
	{
		return false;
	}
	
	M.Play(FormatMovieString(sMovieName), bUseSound, bLoopMovie);
	
	if(M.IsPlaying())
	{
		HP.GotoState('statePlayerInMovie');
	}
	
	return M.IsPlaying();
}

function bool FancyPlayMovie(string sMovieName, bool bUseSound, optional bool bLoopMovie, optional bool bNoSmartPlay, optional string sMovieName512, optional string sMovieName640, optional string sMovieName1024)
{
	local Movie M;
	
	if(HUD == none)
	{
		GetHUD();
	}
	
	GetHP();
	
	M = GetCurrentMovie();
	
	if(M == none)
	{
		return false;
	}
	
	if(M.IsPlaying())
	{
		return false;
	}
	
	HUD.SetPropertyText("MoviePosX", "-1");
	HUD.SetPropertyText("MoviePosY", "-1");
	
	if(sMovieName == "")
	{
		return false;
	}
	
	if(!bNoSmartPlay)
	{
		sMovieName512 = sMovieName $ "512";
		sMovieName640 = sMovieName $ "640";
		sMovieName1024 = sMovieName $ "1024";
	}
	else
	{
		if(sMovieName512 == "")
		{
			sMovieName512 = sMovieName;
		}
		
		if(sMovieName640 == "")
		{
			sMovieName640 = sMovieName;
		}
		
		if(sMovieName1024 == "")
		{
			sMovieName1024 = sMovieName;
		}
	}
	
	switch(GetResolution().X)
	{
		case 512:
			M.Play(FormatMovieString(sMovieName512), bUseSound, bLoopMovie);
			
			break;
		case 640:
			M.Play(FormatMovieString(sMovieName640), bUseSound, bLoopMovie);
			
			break;
		case 1024:
			M.Play(FormatMovieString(sMovieName1024), bUseSound, bLoopMovie);
			
			break;
		default:
			M.Play(FormatMovieString(sMovieName), bUseSound, bLoopMovie);
			
			break;
	}
	
	if(M.IsPlaying())
	{
		HP.GotoState('statePlayerInMovie');
	}
	
	return M.IsPlaying();
}

function string FormatMovieString(string S)
{
	if(Caps(Right(S, 4)) != Caps(".bik"))
	{
		S = S $ ".bik";
	}
	
	return S;
}

function bool PauseMovie(bool B)
{
	local Movie M;
	
	M = GetCurrentMovie();
	
	M.Pause(B);
	
	return IsMoviePaused() == B;
}

function bool IsMoviePaused()
{
	return GetCurrentMovie().IsPaused();
}

function bool StopMovie()
{
	local Movie M;
	
	M = GetCurrentMovie();
	
	M.StopNow();
	
	return !M.IsPlaying();
}

function StopMovieOnEnd()
{
	GetCurrentMovie().StopAtEnd();
}

function bool IsMoviePlaying()
{
	return GetCurrentMovie().IsPlaying();
}

function vector GetCurrentMovieResolution()
{
	local Movie M;
	
	M = GetCurrentMovie();
	
	return Vec(M.GetWidth(), M.GetHeight(), 0.0);
}

function SetDebugMode(bool bEnabled)
{
	class'KWVersion'.default.bDebugEnabled = bEnabled;
	class'KWVersion'.StaticSaveConfig();
	class'Version'.default.bDebugEnabled = bEnabled;
	class'Version'.StaticSaveConfig();
}

function int LoadHUDItem(class<KWHudItem> C)
{
	local int iIndex;
	
	if(HUD == none)
	{
		GetHUD();
	}
	
	iIndex = IsHUDItemLoaded(C);
	
	if(iIndex == -1)
	{
		HUD.AddHudItem(C, HUD);
		
		iIndex = IsHUDItemLoaded(C);
	}
	
	return iIndex;
}

function bool UnloadHUDItem(class<KWHudItem> C)
{
	local int iIndex;
	
	if(HUD == none)
	{
		GetHUD();
	}
	
	if(HUD == none)
	{
		GetHudItems();
	}
	
	iIndex = IsHUDItemLoaded(C);
	
	if(iIndex >= -1)
	{
		FancyDestroy(HudItems[iIndex]);
		HudItems.Remove(iIndex, 1);
	}
	
	return IsHUDItemLoaded(C) == -1;
}

function int IsHUDItemLoaded(class<KWHudItem> C)
{
	local int i;
	
	if(HUD == none)
	{
		GetHudItems();
	}
	
	for(i = 0; i < HUD.HudItems.Length; i++)
	{
		if(HUD.HudItems[i].Class == C)
		{
			return i;
		}
	}
	
	return -1;
}

static function bool IsOdd(int I)
{
	return I % 2 != 0;
}

static function bool IsEven(int I)
{
	return I % 2 == 0;
}

static function bool IsPrime(int iValue)
{
	local int i;
	
    if(iValue <= 1)
    {
        return false;
    }
	
    for(i = 2; i * i <= iValue; i++)
    {
        if(iValue % i == 0)
        {
            return false;
        }
    }
	
    return true;
}

static function float GetMaxFloat(optional bool bGetInfinite)
{
	if(!bGetInfinite)
	{
		return MaxFloat;
	}
	else
	{
		return Pow(3.402823466 * 10, 38);
	}
}

function bool IsDebugModeEnabled()
{
	return class'KWVersion'.default.bDebugEnabled || class'Version'.default.bDebugEnabled;
}

static function Color MakeColor(byte R, byte G, byte B, byte A)
{
	local Color C;
	
	C.R = R;
	C.G = G;
	C.B = B;
	C.A = A;
	
	return C;
}

function Announce(string sText1, optional float fDuration, optional Color cTextColor, optional string sText2, optional string sText3, optional string sText4)
{
	if(PC == none)
	{
		GetPC();
	}
	
	if(fDuration <= 0.0)
	{
		fDuration = 6.0;
	}
	
	PC.ClearProgressMessages();
	PC.SetProgressTime(fDuration);
	PC.SetProgressMessage(0, sText1, cTextColor);
	PC.SetProgressMessage(1, sText2, cTextColor);
	PC.SetProgressMessage(2, sText3, cTextColor);
	PC.SetProgressMessage(3, sText4, cTextColor);
}

static function string BoolToString(bool B)
{
	if(B)
	{
		return "True";
	}
	else
	{
		return "False";
	}
}

function bool IsInBonusLevel()
{
	return InStr(Caps(GetCurrentMap()), "BEANSTALK") > -1;
}

static function GameEngine GetGameEngine()
{
	return GameEngine(FindObject("Package.GameEngine", class'GameEngine'));
}

static function RenderDevice GetRenderDevice()
{
	return GetGameEngine().GRenDev;
}

static function Font GetFontFromEnum(EFont FontEnum)
{
	local Font fNewFont;
	
	switch(FontEnum)
	{
		case F_DefaultFont:
			fNewFont = Font'DefaultFont';
			
			break;
		case F_ConsoleFont:
			fNewFont = Font'ConsoleFont';
			
			break;
		case F_SmallFont:
			fNewFont = Font'SmallFont';
			
			break;
		case F_MediumFont:
			fNewFont = Font'MediumFont';
			
			break;
		case F_FontEurostile8:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontEurostile8", class'Font', true));
			
			break;
		case F_FontEurostile9:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontEurostile9", class'Font', true));
			
			break;
		case F_FontEurostile11:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontEurostile11", class'Font', true));
			
			break;
		case F_FontEurostile12:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontEurostile12", class'Font', true));
			
			break;
		case F_FontEurostile14:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontEurostile14", class'Font', true));
			
			break;
		case F_FontEurostile17:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontEurostile17", class'Font', true));
			
			break;
		case F_FontEurostile21:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontEurostile21", class'Font', true));
			
			break;
		case F_FontEurostile24:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontEurostile24", class'Font', true));
			
			break;
		case F_FontEurostile29:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontEurostile29", class'Font', true));
			
			break;
		case F_FontEurostile37:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontEurostile37", class'Font', true));
			
			break;
		case F_FontNeuzeit8:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontNeuzeit8", class'Font', true));
			
			break;
		case F_FontNeuzeit9:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontNeuzeit9", class'Font', true));
			
			break;
		case F_FontNeuzeit11:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontNeuzeit11", class'Font', true));
			
			break;
		case F_FontNeuzeit12:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontNeuzeit12", class'Font', true));
			
			break;
		case F_FontNeuzeit14:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontNeuzeit14", class'Font', true));
			
			break;
		case F_FontNeuzeit17:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontNeuzeit17", class'Font', true));
			
			break;
		case F_FontNeuzeit21:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontNeuzeit21", class'Font', true));
			
			break;
		case F_FontNeuzeit24:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontNeuzeit24", class'Font', true));
			
			break;
		case F_FontNeuzeit29:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontNeuzeit29", class'Font', true));
			
			break;
		case F_FontNeuzeit37:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontNeuzeit37", class'Font', true));
			
			break;
		case F_FontLarge:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontLarge", class'Font', true));
			
			break;
		case F_FontLarge1024x768:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontLarge1024x768", class'Font', true));
			
			break;
		case F_FontLarge800x600:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontLarge800x600", class'Font', true));
			
			break;
		case F_FontMedium:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontMedium", class'Font', true));
			
			break;
		case F_FontMedium1024x768:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontMedium1024x768", class'Font', true));
			
			break;
		case F_FontMedium800x600:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontMedium800x600", class'Font', true));
			
			break;
		case F_FontSmall:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontSmall", class'Font', true));
			
			break;
		case F_FontSmallText800x600:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontSmallText800x600", class'Font', true));
			
			break;
		case F_FontMono:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontMono", class'Font', true));
			
			break;
		case F_FontMono800x600:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.FontMono800x600", class'Font', true));
			
			break;
		case F_jFontLarge:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.jFontLarge", class'Font', true));
			
			break;
		case F_jFontLarge1024x768:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.jFontLarge1024x768", class'Font', true));
			
			break;
		case F_jFontLarge800x600:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.jFontLarge800x600", class'Font', true));
			
			break;
		case F_jFontMedium:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.jFontMedium", class'Font', true));
			
			break;
		case F_jFontMedium1024x768:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.jFontMedium1024x768", class'Font', true));
			
			break;
		case F_jFontMedium800x600:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.jFontMedium800x600", class'Font', true));
			
			break;
		case F_jFontSmall:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.jFontSmall", class'Font', true));
			
			break;
		case F_jFontSmallText800x600:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.jFontSmallText800x600", class'Font', true));
			
			break;
		case F_jFontMono:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.jFontMono", class'Font', true));
			
			break;
		case F_jFontMono800x600:
			fNewFont = Font(DynamicLoadObject("UT2003Fonts.jFontMono800x600", class'Font', true));
			
			break;
		case F_HugeInkFont:
			fNewFont = class'KWHud'.default.KWBigFont;
			
			break;
		case F_BigInkFont:
			fNewFont = class'KWHud'.default.KWMedFont;
			
			break;
		case F_MedInkFont:
			fNewFont = class'KWHud'.default.KWSmallFont;
			
			break;
		case F_SmallInkFont:
			fNewFont = class'KWHud'.default.KWTinyFont;
			
			break;
		case F_SHBigInkFont:
			fNewFont = class'SHHud'.default.SHBigFont;
			
			break;
		case F_SHMedInkFont:
			fNewFont = class'SHHud'.default.SHMedFont;
			
			break;
		case F_SHSmallInkFont:
			fNewFont = class'SHHud'.default.SHSmallFont;
			
			break;
		case F_SHTinyInkFont:
			fNewFont = class'SHHud'.default.SHTinyFont;
			
			break;
		case F_BigArielFont:
			fNewFont = class'SHHud'.default.SHBigArielFont;
			
			break;
		case F_MedArielFont:
			fNewFont = class'SHHud'.default.SHMedArielFont;
			
			break;
		case F_SmallArielFont:
			fNewFont = class'SHHud'.default.SHSmallArielFont;
			
			break;
		case F_TinyArielFont:
			fNewFont = class'SHHud'.default.SHTinyArielFont;
			
			break;
	}
	
	if(fNewFont == none)
	{
		return Font'DefaultFont';
	}
	
	return fNewFont;
}

function bool IsMovingForward(Actor A)
{
	local vector vVel, vDir;
	local rotator rRot;
	
	if(VSize2D(A.Acceleration) == 0.0 || VSize2D(A.Velocity) == 0.0)
	{
		return false;
	}
	
	vVel = A.Velocity;
	vVel.Z = 0.0;
	vVel = Normal(vVel);
	rRot = A.Rotation;
	rRot.Pitch = 0;
	rRot.Roll = 0;
	vDir = vector(rRot);
	
	if(vVel Dot vDir >= 0.5)
	{
		return true;
	}
	else
	{
		return false;
	}
}

static function string GetLoremIpsum(optional int iLength)
{
	if(iLength == 0)
	{
		return sLoremIpsum;
	}
	else
	{
		return Left(sLoremIpsum, Max(iLength, 2));
	}
}

static function rotator Rota(int Pitch, int Yaw, int Roll)
{
	local rotator R;
	
	R.Pitch = Pitch;
	R.Yaw = Yaw;
	R.Roll = Roll;
	
	return R;
}

static function bool IsMainPlayer(Pawn P)
{
	return bool(P.GetPropertyText("bIsMainPlayer"));
}

static function bool PercentChance(float fChance)
{
	if(FRand() < fChance)
	{
		return true;
	}
	else
	{
		return false;
	}
}

function Movie GetCurrentMovie()
{
	local array<string> TokenArray;
	local string sHUDMovieObject;
	
	if(HUD == none)
	{
		GetHUD();
	}
	
	TokenArray = Split(HUD.GetPropertyText("Movie"), "'");
	
	if(TokenArray.Length == 2)
	{
		sHUDMovieObject = Mid(TokenArray[1], InStr(TokenArray[1], ".") + 1);
	}
	else
	{
		return none;
	}
	
	return Movie(FindObject("Transient." $ sHUDMovieObject, class'Movie'));
}

function vector GetResolution()
{
	local string sRes;
	local array<string> TokenArray;
	local int iResX, iResY;
	
	sRes = CC("GetCurrentRes");
	
	TokenArray = Split(sRes, "x");
	
	iResX = int(TokenArray[0]);
	iResY = int(TokenArray[1]);
	
	return Vec(iResX, iResY, 0.0);
}

static function int DegreeToInt(float fDegrees)
{
	return int(((fDegrees % 360.0) / 360.0) * 65536.0);
}

static function float IntToDegree(int iAngle)
{
	return ((iAngle % 65536) / 65536.0) * 360.0;
}

function class<Actor> GetClassByString(string S)
{
	local class<Actor> NewClass;
	local array<string> Namespaces;
	local int i;
	
	Namespaces[0] = "KWGame.";
	Namespaces[1] = "SHGame.";
	Namespaces[2] = "Engine.";
	Namespaces[3] = "AmbientCreatures.";
	Namespaces[4] = "Gameplay.";
	Namespaces[5] = "MPak.";
	
	if(InStr(S, ".") > -1)
	{
		NewClass = class<Actor>(DynamicLoadObject(S, class'Class', true));
	}
	
	if(NewClass == none)
	{
		for(i = 0; i < Namespaces.Length; i++)
		{
			NewClass = class<Actor>(DynamicLoadObject(Namespaces[i] $ S, class'Class', true));
			
			if(NewClass != none)
			{
				break;
			}
		}
	}
	
	return NewClass;
}

function float GetDeltaTime()
{
	return fDeltaTime;
}

static function DrawShadowText(Canvas C, string sText, Color cTextColor, Color cTextShadowColor, int iXOffset, int iYOffset, float fShadowDist)
{
	local Color cOldColor;
	local float fStartX, fStartY;
	
	cOldColor = C.DrawColor;
	fStartX = iXOffset;
	fStartY = iYOffset;
	C.DrawColor.R = cTextShadowColor.R;
	C.DrawColor.G = cTextShadowColor.G;
	C.DrawColor.B = cTextShadowColor.B;
	C.CurX = fStartX + fShadowDist;
	C.CurY = fStartY + fShadowDist;
	C.DrawText(sText);
	C.DrawColor.R = cTextColor.R;
	C.DrawColor.G = cTextColor.G;
	C.DrawColor.B = cTextColor.B;
	C.CurX = fStartX;
	C.CurY = fStartY;
	C.DrawText(sText);
	C.DrawColor = cOldColor;
}

static function float GuessReadDuration(string S, optional float fCPS)
{
	if(fCPS == 0.0)
	{
		fCPS = 7.0;
	}
	
	fCPS = FMax(fCPS, 1.0);
	
	return float(Len(S)) / fCPS;
}

static function bool IsStockMap(string sMapName)
{
	sMapName = Caps(sMapName);
	
	return sMapName == "1_SHREKS_SWAMP" || sMapName == "2_CARRIAGE_HIJACK" || sMapName == "3_THE_HUNT_PART1" || sMapName == "3_THE_HUNT_PART2" || sMapName == "3_THE_HUNT_PART3" || sMapName == "3_THE_HUNT_PART4" || sMapName == "4_FGM_OFFICE" || sMapName == "4_FGM_PIB" || sMapName == "5_FGM_DONKEY" || sMapName == "6_HAMLET" || sMapName == "6_HAMLET_END" || sMapName == "6_HAMLET_MINE" || sMapName == "7_PRISON_DONKEY" || sMapName == "8_PRISON_PIB" || sMapName == "9_PRISON_SHREK" || sMapName == "10_CASTLE_SIEGE" || sMapName == "11_FGM_BATTLE" || sMapName == "BEANSTALK_BONUS" || sMapName == "BEANSTALK_BONUS_DAWN" || sMapName == "BEANSTALK_BONUS_KNIGHT" || sMapName == "BOOK_FRONTEND" || sMapName == "BOOK_STORY_1" || sMapName == "BOOK_STORY_2" || sMapName == "BOOK_STORY_3" || sMapName == "BOOK_STORY_4" || sMapName == "BOOK_STORYBOOK" || sMapName == "CREDITS" || sMapName == "ENTRY" || sMapName == "SH2_PREAMBLE";
}

function ClearInventory()
{
	local Inventory Inv;
	
	foreach DynamicActors(class'Inventory', Inv)
	{
		Inv.Destroy();
	}
}

function FadeScreen(Color ScreenColor, optional float fFadeTime, optional KWGame.enumMoveType FadeType, optional bool bFlash)
{
	local FadeViewDelegate Fader;
	
	Fader = Spawn(class'FadeViewDelegate');
	Fader.Init(float(ScreenColor.A) / 255, float(ScreenColor.R) / 255, float(ScreenColor.G) / 255, float(ScreenColor.B) / 255, fFadeTime, FadeType, bFlash);
}

function DestroyAll(class<Actor> aClass)
{
	local Actor A;
	
	foreach AllActors(aClass, A)
	{
		FancyDestroy(A);
	}
}

function bool AddInventory(class<KWInventoryCollection> CollectionClass, int iNumItems)
{
	return KWPawn(ICP).AddToInventoryCollection(CollectionClass, iNumItems);
}

function bool SubtractInventory(class<KWInventoryCollection> CollectionClass, int iNumItems)
{
	return KWPawn(ICP).SubtractFromInventoryCollection(CollectionClass, iNumItems);
}

function bool MultiplyInventory(class<KWInventoryCollection> CollectionClass, float fMultiplier)
{
	local int iOldNumItems;
	
	iOldNumItems = GetInventoryCount(CollectionClass);
	
	AddInventory(CollectionClass, -iOldNumItems);
	
	return AddInventory(CollectionClass, Floor(float(iOldNumItems) * fMultiplier));
}

function bool DivideInventory(class<KWInventoryCollection> CollectionClass, float fDivisor)
{
	local int iOldNumItems;
	
	iOldNumItems = GetInventoryCount(CollectionClass);
	
	AddInventory(CollectionClass, -iOldNumItems);
	
	return AddInventory(CollectionClass, Floor(float(iOldNumItems) / fDivisor));
}

function bool SetInventory(class<KWInventoryCollection> CollectionClass, int iNumItems)
{
	local int iOldNumItems;
	
	iOldNumItems = GetInventoryCount(CollectionClass);
	
	AddInventory(CollectionClass, -iOldNumItems);
	
	return AddInventory(CollectionClass, iNumItems);
}

function int GetInventoryCount(class<KWInventoryCollection> CollectionClass)
{
	return KWPawn(ICP).GetInventoryCount(CollectionClass.default.PickupClass.Name);
}

function ChangeLevel(string sLevelName, optional bool bKeepInventory)
{
	if(PC == none)
	{
		GetPC();
	}
	
	PC.ClientCloseMenu(true);
	
	Level.Game.ProcessServerTravel(sLevelName, bKeepInventory);
}

function RestartLevel(optional bool bDoNotKeepInventory)
{
	ChangeLevel("?restart", !bDoNotKeepInventory);
}

static function int Rand32()
{
	local int iRandom32Bit;
	
	iRandom32Bit = Rand(256);
	iRandom32Bit = iRandom32Bit | (Rand(256) << 8);
	iRandom32Bit = iRandom32Bit | (Rand(256) << 16);
	iRandom32Bit = iRandom32Bit | (Rand(256) << 24);
	
	return iRandom32Bit;
}

static function int Rand16()
{
	local int iRandom16Bit;
	
	iRandom16Bit = Rand(256);
	iRandom16Bit = iRandom16Bit | (Rand(256) << 8);
	
	return iRandom16Bit;
}

static function int RandRange32(int Min, int Max)
{
	return Min + (Rand32() % (Max - Min + 1));
}

static function int RandRange16(int Min, int Max)
{
	return Min + (Rand16() % (Max - Min + 1));
}

static function SetCheatsEnabled(bool B)
{
	if(B)
	{
		class'ShrekController'.default.CheatClass = class'SHCheatManager';
		class'DonkeyController'.default.CheatClass = class'SHCheatManager';
	}
	else
	{
		class'ShrekController'.default.CheatClass = none;
		class'DonkeyController'.default.CheatClass = none;
	}
}

function bool IsSoftwareRendering()
{
	return "PixoDrv.PixoRenderDevice" ~= GetIniEntry("Engine.Engine", "RenderDevice", "system");
}

function float GetLevelLoadTime(optional bool bGetOriginal)
{
	if(!bGetOriginal)
	{
		return fLevelLoadTime;
	}
	else
	{
		return fOriginalLevelLoadTime;
	}
}

static function int RandRangeInt(int Min, int Max)
{
	local int i;
	
	if(Min == Max)
	{
		return Min;
	}
	
	if(Min > Max)
	{
		i = Min;
		Min = Max;
		Max = i;
	}
	
	return Rand(Max - Min + 1) + Min;
}

static function float RandRangeFloat(float Min, float Max)
{
	local float f;
	
	if(Min == Max)
	{
		return Min;
	}
	
	if(Min > Max)
	{
		f = Min;
		Min = Max;
		Max = f;
	}
	
	return Min + ((Max - Min) * FRand());
}

static function int wRNG(array<int> Is)
{
	local int i, RandNum, TotalWeight;
	
	if(Is.Length <= 1)
	{
		return 0;
	}
	
	// Gets the total weight of all entries in the array
	for(i = 0; i < Is.Length; i++)
	{
		TotalWeight += Is[i];
	}
	
	// Picks a random number
	RandNum = Rand(TotalWeight);
	
	// Picks a random action based on the weights
	for(i = 0; i < Is.Length; i++)
	{
		if(RandNum < Is[i])
		{
			// We found the action that corresponds with the random number
			return i;
			
			break;
		}
		
		// Didn't find the action yet; iterate again
		RandNum -= Is[i];
	}
}

static function array<int> ShuffleIntArray(int iLength)
{
	local int i, iTemp, iRandomIndex, iArrayLength;
	local array<int> Is;
	
	for(i = 0; i < iLength; i++)
	{
		Is.Insert(Is.Length, 1);
		Is[Is.Length - 1] = i;
	}
	
	iArrayLength = Is.Length;
	
	for(i = iArrayLength - 1; i > 0; i--)
	{
		iRandomIndex = Rand(i + 1);
		
		iTemp = Is[i];
		Is[i] = Is[iRandomIndex];
		Is[iRandomIndex] = iTemp;
	}
	
	return Is;
}

function HackMovementAnims(SHHeroPawn SHHP, array<name> MovementAnims)
{
	local bool bOldbInQuicksand;
	local float fOldGroundSpeed;
	local name OldWadeAnims[4];
	local int i;
	
	for(i = 0; i < 4; i++)
	{
		OldWadeAnims[i] = SHHP.WadeAnims[i];
		SHHP.WadeAnims[i] = MovementAnims[i];
	}
	
	bOldbInQuicksand = SHHP.bInQuicksand;
	fOldGroundSpeed = SHHP.GroundSpeed;
	
	SHHP.HeroInQuicksand();
	
	SHHP.bInQuicksand = bOldbInQuicksand;
	SHHP.GroundSpeed = fOldGroundSpeed;
	
	for(i = 0; i < 4; i++)
	{
		SHHP.WadeAnims[i] = OldWadeAnims[i];
	}
}

function bool DoesFileExist(string sFileName)
{
	local array<string> FileContents;
	
	LoadStringArray(FileContents, sFileName);
	
	return FileContents.Length != 0;
}

static function float GetHUDScale(Canvas C)
{
	return (float(C.SizeY) / 768.0 + float(C.SizeX) / 1024.0) / 2.0;
}

function float GetGUIScale()
{
	local vector V;
	
	V = GetResolution();
	
	return (V.Y / 768.0 + V.X / 1024.0) / 2.0;
}

function float CalculateHorizontalFOV(float fVerticalFOV)
{
	local vector vRes;
	local float fAspectRatio;
	
	vRes = GetResolution();
	
	fAspectRatio = vRes.X / vRes.Y;
	
	return 2.0 * ATan(Tan(fVerticalFOV * PI / 360.0) * fAspectRatio, 1.0) * 180.0 / PI;
}

function float CalculateVerticalFOV(float fHorizontalFOV)
{
	local vector vRes;
	local float fAspectRatio;
	
	vRes = GetResolution();
	
	fAspectRatio = vRes.X / vRes.Y;
	
	return 2.0 * ATan(Tan(fHorizontalFOV * PI / 360.0) / fAspectRatio, 1.0) * 180.0 / PI;
}

static function RemoveText(out string Source, string TextToRemove)
{
    local int StartIndex;
	
    StartIndex = InStr(Source, TextToRemove);
	
    if(StartIndex > -1)
    {
        Source = Left(Source, StartIndex - 1) $ Mid(Source, StartIndex + Len(TextToRemove));
    }
}

function LipSyncDialog(KWPawn LipSyncOwner, Sound DialogSound, string sDialogLine)
{
	local MLipSyncDelegate LSD;
	
	LSD = Spawn(class'MLipSyncDelegate');
	
	if(LSD == none)
	{
		return;
	}
	
	LSD.LSData.LipSyncOwner = LipSyncOwner;
	LSD.LSData.DialogSound = DialogSound;
	LSD.LSData.sDialogLine = sDialogLine;
	LSD.Trigger(self, none);
}

function bool IsShrek22()
{
	return Level.Game.IsA('SH22Game');
}

static function bool IsActorBehindActor(Actor A1, Actor A2, optional float fAttackAngle)
{
	local vector dir1, dir2;
	local rotator rot1, rot2;
	local float cosYaw, cosAngle;
	
	if(A1 == none || A2 == none)
	{
		return false;
	}
	
	if(fAttackAngle <= 0.0)
	{
		// 60.0 unless overwrote
		fAttackAngle = class'SHEnemy'.default.AttackAngle;
	}
	
	rot1 = A1.Rotation;
	rot2 = A2.Rotation;
	dir1 = vector(rot1);
	dir2 = vector(rot2);
	cosYaw = dir1 Dot dir2;
	cosYaw *= -1.0;
	cosAngle = Cos((fAttackAngle * PI) / 180.0);
	
	return cosYaw < cosAngle;
}

static function float Fact(int iValue)
{
	local float Fact[35];
	
	Fact[0] = 1.0;
	Fact[1] = 1.0;
	Fact[2] = 2.0;
	Fact[3] = 6.0;
	Fact[4] = 24.0;
	Fact[5] = 120.0;
	Fact[6] = 720.0;
	Fact[7] = 5040.0;
	Fact[8] = 40320.0;
	Fact[9] = 362880.0;
	Fact[10] = 3628800.0;
	Fact[11] = 39916800.0;
	Fact[12] = 479001600.0;
	Fact[13] = 6227020800.0;
	Fact[14] = 87178291200.0;
	Fact[15] = 1307674368000.0;
	Fact[16] = 20922789888000.0;
	Fact[17] = 355687428096000.0;
	Fact[18] = 6402373705728000.0;
	Fact[19] = 121645100408832000.0;
	Fact[20] = 2432902008176640000.0;
	Fact[21] = 51090942171709440000.0;
	Fact[22] = 1124000727777607680000.0;
	Fact[23] = 25852016738884976640000.0;
	Fact[24] = 620448401733239439360000.0;
	Fact[25] = 15511210043330985984000000.0;
	Fact[26] = 403291461126605635584000000.0;
	Fact[27] = 10888869450418352160768000000.0;
	Fact[28] = 304888344611713860501504000000.0;
	Fact[29] = 8841761993739701954543616000000.0;
	Fact[30] = 265252859812191058636308480000000.0;
	Fact[31] = 8222838654177922817725562880000000.0;
	Fact[32] = 263130836933693530167218012160000000.0;
	Fact[33] = 8683317618811886495518194401280000000.0;
	Fact[34] = 295232799039604140847618609643520000000.0;
	
	return Fact[Clamp(iValue, 0, 34)];
}

static function Color RandColor(byte Min, byte Max, optional byte Alpha, optional bool bRandomAlpha)
{
	local byte Bs[4];
	local int i;
	
	for(i = 0; i < 3; i++)
	{
		Bs[i] = RandRangeInt(Min, Max);
	}
	
	if(!bRandomAlpha)
	{
		Bs[3] = Alpha;
	}
	else
	{
		Bs[3] = RandRangeInt(Min, Max);
	}
	
	return MakeColor(Bs[0], Bs[1], Bs[2], Bs[3]);
}

function Mutator GetMutator(class<Mutator> MutatorClass)
{
	local Mutator M;
	
	foreach AllActors(class'Mutator', M)
	{
		if(M.Class == MutatorClass)
		{
			return M;
		}
	}
}


// KnowWonder Functions

function array<string> Split(string Source, optional string Delimiter)
{
	return KWGame(Level.Game).Split(Source, Delimiter);
}

static function vector Vec(float X, float Y, float Z) // Static functions must be rewrote to prevent a crash
{
	local vector V;
	
	V.X = X;
	V.Y = Y;
	V.Z = Z;
	
	return V;
}

function CM(coerce string S)
{
	KWGame(Level.Game).CM(S);
}

function LogAndCM(coerce string S) // Fixed order of execution
{
	Log(S);
	CM(S);
}

function CMAndLog(coerce string S)
{
	KWGame(Level.Game).CMAndLog(S);
}

function bool AssertM(bool B, coerce string S)
{
	return KWGame(Level.Game).assertm(B, S);
}

function Actor GetActorFromLabel(string rTag)
{
	return KWGame(Level.Game).GetActorFromLabel(rTag);
}

function bool SaveGameExists(int iSlot)
{
	return KWGame(Level.Game).SaveGameExists(iSlot);
}

function vector ApproximateTrajectoryByTime(vector vPosStart, vector vPosEnd, float fTimeEnd, float accuracy, optional float AlternateZAccel)
{
	return KWGame(Level.Game).ApproximateTrajectoryByTime(vPosStart, vPosEnd, fTimeEnd, accuracy, AlternateZAccel);
}

function vector ComputeTrajectoryByTime(vector vPosStart, vector vPosEnd, float fTimeEnd, optional float AlternateZAccel)
{
	return KWGame(Level.Game).ComputeTrajectoryByTime(vPosStart, vPosEnd, fTimeEnd, AlternateZAccel);
}

function vector ComputeTrajectoryByVelocity(vector vPosStart, vector vPosEnd, float fStartVelocity, optional float AlternateZAccel)
{
	return KWGame(Level.Game).ComputeTrajectoryByVelocity(vPosStart, vPosEnd, fStartVelocity, AlternateZAccel);
}

function vector ComputeTrajectoryByAngle(vector vPosStart, vector vPosEnd, float fStartAngle, optional float AlternateZAccel)
{
	return KWGame(Level.Game).ComputeTrajectoryByAngle(vPosStart, vPosEnd, fStartAngle, AlternateZAccel);
}

function FindCurrentMusic(out string CurrentMusic)
{
	KWGame(Level.Game).FindCurrentMusic(CurrentMusic);
}

function string LoadStringArray(out array<string> StringArray, string Filename)
{
	return KWGame(Level.Game).LoadStringArray(StringArray, Filename);
}

function string SaveStringArray(array<string> StringArray, string Filename)
{
	return KWGame(Level.Game).SaveStringArray(StringArray, Filename);
}

function string GetIniEntry(string SectionName, string KeyName, string PackageName)
{
	return KWGame(Level.Game).GetIniEntry(SectionName, KeyName, PackageName);
}

function KWDeleteSaveGame(int iSlot)
{
	KWGame(Level.Game).KWDeleteSaveGame(iSlot);
}

function SetUTracing(bool bNewUTracing, optional bool bTraceNative)
{
	KWGame(Level.Game).SetUTracing(bNewUTracing, bTraceNative);
}

function bool IsUTracing()
{
	return KWGame(Level.Game).IsUTracing();
}

function string GetLanguage()
{
	return KWGame(Level.Game).GetLanguage();
}

function bool NeedSAPFont()
{
	return KWGame(Level.Game).NeedSAPFont();
}

function float VSize2D(vector V)
{
	return KWGame(Level.Game).VSize2d(V);
}

function vector Normal2D(vector V)
{
	return KWGame(Level.Game).normal2d(V);
}

function vector Vector2D(vector V)
{
	return KWGame(Level.Game).vector2d(V);
}

function rotator RotationDiff(rotator B, rotator A)
{
	return KWGame(Level.Game).RotationDiff(B, A);
}

function int RotationDir(int A, int B)
{
	return KWGame(Level.Game).RotationDir(A, B);
}

function float FClampScale(float f, float c1, float c2, float s1, float s2)
{
	return KWGame(Level.Game).FClampScale(f, c1, c2, s1, s2);
}

function float EaseBetween(float t)
{
	return KWGame(Level.Game).EaseBetween(t);
}

function float EaseBetweenBell(float t)
{
	return KWGame(Level.Game).EaseBetweenBell(t);
}

function float EaseBetweenParabola(float t)
{
	return KWGame(Level.Game).EaseBetweenParabola(t);
}

function float FancyEaseBetween(float t, optional float HowLinear)
{
	return KWGame(Level.Game).FancyEaseBetween(t, HowLinear);
}

function float EaseFrom(float t)
{
	return KWGame(Level.Game).EaseFrom(t);
}

function float EaseTo(float t)
{
	return KWGame(Level.Game).EaseTo(t);
}

function string StripSpaces(string S)
{
	return KWGame(Level.Game).StripSpaces(S);
}


defaultproperties
{
	bNoDelete=false
	bAlwaysTick=true
}