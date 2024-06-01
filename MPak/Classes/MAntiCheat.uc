// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MAntiCheat extends MInfo
	Config(MPak);


#exec TEXTURE IMPORT NAME=MAntiCheat FILE=Textures\MAntiCheat.dds FLAGS=2


enum EPunishType
{
	PT_None,
	PT_ConsoleCommand,
	PT_SetProp,
	PT_TriggerEvent,
	PT_Announce
};

struct SetPropStruct
{
	var() class<Actor> ActorClass;
	var() name ActorTag;
	var() string Variable, Value;
};

struct AnnounceStruct
{
	var() float fAnnTime;
	var() Color AnnColor;
};

var() bool bEnforceSteedsModifiedJumpHeight, bEnforcePIBsFactoryFallDamage;
var() MAntiCheat.EPunishType PunishType;
var() array<string> ConsoleCommands;
var() array<SetPropStruct> SetProps;
var() name nEventToFire;
var() AnnounceStruct AnnouncementSettings;
var array<string> CheatMessages;


event PostBeginPlay()
{
	local MAntiCheat AC;
	local int i;
	
	super.PostBeginPlay();
	
	foreach DynamicActors(class'MAntiCheat', AC)
	{
		i++;
		
		if(i > 1)
		{
			Warn("MAntiCheat -- Deleting a duplicate MAntiCheat");
			
			Destroy();
			
			return;
		}
	}
	
	Log(class'MVersion'.default.ModName @ class'MVersion'.default.Version @ "-- This level is running Master's Anti-Cheat (M.A.C.), made by Master_64");
}

event PostLoadGame(bool bLoadFromSaveGame)
{
	if(!bLoadFromSaveGame)
	{
		PC = U.GetPC();
		HP = U.GetHP();
	}
	
	U.SetCheatsEnabled(false);
}

event Tick(float DeltaTime)
{
	HP = U.GetHP();
	EnforceNoCheats();
	
	if(CheatMessages.Length != 0)
	{
		ReactToCheats();
	}
}

function ReactToCheats() // Should be fired to if a cheat was just caught
{
	local Actor TargetActor;
	local string CheatMessage;
	local int i;
	
	switch(PunishType)
	{
		case PT_None:
			break;
		case PT_ConsoleCommand:
			for(i = 0; i < ConsoleCommands.Length; i++)
			{
				PC.ConsoleCommand(ConsoleCommands[i]);
			}
			
			break;
		case PT_SetProp:
			for(i = 0; i < SetProps.Length; i++)
			{
				foreach AllActors(SetProps[i].ActorClass, TargetActor, SetProps[i].ActorTag)
				{
					break;
				}
				
				if(TargetActor != none)
				{
					TargetActor.SetPropertyText(SetProps[i].Variable, SetProps[i].Value);
				}
			}
			
			break;
		case PT_TriggerEvent:
			TriggerEvent(nEventToFire, none, none);
			
			break;
		case PT_Announce:
			for(i = 0; i < CheatMessages.Length; i++)
			{
				if(i == 0)
				{
					CheatMessage = CheatMessages[i];
				}
				else
				{
					CheatMessage = CheatMessage @ "+" @ CheatMessages[i];
				}
			}
			
			U.Announce(CheatMessage, AnnouncementSettings.fAnnTime, AnnouncementSettings.AnnColor);
			
			break;
	}
}

function EnforceNoCheats() // Check if the player is cheating, and if cheating is detected, re-inforce the cheated variables back to their default values
{
	local float TempF;
	local array<string> DetectedCheatMessages;
	
	if((PC.bGodMode != PC.default.bGodMode)) // God mode check 1
	{
		PC.bGodMode = PC.default.bGodMode;
		
		DetectedCheatMessages[DetectedCheatMessages.Length] = "Using god mode (v1) cheats";
	}
	
	if(HP.IsA('SHHeroPawn')) // God mode check 2
	{
		if(SHHeroPawn(HP).AmInvunerable != SHHeroPawn(HP).default.AmInvunerable)
		{
			SHHeroPawn(HP).AmInvunerable = SHHeroPawn(HP).default.AmInvunerable;
			
			DetectedCheatMessages[DetectedCheatMessages.Length] = "Using god mode (v2) cheats";
		}
	}
	
	if(PC.IsInState('PlayerFlying')) // Ghost check
	{
		U.CC("Walk");
		
		DetectedCheatMessages[DetectedCheatMessages.Length] = "Using ghost cheats";
	}
	
	if(U.IsDebugModeEnabled()) // Debug mode check
	{
		U.SetDebugMode(false);
		
		DetectedCheatMessages[DetectedCheatMessages.Length] = "Using debug mode";
	}
	
	if(HP.IsA('KWPawn')) // Speed check
	{
		if(KWPawn(HP).GroundRunSpeed != KWPawn(HP).default.GroundRunSpeed)
		{
			KWPawn(HP).GroundRunSpeed = KWPawn(HP).default.GroundRunSpeed;
			
			DetectedCheatMessages[DetectedCheatMessages.Length] = "Using speed cheats";
		}
	}
	
	TempF = U.GetDefaultJumpValue(SHHeroPawn(HP), false);
	
	if(HP.JumpZ != TempF) // Jump check 1
	{
		HP.JumpZ = TempF;
		
		DetectedCheatMessages[DetectedCheatMessages.Length] = "Using jump (v1) cheats";
	}
	
	if(HP.IsA('KWPawn')) // Jump check 2
	{
		if(bEnforceSteedsModifiedJumpHeight && HP.IsA('Steed'))
		{
			if(KWPawn(HP).DoubleJumpZ != 505.964417)
			{
				KWPawn(HP).DoubleJumpZ = 505.964417;
				
				DetectedCheatMessages[DetectedCheatMessages.Length] = "Using jump (v2) cheats";
			}
		}
		else
		{
			TempF = U.GetDefaultJumpValue(SHHeroPawn(HP), true);
			
			if(KWPawn(HP).DoubleJumpZ != TempF)
			{
				KWPawn(HP).DoubleJumpZ = TempF;
				
				DetectedCheatMessages[DetectedCheatMessages.Length] = "Using jump (v2) cheats";
			}
		}
	}
	
	if(HP.IsA('SHHeroPawn')) // Jump check 3
	{
		if(SHHeroPawn(HP).AirAttackBoost != SHHeroPawn(HP).default.AirAttackBoost)
		{
			SHHeroPawn(HP).AirAttackBoost = SHHeroPawn(HP).default.AirAttackBoost;
			
			DetectedCheatMessages[DetectedCheatMessages.Length] = "Using jump (v3) cheats";
		}
	}
	
	if(HP.IsA('SHHeroPawn')) // Jump check 4
	{
		if(SHHeroPawn(HP).AirAttackFall != SHHeroPawn(HP).default.AirAttackFall)
		{
			SHHeroPawn(HP).AirAttackFall = SHHeroPawn(HP).default.AirAttackFall;
			
			DetectedCheatMessages[DetectedCheatMessages.Length] = "Using jump (v4) cheats";
		}
	}
	
	if(HP.IsA('SHCharacter')) // Jump check 5
	{
		TempF = U.GetDefaultJumpDistScalarValue(SHHeroPawn(HP));
		
		if(KWPawn(HP).fJumpDistScalar != TempF)
		{
			KWPawn(HP).fJumpDistScalar = TempF;
			
			DetectedCheatMessages[DetectedCheatMessages.Length] = "Using jump (v5) cheats";
		}
	}
	
	if(HP.IsA('SHHeroPawn')) // Fall damage check
	{
		if(bEnforcePIBsFactoryFallDamage && HP.IsA('PIB'))
		{
			if(SHHeroPawn(HP).DeathIfFallDistance != 1000.0)
			{
				SHHeroPawn(HP).DeathIfFallDistance = 1000.0;
				
				DetectedCheatMessages[DetectedCheatMessages.Length] = "Using fall damage cheats";
			}
		}
		else
		{
			if(SHHeroPawn(HP).DeathIfFallDistance != SHHeroPawn(HP).default.DeathIfFallDistance)
			{
				SHHeroPawn(HP).DeathIfFallDistance = SHHeroPawn(HP).default.DeathIfFallDistance;
				
				DetectedCheatMessages[DetectedCheatMessages.Length] = "Using fall damage cheats";
			}
		}
	}
	
	if(HP.AccelRate != HP.default.AccelRate) // Acceleration rate check
	{
		HP.AccelRate = HP.default.AccelRate;
		
		DetectedCheatMessages[DetectedCheatMessages.Length] = "Using acceleration rate cheats";
	}
	
	if(float(HP.GetPropertyText("fMinFloorZ")) != 0.7) // Min floor angle check
	{
		HP.SetPropertyText("fMinFloorZ", "0.7");
		
		DetectedCheatMessages[DetectedCheatMessages.Length] = "Using minimum floor angle cheats";
	}
	
	if(HP.AirControl != HP.default.AirControl) // Air control check
	{
		HP.AirControl = HP.default.AirControl;
		
		DetectedCheatMessages[DetectedCheatMessages.Length] = "Using air control cheats";
	}
	
	if(Level.TimeDilation != Level.default.TimeDilation) // SloMo check
	{
		Level.TimeDilation = Level.default.TimeDilation;
		
		DetectedCheatMessages[DetectedCheatMessages.Length] = "Using SloMo cheats";
	}
	
	if(PhysicsVolume.Gravity.Z != PhysicsVolume.default.Gravity.Z) // Gravity check
	{
		PhysicsVolume.Gravity.Z = PhysicsVolume.default.Gravity.Z;
		
		DetectedCheatMessages[DetectedCheatMessages.Length] = "Using gravity Z cheats";
	}
	
	if(!bool(U.CC("Get ini:Engine.Engine.ViewportManager ScreenFlashes"))) // Screen fade check
	{
		U.CC("Set ini:Engine.Engine.ViewportManager ScreenFlashes True");
		
		DetectedCheatMessages[DetectedCheatMessages.Length] = "Using screen fade cheats";
	}
	
	CheatMessages = DetectedCheatMessages;
}

function TickEnabled(bool B) // Used from MACTION_ManageAntiCheat
{
	if(B)
	{
		Enable('Tick');
	}
	else
	{
		Disable('Tick');
	}
}


defaultproperties
{
	bEnforceSteedsModifiedJumpHeight=true
	AnnouncementSettings=(fAnnTime=3.0,AnnColor=(R=255,G=0,B=0,A=255))
	Texture=Texture'MAntiCheat'
}