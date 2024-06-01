// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MPatcher extends MInfo
	Config(MPak);


#exec TEXTURE IMPORT NAME=MPatcher FILE=Textures\MPatcher.dds FLAGS=2


struct FogStruct
{
	var() name ZoneInfoTag;
	var() Color DistanceFogColor;
	var() float DistanceFogStart, DistanceFogEnd;
};

struct MaterialStruct
{
	var() Material Material;
	var() KWGame.EMaterialType MaterialType;
};

struct HealthStruct
{
	var() SHHeroPawn Pawn;
	var() float fOldHealth;
};

struct PatchStruct
{
	var() bool bPressureVolumesWithTagPushPotions, bMeshesWithTagBecomeShimmyable, bEnforceFogForZoneInfo, bFixSteedsDoubleJump, bMakePIBTakeFactoryFallDamage, bMakeGameStateExclusionsDestroyActors, bFixSwingingBallHitboxes, bFixProjectorsBreakingOnLoadGame, bFixDefaultEmitterOpacities, bAssignDefaultMaterialTypesForMaterials, bMoverWithTagUsesSpringGlideType, bAssignLevelID;
};

struct OptionalStruct
{
	var() array<name> PressureVolumeTags, ShimmyPipeTags, SpringGlideTypeMoverTags;
	var() array<FogStruct> FogActions;
	var() bool bDefaultMaterialTypes;
	var() array<MaterialStruct> MaterialActions;
	var() string sNewLevelID;
};

struct CosmeticPatchStruct
{
	var() bool bDisablePersistentStore, bFixCheatManager, bFixHealthPersistence, bAddPickupShading;
};

var(MPatcher_Core) PatchStruct PatchesToApply;
var(MPatcher_Core) OptionalStruct OptionalOptions;
var(MPatcher_Cosmetic) CosmeticPatchStruct CosmeticPatchesToApply;
var array<HealthStruct> OldHealthOfPlayers;
var array< class<SHPickupUnlit> > PickupClasses;


event PostLoadGame(bool bLoadFromSaveGame)
{
	local Projector P;
	local PersistentStore PS;
	local int i;
	
	if(!bLoadFromSaveGame)
	{
		PatchLevel();
		
		return;
	}
	
	PC = U.GetPC();
	
	if(PatchesToApply.bFixProjectorsBreakingOnLoadGame)
	{
		foreach AllActors(class'Projector', P)
		{
			if(!P.IsA('ShadowProjector'))
			{
				P.AttachProjector();
			}
		}
	}
	
	if(CosmeticPatchesToApply.bDisablePersistentStore)
	{
		foreach DynamicActors(class'PersistentStore', PS)
		{
			U.FancyDestroy(PS);
		}
	}
	
	if(CosmeticPatchesToApply.bFixCheatManager)
	{
		if(!PC.IsA('MController'))
		{
			PC.AddCheats();
		}
	}
	
	if(CosmeticPatchesToApply.bFixHealthPersistence)
	{
		for(i = 0; i < OldHealthOfPlayers.Length; i++)
		{
			U.SetHealth(OldHealthOfPlayers[i].Pawn, OldHealthOfPlayers[i].fOldHealth, true);
		}
	}
}

event PreSaveGame()
{
	local SHHeroPawn SHHP;
	
	if(CosmeticPatchesToApply.bFixHealthPersistence)
	{
		OldHealthOfPlayers.Remove(0, OldHealthOfPlayers.Length);
		
		foreach DynamicActors(class'SHHeroPawn', SHHP)
		{
			OldHealthOfPlayers.Insert(OldHealthOfPlayers.Length, 1);
			OldHealthOfPlayers[OldHealthOfPlayers.Length - 1].Pawn = SHHP;
			OldHealthOfPlayers[OldHealthOfPlayers.Length - 1].fOldHealth = U.GetHealth(SHHP);
		}
	}
}

event PreBeginPlay()
{
	super.PreBeginPlay();
	
	if(PatchesToApply.bAssignLevelID)
	{
		Level.SetPropertyText("ID", OptionalOptions.sNewLevelID);
	}
}

event PatchLevel() // Patches the current level
{
	local MPatcher DK;
	local PressureVolume PV;
	local StaticMeshActor SM;
	local ZoneInfo ZI;
	local Steed S;
	local PIB P;
	local Actor A;
	local SwingStoneAttachment SSA;
	local BallSpikedAttachment BSA;
	local Emitter E;
	local Mover M;
	local PersistentStore PS;
	local string sOpacity;
	local int i, iAppliedCount;
	
	foreach DynamicActors(class'MPatcher', DK)
	{
		i++;
		
		if(i > 1)
		{
			Warn("MPatcher -- Deleting a duplicate MPatcher");
			
			Destroy();
			
			return;
		}
	}
	
	if(PatchesToApply.bPressureVolumesWithTagPushPotions)
	{
		foreach AllActors(class'PressureVolume', PV)
		{
			if(U.IsNameInNameArray(PV.Tag, OptionalOptions.PressureVolumeTags))
			{
				PV.SetPropertyText("bAffectAllActors", "True");
				
				iAppliedCount++;
			}
		}
	}
	
	if(PatchesToApply.bMeshesWithTagBecomeShimmyable)
	{
		foreach AllActors(class'StaticMeshActor', SM)
		{
			if(U.IsNameInNameArray(SM.Tag, OptionalOptions.ShimmyPipeTags))
			{
				SM.bIsMountable = true;
				SM.SetPropertyText("MountAction", "MA_UnAbleFinishMount");
				
				iAppliedCount++;
			}
		}
	}
	
	if(PatchesToApply.bEnforceFogForZoneInfo)
	{
		for(i = 0; i < OptionalOptions.FogActions.Length; i++)
		{
			foreach AllActors(class'ZoneInfo', ZI, OptionalOptions.FogActions[i].ZoneInfoTag)
			{
				ZI.bDistanceFog = true;
				ZI.DistanceFogColor = OptionalOptions.FogActions[i].DistanceFogColor;
				ZI.DistanceFogStart = OptionalOptions.FogActions[i].DistanceFogStart;
				ZI.DistanceFogEnd = OptionalOptions.FogActions[i].DistanceFogEnd;
				
				iAppliedCount++;
			}
		}
	}
	
	if(PatchesToApply.bFixSteedsDoubleJump)
	{
		foreach DynamicActors(class'Steed', S)
		{
			S.fDoubleJumpHeight = 128.0;
			S.SetJumpVars();
			
			iAppliedCount++;
		}
	}
	
	if(PatchesToApply.bMakePIBTakeFactoryFallDamage)
	{
		foreach DynamicActors(class'PIB', P)
		{
			P.DeathIfFallDistance = 1000.0;
			
			iAppliedCount++;
		}
	}
	
	if(PatchesToApply.bMakeGameStateExclusionsDestroyActors)
	{
		foreach AllActors(class'Actor', A)
		{
			if(!bool(A.GetPropertyText("bInCurrentGameState")))
			{
				U.FancyDestroy(A);
				
				iAppliedCount++;
			}
		}
	}
	
	if(PatchesToApply.bFixSwingingBallHitboxes)
	{
		foreach DynamicActors(class'SwingStoneAttachment', SSA)
		{
			SSA.SetCollisionSize(100.0, 100.0);
			SSA.SetPropertyText("CollideType", "CT_Cylinder");
			
			iAppliedCount++;
		}
		
		foreach DynamicActors(class'BallSpikedAttachment', BSA)
		{
			BSA.SetCollisionSize(100.0, 100.0);
			BSA.SetPropertyText("CollideType", "CT_Cylinder");
			
			iAppliedCount++;
		}
	}
	
	if(PatchesToApply.bFixProjectorsBreakingOnLoadGame)
	{
		iAppliedCount++;
	}
	
	if(PatchesToApply.bFixDefaultEmitterOpacities)
	{
		foreach DynamicActors(class'Emitter', E)
		{
			for(i = 0; i < E.Emitters.Length; i++)
			{
				if(E.IsA('Small_Fire') && E.Emitters.Length >= 4 && E.Emitters[1].Texture == Texture'Shrek2_EFX.Gen_Particle.smk1')
				{
					sOpacity = GetModifiedSmallFireEmitterDefaultOpacities(i);
				}
				else
				{
					sOpacity = GetDefaultEmitterOpacityByClass(E.Class, i);
				}
				
				if(sOpacity != "")
				{
					E.Emitters[i].SetPropertyText("Opacity", sOpacity);
					
					iAppliedCount++;
				}
			}
		}
	}
	
	if(PatchesToApply.bAssignDefaultMaterialTypesForMaterials)
	{
		if(OptionalOptions.bDefaultMaterialTypes)
		{
			DefaultAllStockMaterialTypes();
			
			iAppliedCount++;
		}
		
		for(i = 0; i < OptionalOptions.MaterialActions.Length; i++)
		{
			OptionalOptions.MaterialActions[i].Material.SetPropertyText("MaterialType", GetMaterialTypeString(OptionalOptions.MaterialActions[i].MaterialType));
			
			iAppliedCount++;
		}
	}
	
	if(PatchesToApply.bMoverWithTagUsesSpringGlideType)
	{
		foreach DynamicActors(class'Mover', M)
		{
			if(U.IsNameInNameArray(M.Tag, OptionalOptions.SpringGlideTypeMoverTags))
			{
				M.SetPropertyText("MoverGlideType", "MV_SpringByTime");
				
				iAppliedCount++;
			}
		}
	}
	
	if(PatchesToApply.bAssignLevelID)
	{
		iAppliedCount++;
	}
	
	if(CosmeticPatchesToApply.bDisablePersistentStore)
	{
		foreach DynamicActors(class'PersistentStore', PS)
		{
			U.FancyDestroy(PS);
			
			iAppliedCount++;
		}
	}
	
	if(CosmeticPatchesToApply.bFixCheatManager)
	{
		iAppliedCount++;
	}
	
	if(CosmeticPatchesToApply.bFixHealthPersistence)
	{
		iAppliedCount++;
	}
	
	HackPickupShading(!CosmeticPatchesToApply.bAddPickupShading);
	
	if(CosmeticPatchesToApply.bAddPickupShading)
	{
		iAppliedCount++;
	}
	
	if(iAppliedCount > 0)
	{
		Log(class'MVersion'.default.ModName @ class'MVersion'.default.Version @ "-- This level has been patched with MPatcher, made by Master_64 --" @ string(iAppliedCount) @ "patches applied");
	}
}

function string GetMaterialTypeString(KWGame.EMaterialType MaterialType) // Returns a MaterialType from a string
{
	switch(MaterialType)
	{
		case MTYPE_None:
			return "MTYPE_None";
			
			break;
		case MTYPE_Stone:
			return "MTYPE_Stone";
			
			break;
		case MTYPE_Rug:
			return "MTYPE_Rug";
			
			break;
		case MTYPE_Wood:
			return "MTYPE_Wood";
			
			break;
		case MTYPE_Cave:
			return "MTYPE_Cave";
			
			break;
		case MTYPE_Cloud:
			return "MTYPE_Cloud";
			
			break;
		case MTYPE_Wet:
			return "MTYPE_Wet";
			
			break;
		case MTYPE_Grass:
			return "MTYPE_Grass";
			
			break;
		case MTYPE_Metal:
			return "MTYPE_Metal";
			
			break;
		case MTYPE_Dirt:
			return "MTYPE_Dirt";
			
			break;
		case MTYPE_Hay:
			return "MTYPE_Hay";
			
			break;
		case MTYPE_Leaf:
			return "MTYPE_Leaf";
			
			break;
		case MTYPE_Snow:
			return "MTYPE_Snow";
			
			break;
		case MTYPE_Sand:
			return "MTYPE_Sand";
			
			break;
		case MTYPE_QuickSand:
			return "MTYPE_QuickSand";
			
			break;
		case MTYPE_Mud:
			return "MTYPE_Mud";
			
			break;
		case MTYPE_WetCanJump:
			return "MTYPE_WetCanJump";
			
			break;
	}
}

function KWGame.EMaterialType GetMaterialTypeByInt(int I) // Returns a MaterialType by an int
{
	switch(I)
	{
		case 0:
			return MTYPE_None;
			
			break;
		case 1:
			return MTYPE_Stone;
			
			break;
		case 2:
			return MTYPE_Rug;
			
			break;
		case 3:
			return MTYPE_Wood;
			
			break;
		case 4:
			return MTYPE_Cave;
			
			break;
		case 5:
			return MTYPE_Cloud;
			
			break;
		case 6:
			return MTYPE_Wet;
			
			break;
		case 7:
			return MTYPE_Grass;
			
			break;
		case 8:
			return MTYPE_Metal;
			
			break;
		case 9:
			return MTYPE_Dirt;
			
			break;
		case 10:
			return MTYPE_Hay;
			
			break;
		case 11:
			return MTYPE_Leaf;
			
			break;
		case 12:
			return MTYPE_Snow;
			
			break;
		case 13:
			return MTYPE_Sand;
			
			break;
		case 14:
			return MTYPE_QuickSand;
			
			break;
		case 15:
			return MTYPE_Mud;
			
			break;
		case 16:
			return MTYPE_WetCanJump;
			
			break;
	}
}

function HackPickupShading(bool B) // Applies the pickup shading hack if B=false
{
	local int i;
	
	// Using Set commands to simplify code, required to initially see the hack work
	if(B)
	{
		U.CC("Set SHPickupUnlit bUnlit True");
		U.CC("Set SHPickupUnlit AmbientGlow 150");
	}
	else
	{
		U.CC("Set SHPickupUnlit bUnlit False");
		U.CC("Set SHPickupUnlit AmbientGlow 254");
	}
	
	for(i = 0; i < PickupClasses.Length; i++)
	{
		PickupClasses[i].default.bUnlit = B;
		
		if(B)
		{
			PickupClasses[i].default.AmbientGlow = 150;
		}
		else
		{
			PickupClasses[i].default.AmbientGlow = 254;
		}
	}
}

function string GetDefaultEmitterOpacityByClass(class C, int I) // Returns the default emitter opacity by a class and an index
{
	switch(C)
	{
		case class'Apple_Explo':
		case class'Atrium_Drip':
		case class'Env_BLight':
		case class'Env_RLight':
		case class'Env_YLight':
		case class'Pumk_Bang':
			if(I == 0)
			{
				return "0.25";
			}
			
			break;
		case class'Apple_Rot':
		case class'Crate_Burst':
		case class'Crate_Explod':
		case class'Flower_Poisn':
		case class'Health_Explod':
		case class'Milk_Splat':
		case class'Mush2_Bang':
		case class'Mush_Bang':
		case class'Poison_Cloud':
		case class'Potbot_Explo':
		case class'Potbot_Explod':
		case class'Rock_Bang':
		case class'Vent_Water_warning':
		case class'bars_explode':
		case class'celldoor_explode':
			if(I == 0)
			{
				return "0.8";
			}
			
			break;
		case class'Arch_Explo':
		case class'Candle_Flame':
		case class'Env_Torch':
		case class'FGM_Spell1_C':
		case class'Pdoor_Explo':
		case class'Punch_Donkey':
		case class'Punch_PIB':
		case class'Punch_Shrek':
		case class'Shrek_Slide':
		case class'Small_Torch':
		case class'Tree_Rise':
		case class'Vent_Flame_warning':
			if(I == 0)
			{
				return "0.75";
			}
			
			break;
		case class'Bellow_Blow':
		case class'Ice_Bang':
		case class'Logs_Hit':
		case class'Milk_Gun':
			if(I == 0)
			{
				return "0.45";
			}
			
			break;
		case class'Blue_Beam':
			if(I == 0)
			{
				return "0.6";
			}
			else if(I == 1)
			{
				return "0.8";
			}
			
			break;
		case class'Body_Slam':
			if(I == 0)
			{
				return "0.55";
			}
			else if(I == 1)
			{
				return "0.4";
			}
			
			break;
		case class'Bounce_A':
		case class'Bounce_B':
		case class'Bounce_C':
		case class'Env_Alarm':
			if(I == 1)
			{
				return "0.5";
			}
			
			break;
		case class'Briar_Break':
			if(I == 1)
			{
				return "0.45";
			}
			
			break;
		case class'Cherry_Bomb':
			if(I == 1)
			{
				return "0.86";
			}
			
			break;
		case class'Cherry_Trail':
		case class'Nut_Trail':
		case class'Pumk_Bang_Giant':
		case class'Rock_Fall':
		case class'WaterRipples':
		case class'sewerfall':
		case class'swamp_mist':
		case class'swampfall':
			if(I == 0)
			{
				return "0.2";
			}
			
			break;
		case class'Cloth_Tear':
		case class'Grnd_Impact':
			if(I == 0)
			{
				return "0.1";
			}
			
			break;
		case class'Creature_Explode':
			if(I == 1)
			{
				return "0.3";
			}
			else if(I == 2)
			{
				return "0.4";
			}
			
			break;
		case class'Donkey_plow':
			if(I == 0)
			{
				return "0.7";
			}
			else if(I == 2)
			{
				return "0.8";
			}
			
			break;
		case class'Dust_Ambient':
		case class'Health_Twirl':
			if(I == 0)
			{
				return "0.4";
			}
			
			break;
		case class'Dust_Fall':
		case class'Potion_Love':
		case class'Potion_Love_tree':
		case class'Potion_Sleep':
		case class'Potion_Sleep_tree':
		case class'Potion_Strngth':
		case class'Tram_Explo':
			if(I == 0)
			{
				return "0.85";
			}
			
			break;
		case class'Env_FGMgasA':
		case class'Env_FGMgasB':
		case class'FGM_Gas':
		case class'Steamroom_Steam':
			if(I == 0 || I == 1)
			{
				return "0.7";
			}
			
			break;
		case class'FGM_Explode':
			if(I == 0)
			{
				return "0.7";
			}
			else if(I == 1)
			{
				return "0.3";
			}
			else if(I == 4)
			{
				return "0.5";
			}
			
			break;
		case class'FGM_Spell1_A':
			if(I == 0)
			{
				return "0.8";
			}
			else if(I == 2)
			{
				return "0.75";
			}
			
			break;
		case class'FGM_Spell1_B':
		case class'Milk_Spray':
		case class'Nut_Explo':
		case class'Pig_Wood':
		case class'Platform_Steam':
		case class'Rain_Ambient':
		case class'sewer_mist':
		case class'waterstreak_ribbon':
			if(I == 0)
			{
				return "0.5";
			}
			
			break;
		case class'FGM_Spell2_A':
			if(I == 1)
			{
				return "0.5";
			}
			else if(I == 2)
			{
				return "0.35";
			}
			
			break;
		case class'FGM_Spell3_A':
			if(I == 1)
			{
				return "0.85";
			}
			
			break;
		case class'Fireworks':
			if(I == 2)
			{
				return "0.7";
			}
			
			break;
		case class'Flower_Spray':
		case class'Vent_Flame':
			if(I == 0)
			{
				return "0.8";
			}
			else if(I == 1)
			{
				return "0.75";
			}
			
			break;
		case class'Ground_Splat':
			if(I == 0)
			{
				return "0.55";
			}
			
			break;
		case class'Handsome_plow':
		case class'Vent_Steam':
		case class'Water_Smoke':
			if(I == 0)
			{
				return "0.7";
			}
			
			break;
		case class'LPotion_A':
		case class'LPotion_B':
			if(I == 0)
			{
				return "0.8";
			}
			else if(I == 1)
			{
				return "0.6";
			}
			
			break;
		case class'Milk_mist':
			if(I == 0 || I == 1)
			{
				return "0.3";
			}
			
			break;
		case class'PIB_Tornado':
			if(I == 0)
			{
				return "0.65";
			}
			else if(I == 2)
			{
				return "0.85";
			}
			
			break;
		case class'Pig_Straw':
		case class'hottub_mist':
			if(I == 0 || I == 1)
			{
				return "0.5";
			}
			
			break;
		case class'Potbot_Static':
			if(I == 0)
			{
				return "0.9";
			}
			else if(I == 1)
			{
				return "0.8";
			}
			
			break;
		case class'Potion_Invisible':
		case class'Potion_Shrink':
		case class'Potion_Shrinkall':
		case class'Tree_Explo':
			if(I == 0)
			{
				return "0.6";
			}
			
			break;
		case class'Potion_Mist':
		case class'Potion_Misty':
			if(I == 0)
			{
				return "0.25";
			}
			else if(I == 1)
			{
				return "0.3";
			}
			
			break;
		case class'Rain_Storm':
		case class'Small_Fire':
			if(I == 0)
			{
				return "0.3";
			}
			
			break;
		case class'Regress_Transform':
			if(I == 0 || I == 3)
			{
				return "0.7";
			}
			else if(I == 1)
			{
				return "0.4";
			}
			else if(I == 2)
			{
				return "0.5";
			}
			
			break;
		case class'SPotion_A':
		case class'SPotion_B':
			if(I == 0)
			{
				return "0.8";
			}
			else if(I == 1)
			{
				return "0.5";
			}
			
			break;
		case class'Shower_Drip':
			if(I == 0)
			{
				return "0.3";
			}
			if(I == 1)
			{
				return "0.4";
			}
			
			break;
		case class'Small_Drip':
			if(I == 1)
			{
				return "0.25";
			}
			
			break;
		case class'Steed_plow':
			if(I == 0)
			{
				return "0.7";
			}
			else if(I == 2)
			{
				return "0.8";
			}
			
			break;
		case class'Torch_Burn':
			if(I == 0)
			{
				return "0.8";
			}
			else if(I == 1)
			{
				return "0.45";
			}
			else if(I == 2)
			{
				return "0.4";
			}
			
			break;
		case class'Vent_Slime':
		case class'Vent_Water':
			if(I == 1)
			{
				return "0.8";
			}
			
			break;
		case class'WaterSpout':
			if(I == 2)
			{
				return "0.75";
			}
			
			break;
		case class'WaterSpout_Cut':
			if(I == 2)
			{
				return "0.2";
			}
			
			break;
		case class'splash':
			if(I == 0 || I == 1)
			{
				return "0.5";
			}
			else if(I == 2)
			{
				return "0.3";
			}
			
			break;
	}
	
	return "";
}

function string GetModifiedSmallFireEmitterDefaultOpacities(int I) // Returns the default emitter opacities for the modified Small_Fire emitter used in stock levels
{
	switch(I)
	{
		case 0:
			return "0.75";
			
			break;
		case 1:
			return "0.45";
			
			break;
		case 2:
			return "0.5";
			
			break;
		case 3:
			return "0.4";
			
			break;
		default:
			return "";
			
			break;
	}
}

function DefaultAllStockMaterialTypes() // Defaults the MaterialTypes of all stock materials used for all main levels
{
	local int i;
	local array<MaterialStruct> MSs;
	
	// Material types that are assigned
	GetMat(MSs, "1_Shreks_Swamp_Tex.tree_swamp_willow", 3);
	GetMat(MSs, "1_Shreks_Swamp_Tex.tree_bark_1", 3);
	GetMat(MSs, "1_Shreks_Swamp_Tex.plant_aloe", 7);
	GetMat(MSs, "1_Shreks_Swamp_Tex.punch_frame", 3);
	GetMat(MSs, "1_Shreks_Swamp_Tex.Rock", 1);
	GetMat(MSs, "1_Shreks_Swamp_Tex.rotting_tree_1", 3);
	GetMat(MSs, "1_Shreks_Swamp_Tex.Ground_medium", 9);
	GetMat(MSs, "1_Shreks_Swamp_Tex.gravel", 6);
	GetMat(MSs, "1_Shreks_Swamp_Tex.Sign_Back_off", 3);
	GetMat(MSs, "1_Shreks_Swamp_Tex.Sign_beware_ogres", 3);
	GetMat(MSs, "1_Shreks_Swamp_Tex.Log_Bridge", 3);
	GetMat(MSs, "1_Shreks_Swamp_Tex.outhouse", 3);
	GetMat(MSs, "1_Shreks_Swamp_Tex.spanish_moss", 2);
	GetMat(MSs, "1_Shreks_Swamp_Tex.Ground_Mud", 15);
	GetMat(MSs, "1_Shreks_Swamp_Tex.Home_tree2", 3);
	GetMat(MSs, "1_Shreks_Swamp_Tex.Home_tree1", 3);
	GetMat(MSs, "1_Shreks_Swamp_Tex.Home_planks", 3);
	GetMat(MSs, "1_Shreks_Swamp_Tex.Home_door", 3);
	GetMat(MSs, "1_Shreks_Swamp_Tex.sign_stayout", 3);
	GetMat(MSs, "1_Shreks_Swamp_Tex.grnd_grass", 7);
	GetMat(MSs, "1_Shreks_Swamp_Tex.water_material", 6);
	GetMat(MSs, "2_Carriage_Hijack_Tex.grass_weeds", 7);
	GetMat(MSs, "2_Carriage_Hijack_Tex.grass_tall", 7);
	GetMat(MSs, "2_Carriage_Hijack_Tex.bush_1", 11);
	GetMat(MSs, "2_Carriage_Hijack_Tex.Tree_redwood_rotten", 3);
	GetMat(MSs, "2_Carriage_Hijack_Tex.fern_2", 11);
	GetMat(MSs, "2_Carriage_Hijack_Tex.rock_throwable", 1);
	GetMat(MSs, "2_Carriage_Hijack_Tex.tree_bark_1", 3);
	GetMat(MSs, "2_Carriage_Hijack_Tex.fence", 3);
	GetMat(MSs, "2_Carriage_Hijack_Tex.rock_moss", 2);
	GetMat(MSs, "2_Carriage_Hijack_Tex.Cart", 10);
	GetMat(MSs, "2_Carriage_Hijack_Tex.grass_leaves", 7);
	GetMat(MSs, "2_Carriage_Hijack_Tex.dirt", 9);
	GetMat(MSs, "2_Carriage_Hijack_Tex.ground_leaves", 7);
	GetMat(MSs, "2_Carriage_Hijack_Tex.Log", 3);
	GetMat(MSs, "3_The_Hunt_Tex.water_2", 6);
	GetMat(MSs, "3_The_Hunt_Tex.bush_1", 11);
	GetMat(MSs, "3_The_Hunt_Tex.red_bush", 11);
	GetMat(MSs, "3_The_Hunt_Tex.fern_2", 11);
	GetMat(MSs, "3_The_Hunt_Tex.grass_tall", 7);
	GetMat(MSs, "3_The_Hunt_Tex.water_1", 6);
	GetMat(MSs, "3_The_Hunt_Tex.pib_tree_top", 11);
	GetMat(MSs, "3_The_Hunt_Tex.grass_leaves", 7);
	GetMat(MSs, "3_The_Hunt_Tex.dirt_leaves", 9);
	GetMat(MSs, "3_The_Hunt_Tex.rock_moss", 1);
	GetMat(MSs, "3_The_Hunt_Tex.fence", 3);
	GetMat(MSs, "3_The_Hunt_Tex.beans_hay", 10);
	GetMat(MSs, "3_The_Hunt_Tex.flower_patch_blue", 7);
	GetMat(MSs, "3_The_Hunt_Tex.bridge_2", 3);
	GetMat(MSs, "3_The_Hunt_Tex.Cart", 10);
	GetMat(MSs, "3_The_Hunt_Tex.rock_throwable", 1);
	GetMat(MSs, "3_The_Hunt_Tex.chair", 3);
	GetMat(MSs, "3_The_Hunt_Tex.camp_tent", 7);
	GetMat(MSs, "3_The_Hunt_Tex.campfire", 1);
	GetMat(MSs, "3_The_Hunt_Tex.Large_Arrow", 9);
	GetMat(MSs, "3_The_Hunt_Tex.wood_spike", 3);
	GetMat(MSs, "3_The_Hunt_Tex.pib_tree", 3);
	GetMat(MSs, "3_The_Hunt_Tex.cauldron", 8);
	GetMat(MSs, "4_fgm_office_tx.floor_1", 1);
	GetMat(MSs, "4_FGM_PIB_Tex.potion_river_1", 6);
	GetMat(MSs, "4_FGM_PIB_Tex.potion_lab_wall", 1);
	GetMat(MSs, "4_FGM_PIB_Tex.potion_lab_floor", 1);
	GetMat(MSs, "4_FGM_PIB_Tex.potion_lab_ceiling", 1);
	GetMat(MSs, "4_FGM_PIB_Tex.locker-room_floor", 3);
	GetMat(MSs, "4_FGM_PIB_Tex.exit_stairs_floor_2", 1);
	GetMat(MSs, "4_FGM_PIB_Tex.pipe_up", 8);
	GetMat(MSs, "4_FGM_PIB_Tex.broom_closet_wall", 3);
	GetMat(MSs, "4_FGM_PIB_Tex.broom_closet_floor", 3);
	GetMat(MSs, "4_FGM_PIB_Tex.locker_room_wall", 1);
	GetMat(MSs, "4_FGM_PIB_Tex.locker_room_ceiling", 1);
	GetMat(MSs, "4_FGM_PIB_Tex.hallway_wall", 1);
	GetMat(MSs, "4_FGM_PIB_Tex.hallway_floor", 1);
	GetMat(MSs, "4_FGM_PIB_Tex.potion_room_wall_1", 1);
	GetMat(MSs, "4_FGM_PIB_Tex.exit-stairs_wall", 1);
	GetMat(MSs, "4_FGM_PIB_Tex.exit_stairs_floor", 1);
	GetMat(MSs, "4_FGM_PIB_Tex.broom_closet_ceiling", 3);
	GetMat(MSs, "4_FGM_PIB_Tex.window1", 3);
	GetMat(MSs, "4_FGM_PIB_Tex.potionrm_floor", 1);
	GetMat(MSs, "4_FGM_PIB_Tex.elevat_new1a", 8);
	GetMat(MSs, "4_FGM_PIB_Tex.lockers", 3);
	GetMat(MSs, "4_FGM_PIB_Tex.wood_support", 3);
	GetMat(MSs, "4_FGM_PIB_Tex.pop_machine", 2);
	GetMat(MSs, "4_FGM_PIB_Tex.potn_extrct", 3);
	GetMat(MSs, "4_FGM_PIB_Tex.boiler", 8);
	GetMat(MSs, "4_FGM_PIB_Tex.pipe_shimmy_2_arrows", 8);
	GetMat(MSs, "4_FGM_PIB_Tex.elevat_new1", 1);
	GetMat(MSs, "4_FGM_PIB_Tex.elevat_new2", 8);
	GetMat(MSs, "4_FGM_PIB_Tex.map_tile", 1);
	GetMat(MSs, "6_Hamlet_Tex.water_2", 6);
	GetMat(MSs, "6_Hamlet_Tex.water_1", 6);
	GetMat(MSs, "6_Hamlet_Tex.rock_throwable", 1);
	GetMat(MSs, "6_Hamlet_Tex.pib_tree", 3);
	GetMat(MSs, "7_Prison_Donkey_Tex.water_sewer_death_aplha", 6);
	GetMat(MSs, "7_Prison_Donkey_Tex.water_sewer_death", 6);
	GetMat(MSs, "7_Prison_Donkey_Tex.water_sewer_clean_alpha", 6);
	GetMat(MSs, "7_Prison_Donkey_Tex.floor_metal", 8);
	GetMat(MSs, "7_Prison_Donkey_Tex.pipeinside", 8);
	GetMat(MSs, "7_Prison_Donkey_Tex.water", 6);
	GetMat(MSs, "7_Prison_Donkey_Tex.vent_inside", 8);
	GetMat(MSs, "7_Prison_Donkey_Tex.water_sewer_clean", 6);
	GetMat(MSs, "8_Prison_PIB_Tex.water_sewer_clean", 6);
	GetMat(MSs, "8_Prison_PIB_Tex.platform_junk", 7);
	GetMat(MSs, "8_Prison_PIB_Tex.water_sewer_clean_alpha", 6);
	GetMat(MSs, "8_Prison_PIB_Tex.platform_floating", 8);
	GetMat(MSs, "8_Prison_PIB_Tex.PIB_Rat_Stone", 1);
	GetMat(MSs, "8_Prison_PIB_Tex.wet_brick", 16);
	GetMat(MSs, "10_Castle_Siege_Tex.milk_river", 6);
	GetMat(MSs, "10_Castle_Siege_Tex.milk_river_2", 6);
	GetMat(MSs, "10_Castle_Siege_Tex.gate_1", 8);
	GetMat(MSs, "10_Castle_Siege_Tex.tower_doorway", 1);
	GetMat(MSs, "10_Castle_Siege_Tex.Board_Nail", 3);
	GetMat(MSs, "10_Castle_Siege_Tex.grass_1", 7);
	GetMat(MSs, "10_Castle_Siege_Tex.floor_1", 1);
	GetMat(MSs, "10_Castle_Siege_Tex.dirt", 9);
	GetMat(MSs, "10_Castle_Siege_Tex.railroad", 3);
	GetMat(MSs, "10_Castle_Siege_Tex.castle_fence", 1);
	GetMat(MSs, "10_Castle_Siege_Tex.Wood_CastleGate", 3);
	GetMat(MSs, "10_Castle_Siege_Tex.bridge_drop", 3);
	GetMat(MSs, "10_Castle_Siege_Tex.railroad_turn", 3);
	GetMat(MSs, "10_Castle_Siege_Tex.fountain_base", 7);
	GetMat(MSs, "11_FGM_Battle_Tex.sidewalk_trim", 1);
	GetMat(MSs, "11_FGM_Battle_Tex.hallway_marble_floor", 1);
	GetMat(MSs, "11_FGM_Battle_Tex.hallway_rug", 2);
	GetMat(MSs, "11_FGM_Battle_Tex.steps", 1);
	GetMat(MSs, "11_FGM_Battle_Tex.hallway_brick_wall", 1);
	GetMat(MSs, "11_FGM_Battle_Tex.bed", 2);
	GetMat(MSs, "11_FGM_Battle_Tex.Stonelite_Castle", 1);
	GetMat(MSs, "11_FGM_Battle_Tex.brick_ring_2", 1);
	GetMat(MSs, "11_FGM_Battle_Tex.Wood_CastleGate", 3);
	GetMat(MSs, "11_FGM_Battle_Tex.brick_ring", 1);
	GetMat(MSs, "11_FGM_Battle_Tex.bush_ring", 11);
	GetMat(MSs, "11_FGM_Battle_Tex.hallway_ceiling", 1);
	GetMat(MSs, "11_FGM_Battle_Tex.stage_brick", 1);
	GetMat(MSs, "11_FGM_Battle_Tex.grass_1", 7);
	GetMat(MSs, "11_FGM_Battle_Tex.hallway_doorway_arch_sm_door", 3);
	GetMat(MSs, "11_FGM_Battle_Tex.bush_round", 11);
	GetMat(MSs, "11_FGM_Battle_Tex.bush_sq", 11);
	GetMat(MSs, "11_FGM_Battle_Tex.food", 7);
	GetMat(MSs, "11_FGM_Battle_Tex.piano", 3);
	GetMat(MSs, "11_FGM_Battle_Tex.piano_chair", 3);
	GetMat(MSs, "11_FGM_Battle_Tex.piano_rug", 2);
	GetMat(MSs, "11_FGM_Battle_Tex.stage_front", 1);
	GetMat(MSs, "11_FGM_Battle_Tex.stage_green_arch", 11);
	GetMat(MSs, "11_FGM_Battle_Tex.stage_fence", 1);
	GetMat(MSs, "11_FGM_Battle_Tex.column_4", 1);
	GetMat(MSs, "11_FGM_Battle_Tex.column_3", 1);
	GetMat(MSs, "11_FGM_Battle_Tex.column_2", 1);
	GetMat(MSs, "11_FGM_Battle_Tex.bush_wall", 11);
	GetMat(MSs, "11_FGM_Battle_Tex.column_1", 1);
	GetMat(MSs, "11_FGM_Battle_Tex.bush_orange_1", 11);
	GetMat(MSs, "Beanstalk.Environment.barn_patch", 10);
	GetMat(MSs, "Beanstalk.Environment.farm_house_2", 3);
	GetMat(MSs, "Beanstalk.Environment.beans_hay", 10);
	GetMat(MSs, "Beanstalk.Environment.water", 6);
	GetMat(MSs, "Beanstalk.Environment.bridge", 3);
	GetMat(MSs, "Beanstalk.Environment.rock_patch", 1);
	GetMat(MSs, "Beanstalk.Environment.Rock", 1);
	GetMat(MSs, "Beanstalk.Environment.dirt", 9);
	GetMat(MSs, "Beanstalk.Environment.grass_1", 7);
	GetMat(MSs, "Beanstalk.Environment.grass_2", 7);
	
	// Material types that are not assigned
	GetMat(MSs, "1_Shreks_Swamp_Tex.sky_clouds");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Commerical_Room.pastels1");
	GetMat(MSs, "1_Shreks_Swamp_Tex.water_base");
	GetMat(MSs, "1_Shreks_Swamp_Tex.tree_swamp_willow_leaves");
	GetMat(MSs, "1_Shreks_Swamp_Tex.plant_purp");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Panning_Water1");
	GetMat(MSs, "1_Shreks_Swamp_Tex.water_enlarged");
	GetMat(MSs, "1_Shreks_Swamp_Tex.water_base_noleaves");
	GetMat(MSs, "1_Shreks_Swamp_Tex.tree_5");
	GetMat(MSs, "1_Shreks_Swamp_Tex.combined_water2");
	GetMat(MSs, "1_Shreks_Swamp_Tex.combined_water");
	GetMat(MSs, "1_Shreks_Swamp_Tex.swamp_envmap");
	GetMat(MSs, "1_Shreks_Swamp_Tex.swamp_cubemap");
	GetMat(MSs, "1_Shreks_Swamp_Tex.vine_deco_1");
	GetMat(MSs, "1_Shreks_Swamp_Tex.panning_water2");
	GetMat(MSs, "1_Shreks_Swamp_Tex.grass_tall_flowers");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Grass_hanging");
	GetMat(MSs, "1_Shreks_Swamp_Tex.grass_tall");
	GetMat(MSs, "1_Shreks_Swamp_Tex.cattail_LP2");
	GetMat(MSs, "1_Shreks_Swamp_Tex.cattail_LP1");
	GetMat(MSs, "1_Shreks_Swamp_Tex.bush_swamp");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Commerical_Room.pastels6");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Commerical_Room.pastels2");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Commerical_Room.pastels3");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Commerical_Room.pastels5");
	GetMat(MSs, "1_Shreks_Swamp_Tex.plant_lt_green");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Commerical_Room.pastels4");
	GetMat(MSs, "1_Shreks_Swamp_Tex.tree_6LP2");
	GetMat(MSs, "1_Shreks_Swamp_Tex.tree_6LP1");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Tree_redwood_LP2");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Tree_redwood_LP1");
	GetMat(MSs, "1_Shreks_Swamp_Tex.cattail1_fix");
	GetMat(MSs, "1_Shreks_Swamp_Tex.cattail2_fix");
	GetMat(MSs, "1_Shreks_Swamp_Tex.grass_tall_fix");
	GetMat(MSs, "1_Shreks_Swamp_Tex.grass_hanging_alphafix");
	GetMat(MSs, "1_Shreks_Swamp_Tex.moss_hang");
	GetMat(MSs, "1_Shreks_Swamp_Tex.rock_column_top");
	GetMat(MSs, "1_Shreks_Swamp_Tex.overhang");
	GetMat(MSs, "1_Shreks_Swamp_Tex.rock_column");
	GetMat(MSs, "1_Shreks_Swamp_Tex.lilypad");
	GetMat(MSs, "1_Shreks_Swamp_Tex.grasss_tall_flowers_fix");
	GetMat(MSs, "1_Shreks_Swamp_Tex.bridge_swamp");
	GetMat(MSs, "1_Shreks_Swamp_Tex.tree5_fix");
	GetMat(MSs, "1_Shreks_Swamp_Tex.stump_jump");
	GetMat(MSs, "1_Shreks_Swamp_Tex.vine_deco_fix");
	GetMat(MSs, "1_Shreks_Swamp_Tex.fern_2");
	GetMat(MSs, "1_Shreks_Swamp_Tex.dock_swamp");
	GetMat(MSs, "1_Shreks_Swamp_Tex.treeline_swamp");
	GetMat(MSs, "1_Shreks_Swamp_Tex.log_end");
	GetMat(MSs, "1_Shreks_Swamp_Tex.bush_swamp_fix");
	GetMat(MSs, "1_Shreks_Swamp_Tex.plantit_green_fix");
	GetMat(MSs, "1_Shreks_Swamp_Tex.redwood_treering");
	GetMat(MSs, "1_Shreks_Swamp_Tex.old_paper");
	GetMat(MSs, "1_Shreks_Swamp_Tex.obstacle_course_sign");
	GetMat(MSs, "1_Shreks_Swamp_Tex.log_2");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Log");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Home_combined");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Home_blur");
	GetMat(MSs, "1_Shreks_Swamp_Tex.old_pop");
	GetMat(MSs, "1_Shreks_Swamp_Tex.old_pzabox");
	GetMat(MSs, "1_Shreks_Swamp_Tex.old_pop2");
	GetMat(MSs, "1_Shreks_Swamp_Tex.cliff_side");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Commerical_Room.FGMLogo");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Willow_Leaves_Fixed");
	GetMat(MSs, "1_Shreks_Swamp_Tex.rope_bridge");
	GetMat(MSs, "1_Shreks_Swamp_Tex.swampwater_final");
	GetMat(MSs, "1_Shreks_Swamp_Tex.plant_purp_fix");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Commerical_Room.pastel_switch");
	GetMat(MSs, "1_Shreks_Swamp_Tex.tree_Lp1_fix");
	GetMat(MSs, "1_Shreks_Swamp_Tex.tree_lp2_fix");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Commerical_Room.tree6_LP1_fix");
	GetMat(MSs, "1_Shreks_Swamp_Tex.Commerical_Room.tree6_lp2_fix");
	GetMat(MSs, "2_Carriage_Hijack_Tex.tree_5");
	GetMat(MSs, "2_Carriage_Hijack_Tex.onioncarraige_tx");
	GetMat(MSs, "2_Carriage_Hijack_Tex.TreePineQuad1_SM");
	GetMat(MSs, "2_Carriage_Hijack_Tex.Main_Clouds");
	GetMat(MSs, "2_Carriage_Hijack_Tex.pinetree");
	GetMat(MSs, "2_Carriage_Hijack_Tex.Tree_redwood");
	GetMat(MSs, "2_Carriage_Hijack_Tex.TreePineBoard3_SM");
	GetMat(MSs, "2_Carriage_Hijack_Tex.bush_red");
	GetMat(MSs, "2_Carriage_Hijack_Tex.redwood_tree");
	GetMat(MSs, "2_Carriage_Hijack_Tex.nightsky_cloud");
	GetMat(MSs, "2_Carriage_Hijack_Tex.tree_2");
	GetMat(MSs, "2_Carriage_Hijack_Tex.light_green_bush");
	GetMat(MSs, "2_Carriage_Hijack_Tex.curtain");
	GetMat(MSs, "2_Carriage_Hijack_Tex.carriage1_fix");
	GetMat(MSs, "2_Carriage_Hijack_Tex.treePineQuad1_fix");
	GetMat(MSs, "2_Carriage_Hijack_Tex.cliff_pan");
	GetMat(MSs, "2_Carriage_Hijack_Tex.pinetree_fix");
	GetMat(MSs, "2_Carriage_Hijack_Tex.tree_redwood_fix");
	GetMat(MSs, "2_Carriage_Hijack_Tex.moon");
	GetMat(MSs, "2_Carriage_Hijack_Tex.bush_red_fix");
	GetMat(MSs, "2_Carriage_Hijack_Tex.fern_2_fix");
	GetMat(MSs, "2_Carriage_Hijack_Tex.grass_weed_fix");
	GetMat(MSs, "2_Carriage_Hijack_Tex.grass_tall_fix");
	GetMat(MSs, "2_Carriage_Hijack_Tex.light_green_bush_fix");
	GetMat(MSs, "2_Carriage_Hijack_Tex.redwood_rotten_fix");
	GetMat(MSs, "2_Carriage_Hijack_Tex.insideskin");
	GetMat(MSs, "2_Carriage_Hijack_Tex.carriage1");
	GetMat(MSs, "2_Carriage_Hijack_Tex.redwood_tree_fix");
	GetMat(MSs, "2_Carriage_Hijack_Tex.sky_clouds");
	GetMat(MSs, "2_Carriage_Hijack_Tex.Torch");
	GetMat(MSs, "2_Carriage_Hijack_Tex.tree_5_fix");
	GetMat(MSs, "2_Carriage_Hijack_Tex.tree_2_fix");
	GetMat(MSs, "2_Carriage_Hijack_Tex.Cloud_Pan");
	GetMat(MSs, "2_Carriage_Hijack_Tex.bush_1_fix");
	GetMat(MSs, "2_Carriage_Hijack_Tex.2nd_Cloud_pan");
	GetMat(MSs, "2_Carriage_Hijack_Tex.curtain_twosided");
	GetMat(MSs, "2_Carriage_Hijack_Tex.plant_aloe");
	GetMat(MSs, "2_Carriage_Hijack_Tex.tree_pan");
	GetMat(MSs, "3_The_Hunt_Tex.skydome");
	GetMat(MSs, "3_The_Hunt_Tex.hunt_envmap");
	GetMat(MSs, "3_The_Hunt_Tex.vine_deco_1");
	GetMat(MSs, "3_The_Hunt_Tex.bush_red");
	GetMat(MSs, "3_The_Hunt_Tex.canopy_1");
	GetMat(MSs, "3_The_Hunt_Tex.water_waterfall");
	GetMat(MSs, "3_The_Hunt_Tex.redwood_tree_tunnel");
	GetMat(MSs, "3_The_Hunt_Tex.TreePineQuad1_SM");
	GetMat(MSs, "3_The_Hunt_Tex.redwood_tree");
	GetMat(MSs, "3_The_Hunt_Tex.tree_1_leaves");
	GetMat(MSs, "3_The_Hunt_Tex.tree_2");
	GetMat(MSs, "3_The_Hunt_Tex.pumpkinpatch_tx");
	GetMat(MSs, "3_The_Hunt_Tex.water_scale");
	GetMat(MSs, "3_The_Hunt_Tex.pumpkinvine");
	GetMat(MSs, "3_The_Hunt_Tex.hunt_cube");
	GetMat(MSs, "3_The_Hunt_Tex.grass");
	GetMat(MSs, "3_The_Hunt_Tex.rope_stake");
	GetMat(MSs, "3_The_Hunt_Tex.fake_banner");
	GetMat(MSs, "3_The_Hunt_Tex.vine_deco_fix");
	GetMat(MSs, "3_The_Hunt_Tex.Cherry");
	GetMat(MSs, "3_The_Hunt_Tex.sky");
	GetMat(MSs, "3_The_Hunt_Tex.panWater2");
	GetMat(MSs, "3_The_Hunt_Tex.panWater");
	GetMat(MSs, "3_The_Hunt_Tex.haybales");
	GetMat(MSs, "3_The_Hunt_Tex.redwood_tree_fix");
	GetMat(MSs, "3_The_Hunt_Tex.sky_clouds");
	GetMat(MSs, "3_The_Hunt_Tex.bush_1_fix");
	GetMat(MSs, "3_The_Hunt_Tex.grass_tall_fix");
	GetMat(MSs, "3_The_Hunt_Tex.fern_2_fix");
	GetMat(MSs, "3_The_Hunt_Tex.skybox_night_blue");
	GetMat(MSs, "3_The_Hunt_Tex.red_bush_fix");
	GetMat(MSs, "3_The_Hunt_Tex.PIB_log");
	GetMat(MSs, "3_The_Hunt_Tex.tree_1_fix");
	GetMat(MSs, "3_The_Hunt_Tex.tree_2_fix");
	GetMat(MSs, "3_The_Hunt_Tex.pumpkinpatch_fix");
	GetMat(MSs, "3_The_Hunt_Tex.redwood_tunnel_door");
	GetMat(MSs, "3_The_Hunt_Tex.Log");
	GetMat(MSs, "3_The_Hunt_Tex.bush_red_fix");
	GetMat(MSs, "3_The_Hunt_Tex.damn");
	GetMat(MSs, "3_The_Hunt_Tex.redwood_tunnel_fix");
	GetMat(MSs, "3_The_Hunt_Tex.bwheelint_tx");
	GetMat(MSs, "3_The_Hunt_Tex.tree_quad_fix");
	GetMat(MSs, "3_The_Hunt_Tex.skybox_orange");
	GetMat(MSs, "3_The_Hunt_Tex.canopy_1_fix");
	GetMat(MSs, "3_The_Hunt_Tex.vasentable");
	GetMat(MSs, "3_The_Hunt_Tex.blockingwheel_tx");
	GetMat(MSs, "3_The_Hunt_Tex.swampfall_pan");
	GetMat(MSs, "3_The_Hunt_Tex.water_S");
	GetMat(MSs, "3_The_Hunt_Tex.clouds");
	GetMat(MSs, "3_The_Hunt_Tex.swampwater_pan");
	GetMat(MSs, "3_The_Hunt_Tex.signs");
	GetMat(MSs, "3_The_Hunt_Tex.pib_tree_top_fix");
	GetMat(MSs, "3_The_Hunt_Tex.Pumpkinsplat");
	GetMat(MSs, "3_The_Hunt_Tex.Trailer_wrecked");
	GetMat(MSs, "3_The_Hunt_Tex.veggy");
	GetMat(MSs, "3_The_Hunt_Tex.pumpkinvine_fix");
	GetMat(MSs, "4_fgm_office_tx.bookshelf_cover");
	GetMat(MSs, "4_fgm_office_tx.curtain");
	GetMat(MSs, "4_fgm_office_tx.hallway_ceiling_office");
	GetMat(MSs, "4_fgm_office_tx.Wall");
	GetMat(MSs, "4_fgm_office_tx.sm_chairs");
	GetMat(MSs, "4_fgm_office_tx.crystal_ball");
	GetMat(MSs, "4_fgm_office_tx.paintings_lobby_1");
	GetMat(MSs, "4_fgm_office_tx.globe");
	GetMat(MSs, "4_fgm_office_tx.outdoor_shot");
	GetMat(MSs, "4_fgm_office_tx.roof_column");
	GetMat(MSs, "4_fgm_office_tx.ceiling");
	GetMat(MSs, "4_fgm_office_tx.books_cover_fix");
	GetMat(MSs, "4_fgm_office_tx.wall_hallway");
	GetMat(MSs, "4_fgm_office_tx.dresser_2");
	GetMat(MSs, "4_fgm_office_tx.bowl");
	GetMat(MSs, "4_fgm_office_tx.railing");
	GetMat(MSs, "4_fgm_office_tx.fgm_chair");
	GetMat(MSs, "4_fgm_office_tx.fgm_desk");
	GetMat(MSs, "4_fgm_office_tx.art_1");
	GetMat(MSs, "4_fgm_office_tx.wall_arch");
	GetMat(MSs, "4_fgm_office_tx.trim_2");
	GetMat(MSs, "4_fgm_office_tx.art_2");
	GetMat(MSs, "4_fgm_office_tx.roof_round");
	GetMat(MSs, "4_fgm_office_tx.trim");
	GetMat(MSs, "4_fgm_office_tx.recliner");
	GetMat(MSs, "4_fgm_office_tx.book_shelves");
	GetMat(MSs, "4_fgm_office_tx.gold_taps");
	GetMat(MSs, "4_fgm_office_tx.gold_scope");
	GetMat(MSs, "4_fgm_office_tx.Window");
	GetMat(MSs, "4_fgm_office_tx.paintings_lobby_2");
	GetMat(MSs, "4_fgm_office_tx.bookshelf_small");
	GetMat(MSs, "4_fgm_office_tx.curtain_fix");
	GetMat(MSs, "4_FGM_PIB_Tex.gas_rise");
	GetMat(MSs, "4_FGM_PIB_Tex.potspec_envmap");
	GetMat(MSs, "4_FGM_PIB_Tex.HEA_potion");
	GetMat(MSs, "4_FGM_PIB_Tex.flames");
	GetMat(MSs, "4_FGM_PIB_Tex.vent_3");
	GetMat(MSs, "4_FGM_PIB_Tex.fanblade_3");
	GetMat(MSs, "4_FGM_PIB_Tex.fanblade_2");
	GetMat(MSs, "4_FGM_PIB_Tex.fanblade_1");
	GetMat(MSs, "4_FGM_PIB_Tex.gas_rise2");
	GetMat(MSs, "4_FGM_PIB_Tex.vent_2");
	GetMat(MSs, "4_FGM_PIB_Tex.Grate");
	GetMat(MSs, "4_FGM_PIB_Tex.lights_rectangle");
	GetMat(MSs, "4_FGM_PIB_Tex.VatPan1");
	GetMat(MSs, "4_FGM_PIB_Tex.fgm_painting_1");
	GetMat(MSs, "4_FGM_PIB_Tex.bubbles");
	GetMat(MSs, "4_FGM_PIB_Tex.PIBwire_silver");
	GetMat(MSs, "4_FGM_PIB_Tex.Vent");
	GetMat(MSs, "4_FGM_PIB_Tex.conveyorbelt_belt");
	GetMat(MSs, "4_FGM_PIB_Tex.potionspec");
	GetMat(MSs, "4_FGM_PIB_Tex.machine");
	GetMat(MSs, "4_FGM_PIB_Tex.elevator_door");
	GetMat(MSs, "4_FGM_PIB_Tex.frame_fgm");
	GetMat(MSs, "4_FGM_PIB_Tex.door_fgm");
	GetMat(MSs, "4_FGM_PIB_Tex.laser_base");
	GetMat(MSs, "4_FGM_PIB_Tex.Gas_Vent");
	GetMat(MSs, "4_FGM_PIB_Tex.Switch");
	GetMat(MSs, "4_FGM_PIB_Tex.vatpan_FB");
	GetMat(MSs, "4_FGM_PIB_Tex.dress_pipe_2");
	GetMat(MSs, "4_FGM_PIB_Tex.dress_pipe_5");
	GetMat(MSs, "4_FGM_PIB_Tex.light_wall");
	GetMat(MSs, "4_FGM_PIB_Tex.light_wall_bugs");
	GetMat(MSs, "4_FGM_PIB_Tex.GasPan1");
	GetMat(MSs, "4_FGM_PIB_Tex.vent_2_fix");
	GetMat(MSs, "4_FGM_PIB_Tex.elevator_marker_1");
	GetMat(MSs, "4_FGM_PIB_Tex.vent_spray");
	GetMat(MSs, "4_FGM_PIB_Tex.Black");
	GetMat(MSs, "4_FGM_PIB_Tex.light_alarm");
	GetMat(MSs, "4_FGM_PIB_Tex.Flame_Rise 2");
	GetMat(MSs, "4_FGM_PIB_Tex.elevator_frame");
	GetMat(MSs, "4_FGM_PIB_Tex.vent_3_fix");
	GetMat(MSs, "4_FGM_PIB_Tex.hallway_ceiling");
	GetMat(MSs, "4_FGM_PIB_Tex.elevator_wall_1");
	GetMat(MSs, "4_FGM_PIB_Tex.elevator_ceiling");
	GetMat(MSs, "4_FGM_PIB_Tex.elevator_floor");
	GetMat(MSs, "4_FGM_PIB_Tex.exit_stairs_ceiling");
	GetMat(MSs, "4_FGM_PIB_Tex.vent_inside");
	GetMat(MSs, "4_FGM_PIB_Tex.Green River");
	GetMat(MSs, "4_FGM_PIB_Tex.glass");
	GetMat(MSs, "4_FGM_PIB_Tex.poster1");
	GetMat(MSs, "4_FGM_PIB_Tex.light_rectangle_fix");
	GetMat(MSs, "4_FGM_PIB_Tex.container1");
	GetMat(MSs, "4_FGM_PIB_Tex.wheelbarrel_potions");
	GetMat(MSs, "4_FGM_PIB_Tex.Conveyor_move");
	GetMat(MSs, "4_FGM_PIB_Tex.shwr_curtB");
	GetMat(MSs, "4_FGM_PIB_Tex.shwr_curtA");
	GetMat(MSs, "4_FGM_PIB_Tex.sign_5");
	GetMat(MSs, "4_FGM_PIB_Tex.sign_4");
	GetMat(MSs, "4_FGM_PIB_Tex.conveyorbelt_base");
	GetMat(MSs, "4_FGM_PIB_Tex.donkey_switch_fgm");
	GetMat(MSs, "4_FGM_PIB_Tex.gas_rot");
	GetMat(MSs, "4_FGM_PIB_Tex.VatPan2");
	GetMat(MSs, "4_FGM_PIB_Tex.vent_fix");
	GetMat(MSs, "4_FGM_PIB_Tex.HEAlabel");
	GetMat(MSs, "4_FGM_PIB_Tex.grate_fix");
	GetMat(MSs, "4_FGM_PIB_Tex.pipe_up_2_arrows");
	GetMat(MSs, "4_FGM_PIB_Tex.Fan_Spin");
	GetMat(MSs, "4_FGM_PIB_Tex.Bubble_Move");
	GetMat(MSs, "4_FGM_PIB_Tex.fan_frame");
	GetMat(MSs, "4_FGM_PIB_Tex.FGM_Banner");
	GetMat(MSs, "4_FGM_PIB_Tex.bookshelf");
	GetMat(MSs, "4_FGM_PIB_Tex.PIBWire_silver_fix");
	GetMat(MSs, "4_FGM_PIB_Tex.sink");
	GetMat(MSs, "4_FGM_PIB_Tex.HEAwarning");
	GetMat(MSs, "4_FGM_PIB_Tex.burn_mark");
	GetMat(MSs, "4_FGM_PIB_Tex.dress_pipe_1");
	GetMat(MSs, "4_FGM_PIB_Tex.sign_3");
	GetMat(MSs, "4_FGM_PIB_Tex.plastic_crate");
	GetMat(MSs, "4_FGM_PIB_Tex.light_round");
	GetMat(MSs, "4_FGM_PIB_Tex.hea_S");
	GetMat(MSs, "4_FGM_PIB_Tex.key_pad");
	GetMat(MSs, "4_FGM_PIB_Tex.Door");
	GetMat(MSs, "4_FGM_PIB_Tex.locker_bench");
	GetMat(MSs, "4_FGM_PIB_Tex.vending_machine");
	GetMat(MSs, "4_FGM_PIB_Tex.conveyor_belt_flap");
	GetMat(MSs, "4_FGM_PIB_Tex.LanternB");
	GetMat(MSs, "4_FGM_PIB_Tex.large_container");
	GetMat(MSs, "4_FGM_PIB_Tex.Water_Splat");
	GetMat(MSs, "4_FGM_PIB_Tex.fridge");
	GetMat(MSs, "4_FGM_PIB_Tex.Flame_Rise");
	GetMat(MSs, "4_FGM_PIB_Tex.bulletin_board");
	GetMat(MSs, "4_FGM_PIB_Tex.pipe_large");
	GetMat(MSs, "4_FGM_PIB_Tex.table_rectangular");
	GetMat(MSs, "4_FGM_PIB_Tex.poster2");
	GetMat(MSs, "4_FGM_PIB_Tex.shower");
	GetMat(MSs, "4_FGM_PIB_Tex.dress_pipe_6");
	GetMat(MSs, "4_FGM_PIB_Tex.dress_pipe_3");
	GetMat(MSs, "4_FGM_PIB_Tex.sign_1");
	GetMat(MSs, "4_FGM_PIB_Tex.sign_2");
	GetMat(MSs, "4_FGM_PIB_Tex.mop");
	GetMat(MSs, "4_FGM_PIB_Tex.frame");
	GetMat(MSs, "4_FGM_PIB_Tex.elevat_new3");
	GetMat(MSs, "4_FGM_PIB_Tex.fgm_painting_1_fix");
	GetMat(MSs, "4_FGM_PIB_Tex.wheelbarrel_yellow");
	GetMat(MSs, "4_FGM_PIB_Tex.wheelbarrel_wood");
	GetMat(MSs, "4_FGM_PIB_Tex.wheelbarrel_green");
	GetMat(MSs, "4_FGM_PIB_Tex.wheelbarrel_blue");
	GetMat(MSs, "4_FGM_PIB_Tex.bottle_3");
	GetMat(MSs, "4_FGM_PIB_Tex.bottle_2");
	GetMat(MSs, "4_FGM_PIB_Tex.Beam");
	GetMat(MSs, "4_FGM_PIB_Tex.bottle_1");
	GetMat(MSs, "5_FGM_Donkey_Tex.level5");
	GetMat(MSs, "5_FGM_Donkey_Tex.red_bush");
	GetMat(MSs, "6_Hamlet_Tex.redwood_tree_tunnel");
	GetMat(MSs, "6_Hamlet_Tex.TreePineQuad1_SM");
	GetMat(MSs, "6_Hamlet_Tex.tree_1_leaves");
	GetMat(MSs, "6_Hamlet_Tex.tree_swamp_willow_leaves");
	GetMat(MSs, "6_Hamlet_Tex.waterfall");
	GetMat(MSs, "6_Hamlet_Tex.pinetree");
	GetMat(MSs, "6_Hamlet_Tex.webstatic");
	GetMat(MSs, "6_Hamlet_Tex.pib_tree_top");
	GetMat(MSs, "6_Hamlet_Tex.Tree_redwood");
	GetMat(MSs, "6_Hamlet_Tex.fern_2");
	GetMat(MSs, "6_Hamlet_Tex.ROOFBURNED");
	GetMat(MSs, "6_Hamlet_Tex.StrawHouseA");
	GetMat(MSs, "6_Hamlet_Tex.StrawHouseB");
	GetMat(MSs, "6_Hamlet_Tex.vine_deco_1");
	GetMat(MSs, "6_Hamlet_Tex.bush_red");
	GetMat(MSs, "6_Hamlet_Tex.YodaTree");
	GetMat(MSs, "6_Hamlet_Tex.tree_5");
	GetMat(MSs, "6_Hamlet_Tex.redwood_tree");
	GetMat(MSs, "6_Hamlet_Tex.tree_2");
	GetMat(MSs, "6_Hamlet_Tex.bush_1");
	GetMat(MSs, "6_Hamlet_Tex.light_green_bush");
	GetMat(MSs, "6_Hamlet_Tex.red_bush");
	GetMat(MSs, "6_Hamlet_Tex.grass_tall");
	GetMat(MSs, "6_Hamlet_Tex.waterfall2");
	GetMat(MSs, "6_Hamlet_Tex.gbgate2");
	GetMat(MSs, "6_Hamlet_Tex.gbgatewood");
	GetMat(MSs, "6_Hamlet_Tex.sign_noswim");
	GetMat(MSs, "6_Hamlet_Tex.flower_blue");
	GetMat(MSs, "6_Hamlet_Tex.grass_tall_fix");
	GetMat(MSs, "6_Hamlet_Tex.reb_bush_fix");
	GetMat(MSs, "6_Hamlet_Tex.light_green_bush_fix");
	GetMat(MSs, "6_Hamlet_Tex.bush_1_fix");
	GetMat(MSs, "6_Hamlet_Tex.tree2_fix");
	GetMat(MSs, "6_Hamlet_Tex.ruins");
	GetMat(MSs, "6_Hamlet_Tex.redwood_tree_fix");
	GetMat(MSs, "6_Hamlet_Tex.tree_5_fix");
	GetMat(MSs, "6_Hamlet_Tex.rock_moss_2");
	GetMat(MSs, "6_Hamlet_Tex.flower_white");
	GetMat(MSs, "6_Hamlet_Tex.flower_patch");
	GetMat(MSs, "6_Hamlet_Tex.gbwall");
	GetMat(MSs, "6_Hamlet_Tex.gbpiller");
	GetMat(MSs, "6_Hamlet_Tex.YodaHouse");
	GetMat(MSs, "6_Hamlet_Tex.yoda_tree_fix");
	GetMat(MSs, "6_Hamlet_Tex.bush_red_fix");
	GetMat(MSs, "6_Hamlet_Tex.Log_Bridge");
	GetMat(MSs, "6_Hamlet_Tex.bridge");
	GetMat(MSs, "6_Hamlet_Tex.house_window_door");
	GetMat(MSs, "6_Hamlet_Tex.Oldwood");
	GetMat(MSs, "6_Hamlet_Tex.Sign_arrow");
	GetMat(MSs, "6_Hamlet_Tex.beans_hay");
	GetMat(MSs, "6_Hamlet_Tex.bridge_arched");
	GetMat(MSs, "6_Hamlet_Tex.log_deco");
	GetMat(MSs, "6_Hamlet_Tex.barn_roofhole");
	GetMat(MSs, "6_Hamlet_Tex.barn_rafters");
	GetMat(MSs, "6_Hamlet_Tex.barn_walls");
	GetMat(MSs, "6_Hamlet_Tex.barn_walls2");
	GetMat(MSs, "6_Hamlet_Tex.fern_fix");
	GetMat(MSs, "6_Hamlet_Tex.house_roof_hay");
	GetMat(MSs, "6_Hamlet_Tex.house_wall_stucco");
	GetMat(MSs, "6_Hamlet_Tex.gate");
	GetMat(MSs, "6_Hamlet_Tex.flower_pink");
	GetMat(MSs, "6_Hamlet_Tex.rotting_tree_1");
	GetMat(MSs, "6_Hamlet_Tex.gbHouseFoundation");
	GetMat(MSs, "6_Hamlet_Tex.gbHousedoor");
	GetMat(MSs, "6_Hamlet_Tex.frosting");
	GetMat(MSs, "6_Hamlet_Tex.gbHouseroof");
	GetMat(MSs, "6_Hamlet_Tex.gbHousewindowtga");
	GetMat(MSs, "6_Hamlet_Tex.gbHouseWalls");
	GetMat(MSs, "6_Hamlet_Tex.tree_redwood_fix");
	GetMat(MSs, "6_Hamlet_Tex.PumpTop");
	GetMat(MSs, "6_Hamlet_Tex.Mine_Cart");
	GetMat(MSs, "6_Hamlet_Tex.barn_roof");
	GetMat(MSs, "6_Hamlet_Tex.beam_old");
	GetMat(MSs, "6_Hamlet_Tex.grnd_grass");
	GetMat(MSs, "6_Hamlet_Tex.SnowWhite_Stone_tx");
	GetMat(MSs, "6_Hamlet_Tex.pig_brick");
	GetMat(MSs, "6_Hamlet_Tex.barn_stone");
	GetMat(MSs, "6_Hamlet_Tex.house_base_stone");
	GetMat(MSs, "6_Hamlet_Tex.sky_clouds");
	GetMat(MSs, "6_Hamlet_Tex.strawhouseb_fix");
	GetMat(MSs, "6_Hamlet_Tex.strawhousea_fix");
	GetMat(MSs, "6_Hamlet_Tex.stickbundlewall");
	GetMat(MSs, "6_Hamlet_Tex.acorn");
	GetMat(MSs, "6_Hamlet_Tex.Floor");
	GetMat(MSs, "6_Hamlet_Tex.TREEHOUSEALL");
	GetMat(MSs, "6_Hamlet_Tex.roofburned_fix");
	GetMat(MSs, "6_Hamlet_Tex.burnbg");
	GetMat(MSs, "6_Hamlet_Tex.stickbundle");
	GetMat(MSs, "6_Hamlet_Tex.bouquet_tx");
	GetMat(MSs, "6_Hamlet_Tex.candybox");
	GetMat(MSs, "6_Hamlet_Tex.Cart");
	GetMat(MSs, "6_Hamlet_Tex.log_end");
	GetMat(MSs, "6_Hamlet_Tex.treePineQuad_fix");
	GetMat(MSs, "6_Hamlet_Tex.grass_weeds");
	GetMat(MSs, "6_Hamlet_Tex.axenblock");
	GetMat(MSs, "6_Hamlet_Tex.Mines_RailTracks");
	GetMat(MSs, "6_Hamlet_Tex.jjwell_rock");
	GetMat(MSs, "6_Hamlet_Tex.J&JSign");
	GetMat(MSs, "6_Hamlet_Tex.jjtop");
	GetMat(MSs, "6_Hamlet_Tex.moon");
	GetMat(MSs, "6_Hamlet_Tex.Flower_sunflower");
	GetMat(MSs, "6_Hamlet_Tex.sign_welcome");
	GetMat(MSs, "6_Hamlet_Tex.redwood_tree_tunnel_fix");
	GetMat(MSs, "6_Hamlet_Tex.tree_1_fix");
	GetMat(MSs, "6_Hamlet_Tex.bench");
	GetMat(MSs, "6_Hamlet_Tex.house_roof_hay_dark");
	GetMat(MSs, "6_Hamlet_Tex.bucket_water");
	GetMat(MSs, "6_Hamlet_Tex.Shoe_Hang");
	GetMat(MSs, "6_Hamlet_Tex.swing");
	GetMat(MSs, "6_Hamlet_Tex.Flower");
	GetMat(MSs, "6_Hamlet_Tex.JillsHouse");
	GetMat(MSs, "6_Hamlet_Tex.trough");
	GetMat(MSs, "6_Hamlet_Tex.sky");
	GetMat(MSs, "6_Hamlet_Tex.skybox_clouds");
	GetMat(MSs, "6_Hamlet_Tex.chickencoop");
	GetMat(MSs, "6_Hamlet_Tex.outhouse");
	GetMat(MSs, "6_Hamlet_Tex.Peasant_tx");
	GetMat(MSs, "6_Hamlet_Tex.Shoe_Main2");
	GetMat(MSs, "6_Hamlet_Tex.Shoe_Main");
	GetMat(MSs, "6_Hamlet_Tex.Shoe_Door");
	GetMat(MSs, "6_Hamlet_Tex.Shoe_Lace");
	GetMat(MSs, "6_Hamlet_Tex.Shoe_Window");
	GetMat(MSs, "6_Hamlet_Tex.Shoe_Sign");
	GetMat(MSs, "6_Hamlet_Tex.weeds");
	GetMat(MSs, "6_Hamlet_Tex.water_spout");
	GetMat(MSs, "6_Hamlet_Tex.house_wall_wood");
	GetMat(MSs, "6_Hamlet_Tex.fence");
	GetMat(MSs, "6_Hamlet_Tex.skeleton");
	GetMat(MSs, "6_Hamlet_Tex.bridge_sign");
	GetMat(MSs, "6_Hamlet_Tex.SnowWhite_Tile_tx");
	GetMat(MSs, "6_Hamlet_Tex.Apple_Facade_lower_tx");
	GetMat(MSs, "6_Hamlet_Tex.GemGreen");
	GetMat(MSs, "6_Hamlet_Tex.BuildingB");
	GetMat(MSs, "6_Hamlet_Tex.MoveWetr");
	GetMat(MSs, "6_Hamlet_Tex.Slow_Watrfall");
	GetMat(MSs, "6_Hamlet_Tex.panWater");
	GetMat(MSs, "6_Hamlet_Tex.barn_patch");
	GetMat(MSs, "6_Hamlet_Tex.Coffin");
	GetMat(MSs, "6_Hamlet_Tex.gbHousecc");
	GetMat(MSs, "6_Hamlet_Tex.Ground_quicksand");
	GetMat(MSs, "6_Hamlet_Tex.barrell3");
	GetMat(MSs, "6_Hamlet_Tex.Log");
	GetMat(MSs, "6_Hamlet_Tex.tree_bark_1");
	GetMat(MSs, "6_Hamlet_Tex.Stars");
	GetMat(MSs, "6_Hamlet_Tex.billboard2_textureeverafter1024");
	GetMat(MSs, "6_Hamlet_Tex.vasentable");
	GetMat(MSs, "6_Hamlet_Tex.Beam_metalstrap");
	GetMat(MSs, "6_Hamlet_Tex.gate2");
	GetMat(MSs, "6_Hamlet_Tex.billboard_fgm1026");
	GetMat(MSs, "6_Hamlet_Tex.GemWhite");
	GetMat(MSs, "6_Hamlet_Tex.campfire");
	GetMat(MSs, "6_Hamlet_Tex.hut");
	GetMat(MSs, "6_Hamlet_Tex.pinetree_fix");
	GetMat(MSs, "6_Hamlet_Tex.pib_tree_top_fix");
	GetMat(MSs, "6_Hamlet_Tex.vine_deco_1_fix");
	GetMat(MSs, "6_Hamlet_Tex.tree_willow_leaves_fix");
	GetMat(MSs, "6_Hamlet_Tex.Ground_dark");
	GetMat(MSs, "6_Hamlet_Tex.webfix");
	GetMat(MSs, "6_Hamlet_Tex.rock_moss");
	GetMat(MSs, "6_Hamlet_Tex.GemPink");
	GetMat(MSs, "6_Hamlet_Tex.GemBlue");
	GetMat(MSs, "6_Hamlet_Tex.SnowWhite");
	GetMat(MSs, "6_Hamlet_Tex.snow_glass");
	GetMat(MSs, "6_Hamlet_Tex.House");
	GetMat(MSs, "6_Hamlet_Tex.panWater2");
	GetMat(MSs, "6_Hamlet_Tex.sign_welcome2");
	GetMat(MSs, "7_Prison_Donkey_Tex.water_sewer_env_map");
	GetMat(MSs, "7_Prison_Donkey_Tex.cleanwater_rot2");
	GetMat(MSs, "7_Prison_Donkey_Tex.lightray");
	GetMat(MSs, "7_Prison_Donkey_Tex.vines_big");
	GetMat(MSs, "7_Prison_Donkey_Tex.cube_water_sewer_death");
	GetMat(MSs, "7_Prison_Donkey_Tex.PIBwire");
	GetMat(MSs, "7_Prison_Donkey_Tex.cage_hanging");
	GetMat(MSs, "7_Prison_Donkey_Tex.cleanwater_osc");
	GetMat(MSs, "7_Prison_Donkey_Tex.shader_water_sewer_death");
	GetMat(MSs, "7_Prison_Donkey_Tex.Grate");
	GetMat(MSs, "7_Prison_Donkey_Tex.cleanwater_rot");
	GetMat(MSs, "7_Prison_Donkey_Tex.bars_sheet");
	GetMat(MSs, "7_Prison_Donkey_Tex.stairs_break");
	GetMat(MSs, "7_Prison_Donkey_Tex.cleanwater_combine");
	GetMat(MSs, "7_Prison_Donkey_Tex.platform_stone");
	GetMat(MSs, "7_Prison_Donkey_Tex.Beam");
	GetMat(MSs, "7_Prison_Donkey_Tex.door_wood");
	GetMat(MSs, "7_Prison_Donkey_Tex.prison_pipe_up");
	GetMat(MSs, "7_Prison_Donkey_Tex.walls_sewer");
	GetMat(MSs, "7_Prison_Donkey_Tex.prison_dress_pipe_2");
	GetMat(MSs, "7_Prison_Donkey_Tex.platform_metal");
	GetMat(MSs, "7_Prison_Donkey_Tex.prison_pipe_up_2_arrows");
	GetMat(MSs, "7_Prison_Donkey_Tex.pipes_sewer");
	GetMat(MSs, "7_Prison_Donkey_Tex.walls_sewer_slimey");
	GetMat(MSs, "7_Prison_Donkey_Tex.cage_hanging_fix");
	GetMat(MSs, "7_Prison_Donkey_Tex.pibwire_alphafix");
	GetMat(MSs, "7_Prison_Donkey_Tex.LanternB");
	GetMat(MSs, "7_Prison_Donkey_Tex.bars_sheet_fix");
	GetMat(MSs, "7_Prison_Donkey_Tex.bat_pole");
	GetMat(MSs, "7_Prison_Donkey_Tex.prison_dress_pipe_3");
	GetMat(MSs, "7_Prison_Donkey_Tex.rock_crumble");
	GetMat(MSs, "7_Prison_Donkey_Tex.prison_dress_pipe_6");
	GetMat(MSs, "7_Prison_Donkey_Tex.prison_dress_pipe_5");
	GetMat(MSs, "7_Prison_Donkey_Tex.prison_pipe_large");
	GetMat(MSs, "7_Prison_Donkey_Tex.floor_metal_fix");
	GetMat(MSs, "7_Prison_Donkey_Tex.rock_pile");
	GetMat(MSs, "7_Prison_Donkey_Tex.donkey_elevator");
	GetMat(MSs, "7_Prison_Donkey_Tex.pipeinside");
	GetMat(MSs, "7_Prison_Donkey_Tex.walls_stone_fall");
	GetMat(MSs, "7_Prison_Donkey_Tex.steps_prison");
	GetMat(MSs, "7_Prison_Donkey_Tex.grate_sewer2");
	GetMat(MSs, "7_Prison_Donkey_Tex.rock_abys");
	GetMat(MSs, "7_Prison_Donkey_Tex.walls_stone_slimey");
	GetMat(MSs, "7_Prison_Donkey_Tex.skybox");
	GetMat(MSs, "7_Prison_Donkey_Tex.floor_stone2");
	GetMat(MSs, "7_Prison_Donkey_Tex.walls_stone");
	GetMat(MSs, "7_Prison_Donkey_Tex.bars");
	GetMat(MSs, "7_Prison_Donkey_Tex.cup_tin");
	GetMat(MSs, "7_Prison_Donkey_Tex.grate_sewer");
	GetMat(MSs, "7_Prison_Donkey_Tex.grate_sewer3");
	GetMat(MSs, "7_Prison_Donkey_Tex.column_n_archway");
	GetMat(MSs, "7_Prison_Donkey_Tex.barrell3");
	GetMat(MSs, "7_Prison_Donkey_Tex.prison_dress_pipe_1");
	GetMat(MSs, "7_Prison_Donkey_Tex.Box");
	GetMat(MSs, "7_Prison_Donkey_Tex.bucket_water");
	GetMat(MSs, "7_Prison_Donkey_Tex.Light_Ray_Fixed");
	GetMat(MSs, "7_Prison_Donkey_Tex.wood_support");
	GetMat(MSs, "7_Prison_Donkey_Tex.slime");
	GetMat(MSs, "7_Prison_Donkey_Tex.platform_ballroom");
	GetMat(MSs, "7_Prison_Donkey_Tex.vines_big_fix");
	GetMat(MSs, "7_Prison_Donkey_Tex.prison_boiler");
	GetMat(MSs, "7_Prison_Donkey_Tex.moon");
	GetMat(MSs, "7_Prison_Donkey_Tex.prison_pipe_shimmy_2_arrows");
	GetMat(MSs, "7_Prison_Donkey_Tex.Vent");
	GetMat(MSs, "7_Prison_Donkey_Tex.Switch_PIB_Prison");
	GetMat(MSs, "7_Prison_Donkey_Tex.steed_switch_prison");
	GetMat(MSs, "7_Prison_Donkey_Tex.walls_stone_crack");
	GetMat(MSs, "7_Prison_Donkey_Tex.grate_fix");
	GetMat(MSs, "7_Prison_Donkey_Tex.bridge");
	GetMat(MSs, "7_Prison_Donkey_Tex.metal_barrier");
	GetMat(MSs, "7_Prison_Donkey_Tex.platform_stone_2");
	GetMat(MSs, "7_Prison_Donkey_Tex.floor_stone_edge");
	GetMat(MSs, "7_Prison_Donkey_Tex.os_water_sewer_death");
	GetMat(MSs, "7_Prison_Donkey_Tex.Switch_Shrek_Prison");
	GetMat(MSs, "7_Prison_Donkey_Tex.vent_spray");
	GetMat(MSs, "7_Prison_Donkey_Tex.vent_3");
	GetMat(MSs, "7_Prison_Donkey_Tex.vent_2");
	GetMat(MSs, "7_Prison_Donkey_Tex.prison_pipe_shimmy");
	GetMat(MSs, "7_Prison_Donkey_Tex.floor_stone_side");
	GetMat(MSs, "7_Prison_Donkey_Tex.skybox_clouds");
	GetMat(MSs, "7_Prison_Donkey_Tex.env_water_sewer_death");
	GetMat(MSs, "7_Prison_Donkey_Tex.barrell1");
	GetMat(MSs, "8_Prison_PIB_Tex.Death_Water_combine");
	GetMat(MSs, "8_Prison_PIB_Tex.water_sewer_death");
	GetMat(MSs, "8_Prison_PIB_Tex.water_sewer_death_aplha");
	GetMat(MSs, "8_Prison_PIB_Tex.Death_Water_Alpha");
	GetMat(MSs, "8_Prison_PIB_Tex.death_cube");
	GetMat(MSs, "8_Prison_PIB_Tex.PIB_Stone_Water");
	GetMat(MSs, "8_Prison_PIB_Tex.water_sewer_fall");
	GetMat(MSs, "8_Prison_PIB_Tex.DW_Alpha_rot");
	GetMat(MSs, "8_Prison_PIB_Tex.Death_Water_Rot");
	GetMat(MSs, "8_Prison_PIB_Tex.barrell3");
	GetMat(MSs, "8_Prison_PIB_Tex.PIB_Torch");
	GetMat(MSs, "8_Prison_PIB_Tex.pipe_drain");
	GetMat(MSs, "8_Prison_PIB_Tex.PIB_Cracks");
	GetMat(MSs, "8_Prison_PIB_Tex.slime_spot");
	GetMat(MSs, "8_Prison_PIB_Tex.platform_junk_fix");
	GetMat(MSs, "8_Prison_PIB_Tex.Clean_Water_Solid");
	GetMat(MSs, "8_Prison_PIB_Tex.Clean_Water_Alpha");
	GetMat(MSs, "8_Prison_PIB_Tex.texPanWater_sewer_fall");
	GetMat(MSs, "8_Prison_PIB_Tex.Death_Water_Solid");
	GetMat(MSs, "8_Prison_PIB_Tex.skeleton");
	GetMat(MSs, "8_Prison_PIB_Tex.level8");
	GetMat(MSs, "8_Prison_PIB_Tex.red_bush");
	GetMat(MSs, "8_Prison_PIB_Tex.sewer_envmap");
	GetMat(MSs, "8_Prison_PIB_Tex.Statue_Water");
	GetMat(MSs, "8_Prison_PIB_Tex.Death_Water_S");
	GetMat(MSs, "8_Prison_PIB_Tex.PIB_Vines");
	GetMat(MSs, "9_Prison_Shrek_Tex.level9");
	GetMat(MSs, "9_Prison_Shrek_Tex.red_bush");
	GetMat(MSs, "10_Castle_Siege_Tex.skybox_clouds");
	GetMat(MSs, "10_Castle_Siege_Tex.milk_pour");
	GetMat(MSs, "10_Castle_Siege_Tex.light-street");
	GetMat(MSs, "10_Castle_Siege_Tex.PaddyWagon_Tpage_tx");
	GetMat(MSs, "10_Castle_Siege_Tex.Yelcab_LoPoly_TPage_tx");
	GetMat(MSs, "10_Castle_Siege_Tex.tent_round_2_squish");
	GetMat(MSs, "10_Castle_Siege_Tex.tent_round_1_squish");
	GetMat(MSs, "10_Castle_Siege_Tex.gate_2_base");
	GetMat(MSs, "10_Castle_Siege_Tex.fountain_main");
	GetMat(MSs, "10_Castle_Siege_Tex.tower_flat");
	GetMat(MSs, "10_Castle_Siege_Tex.yelcab_fix");
	GetMat(MSs, "10_Castle_Siege_Tex.paddy_fix");
	GetMat(MSs, "10_Castle_Siege_Tex.umbrella_2_red");
	GetMat(MSs, "10_Castle_Siege_Tex.umbrella_1_purp");
	GetMat(MSs, "10_Castle_Siege_Tex.umbrella_2_orange");
	GetMat(MSs, "10_Castle_Siege_Tex.umbrella_1_blue");
	GetMat(MSs, "10_Castle_Siege_Tex.tent_sq_2");
	GetMat(MSs, "10_Castle_Siege_Tex.tent_sq_3");
	GetMat(MSs, "10_Castle_Siege_Tex.tent_sq_1");
	GetMat(MSs, "10_Castle_Siege_Tex.tent_round_2");
	GetMat(MSs, "10_Castle_Siege_Tex.tent_round_1");
	GetMat(MSs, "10_Castle_Siege_Tex.tent_sq_1_squish");
	GetMat(MSs, "10_Castle_Siege_Tex.tent_sq_3_squish");
	GetMat(MSs, "10_Castle_Siege_Tex.skybox_night_blue");
	GetMat(MSs, "10_Castle_Siege_Tex.Wall");
	GetMat(MSs, "10_Castle_Siege_Tex.tent_sq_2_squish");
	GetMat(MSs, "10_Castle_Siege_Tex.milkMoat2");
	GetMat(MSs, "10_Castle_Siege_Tex.milkMoat01");
	GetMat(MSs, "10_Castle_Siege_Tex.umbrella_1_blue_squish");
	GetMat(MSs, "10_Castle_Siege_Tex.umbrella_2_orange_squish");
	GetMat(MSs, "10_Castle_Siege_Tex.TreePineQuad1_SM");
	GetMat(MSs, "10_Castle_Siege_Tex.tree_tarp");
	GetMat(MSs, "10_Castle_Siege_Tex.flag_yellow");
	GetMat(MSs, "10_Castle_Siege_Tex.tower_point");
	GetMat(MSs, "10_Castle_Siege_Tex.milk_pour_pan");
	GetMat(MSs, "10_Castle_Siege_Tex.flag_blue");
	GetMat(MSs, "10_Castle_Siege_Tex.flag_castle");
	GetMat(MSs, "10_Castle_Siege_Tex.fence_plane");
	GetMat(MSs, "10_Castle_Siege_Tex.umbrella_1_purp_squish");
	GetMat(MSs, "10_Castle_Siege_Tex.milkmoat_pipe");
	GetMat(MSs, "10_Castle_Siege_Tex.gate_1_fix");
	GetMat(MSs, "10_Castle_Siege_Tex.bridge");
	GetMat(MSs, "10_Castle_Siege_Tex.Castle_Windows");
	GetMat(MSs, "10_Castle_Siege_Tex.Castle_Trim");
	GetMat(MSs, "10_Castle_Siege_Tex.castle_wall_windows");
	GetMat(MSs, "10_Castle_Siege_Tex.Castle_Shingle");
	GetMat(MSs, "10_Castle_Siege_Tex.red_carpet");
	GetMat(MSs, "10_Castle_Siege_Tex.gate_1_base");
	GetMat(MSs, "10_Castle_Siege_Tex.tower_render");
	GetMat(MSs, "10_Castle_Siege_Tex.cloud_panner");
	GetMat(MSs, "10_Castle_Siege_Tex.fountain_ground");
	GetMat(MSs, "10_Castle_Siege_Tex.umbrella_2_red_squish");
	GetMat(MSs, "10_Castle_Siege_Tex.Stonelite_Castle");
	GetMat(MSs, "10_Castle_Siege_Tex.milk_decal");
	GetMat(MSs, "10_Castle_Siege_Tex.Milk_Barrel_top");
	GetMat(MSs, "10_Castle_Siege_Tex.Milk_Barrel_side");
	GetMat(MSs, "10_Castle_Siege_Tex.light_street_fix");
	GetMat(MSs, "11_FGM_Battle_Tex.bush_orange_2");
	GetMat(MSs, "11_FGM_Battle_Tex.vase_flowers");
	GetMat(MSs, "11_FGM_Battle_Tex.lights_glo");
	GetMat(MSs, "11_FGM_Battle_Tex.tree_base");
	GetMat(MSs, "11_FGM_Battle_Tex.stage_light_off");
	GetMat(MSs, "11_FGM_Battle_Tex.tree_small");
	GetMat(MSs, "11_FGM_Battle_Tex.tree_1");
	GetMat(MSs, "11_FGM_Battle_Tex.clock_tower");
	GetMat(MSs, "11_FGM_Battle_Tex.castle_wall_windows");
	GetMat(MSs, "11_FGM_Battle_Tex.lights_courtyard");
	GetMat(MSs, "11_FGM_Battle_Tex.tree_ring_courtyard");
	GetMat(MSs, "11_FGM_Battle_Tex.hallway_ceiling_arch");
	GetMat(MSs, "11_FGM_Battle_Tex.hallway_doorway_arch");
	GetMat(MSs, "11_FGM_Battle_Tex.tree_1_fix");
	GetMat(MSs, "11_FGM_Battle_Tex.tree_base_fix");
	GetMat(MSs, "11_FGM_Battle_Tex.Castle_Trim");
	GetMat(MSs, "11_FGM_Battle_Tex.fake_outdoor");
	GetMat(MSs, "11_FGM_Battle_Tex.lights_glo_fix");
	GetMat(MSs, "11_FGM_Battle_Tex.vase_flowers_fix");
	GetMat(MSs, "11_FGM_Battle_Tex.hallway_doorway_arch_sm");
	GetMat(MSs, "11_FGM_Battle_Tex.window_castle");
	GetMat(MSs, "11_FGM_Battle_Tex.painting_1");
	GetMat(MSs, "11_FGM_Battle_Tex.banner_king");
	GetMat(MSs, "11_FGM_Battle_Tex.light_hallway_ceiling");
	GetMat(MSs, "11_FGM_Battle_Tex.wine_carafe");
	GetMat(MSs, "11_FGM_Battle_Tex.banner_queen");
	GetMat(MSs, "11_FGM_Battle_Tex.plant_column");
	GetMat(MSs, "11_FGM_Battle_Tex.pillow");
	GetMat(MSs, "11_FGM_Battle_Tex.tree_small_fix");
	GetMat(MSs, "11_FGM_Battle_Tex.bench");
	GetMat(MSs, "11_FGM_Battle_Tex.painting_2");
	GetMat(MSs, "11_FGM_Battle_Tex.Castle_Windows");
	GetMat(MSs, "11_FGM_Battle_Tex.Castle_Shingle");
	GetMat(MSs, "11_FGM_Battle_Tex.stage_layout_backdrop");
	GetMat(MSs, "11_FGM_Battle_Tex.sidwalk_trim_fix");
	GetMat(MSs, "11_FGM_Battle_Tex.latch");
	GetMat(MSs, "11_FGM_Battle_Tex.table_round");
	GetMat(MSs, "11_FGM_Battle_Tex.tree_ring_court_fix");
	GetMat(MSs, "11_FGM_Battle_Tex.castle_fence");
	GetMat(MSs, "11_FGM_Battle_Tex.table");
	GetMat(MSs, "11_FGM_Battle_Tex.knight1");
	GetMat(MSs, "11_FGM_Battle_Tex.clouds2");
	GetMat(MSs, "11_FGM_Battle_Tex.skybox_night_blue");
	GetMat(MSs, "11_FGM_Battle_Tex.door_black");
	GetMat(MSs, "11_FGM_Battle_Tex.bush_orange_fix");
	GetMat(MSs, "11_FGM_Battle_Tex.clock_tower_fix");
	GetMat(MSs, "11_FGM_Battle_Tex.castle_wall_windows_fix");
	GetMat(MSs, "11_FGM_Battle_Tex.lights_courtyard_fix");
	GetMat(MSs, "11_FGM_Battle_Tex.stage_light_off_fix");
	GetMat(MSs, "Beanstalk.Environment.Beanstalk");
	GetMat(MSs, "Beanstalk.Environment.vines");
	GetMat(MSs, "Beanstalk.Environment.fence");
	GetMat(MSs, "Beanstalk.Environment.weeds");
	GetMat(MSs, "Beanstalk.rainsky");
	GetMat(MSs, "Beanstalk.Environment.beans_door");
	GetMat(MSs, "Beanstalk.Environment.water_spout");
	GetMat(MSs, "Beanstalk.Environment.bucket");
	GetMat(MSs, "Beanstalk.Tree_shadow_opacity");
	GetMat(MSs, "Beanstalk.Environment.gate");
	GetMat(MSs, "Beanstalk.Tree_shadow");
	GetMat(MSs, "Beanstalk.Environment.beanstlk_trees");
	GetMat(MSs, "Beanstalk.lightningsky");
	GetMat(MSs, "Beanstalk.Environment.clouds2");
	GetMat(MSs, "Beanstalk.Environment.flower_patch");
	GetMat(MSs, "Beanstalk.Environment.clouds");
	GetMat(MSs, "Beanstalk.Environment.grass_patch");
	GetMat(MSs, "Beanstalk.Environment.Cart");
	GetMat(MSs, "Beanstalk.Environment.Lightning");
	GetMat(MSs, "Beanstalk.Environment.green_bush");
	GetMat(MSs, "Beanstalk.Environment.red_bush");
	GetMat(MSs, "Beanstalk.Environment.TreePineQuad1_SM");
	GetMat(MSs, "Beanstalk.Environment.pinetree");
	GetMat(MSs, "Beanstalk.Environment.light_green_bush");
	GetMat(MSs, "Beanstalk.Environment.Beans");
	GetMat(MSs, "Beanstalk.Tree_shadow_jiggliwiggle");
	GetMat(MSs, "Beanstalk.Cloud_panning_alpha");
	GetMat(MSs, "Beanstalk.Environment.front_sign");
	GetMat(MSs, "Beanstalk.Environment.Water_Oscillator");
	GetMat(MSs, "Beanstalk.Environment.TreePineShadow1_SM");
	GetMat(MSs, "Beanstalk.Environment.leaf2");
	GetMat(MSs, "Beanstalk.Environment.leaf");
	GetMat(MSs, "Beanstalk.Environment.StaticMesh");
	GetMat(MSs, "Beanstalk.rainsky_pan");
	GetMat(MSs, "Beanstalk.Environment.BigFluffyCloudPanning");
	GetMat(MSs, "Beanstalk.Environment.fern");
	GetMat(MSs, "Beanstalk.Environment.tree_canopy");
	
	for(i = 0; i < MSs.Length; i++)
	{
		MSs[i].Material.SetPropertyText("MaterialType", GetMaterialTypeString(MSs[i].MaterialType));
	}
}

function GetMat(out array<MaterialStruct> MSs, string S, optional int I) // Outputs a struct containing the loaded material and a MaterialType, from a string used in a DLO() and a MaterialType enumerator index
{
	local MaterialStruct MS;
	
	MS.Material = Material(DynamicLoadObject(S, class'Material'));
	MS.MaterialType = GetMaterialTypeByInt(I);
	
	MSs.Insert(MSs.Length, 1);
	MSs[MSs.Length - 1] = MS;
}


defaultproperties
{
	PickupClasses(0)=class'BoxOfEnergyBars'
	PickupClasses(1)=class'Coin'
	PickupClasses(2)=class'CoinStack'
	PickupClasses(3)=class'EnergyBar'
	PickupClasses(4)=class'EnergyKeg'
	PickupClasses(5)=class'MicePotionStrong'
	PickupClasses(6)=class'MicePotionWeak'
	PickupClasses(7)=class'MoneyBag'
	PickupClasses(8)=class'MousePotion'
	PickupClasses(9)=class'PixiePotion'
	PickupClasses(10)=class'PixiePotionStrong'
	PickupClasses(11)=class'PixiePotionWeak'
	PickupClasses(12)=class'Potion1sh'
	PickupClasses(13)=class'Potion2sh'
	PickupClasses(14)=class'Potion3sh'
	PickupClasses(15)=class'Potion4sh'
	PickupClasses(16)=class'Potion5sh'
	PickupClasses(17)=class'Potion6sh'
	PickupClasses(18)=class'Potion7sh'
	PickupClasses(19)=class'Potion8sh'
	PickupClasses(20)=class'Potion9sh'
	PickupClasses(21)=class'PotionBottle'
	PickupClasses(22)=class'PotionHEA'
	PickupClasses(23)=class'Shamrock'
	PickupClasses(24)=class'SpecialAttack'
	PickupClasses(25)=class'StrengthPotion'
	Texture=Texture'MPatcher'
}