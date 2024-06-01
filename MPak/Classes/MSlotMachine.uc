// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MSlotMachine extends DriveThrough
	HideCategories(DriveThrough)
	Config(MPak);


#exec TEXTURE IMPORT NAME=SlotEmptyCostSign FILE=Textures\SlotEmptyCostSign.dds
#exec TEXTURE IMPORT NAME=SlotCoin FILE=Textures\SlotCoin.dds
#exec TEXTURE IMPORT NAME=SlotCoinStack FILE=Textures\SlotCoinStack.dds
#exec TEXTURE IMPORT NAME=SlotEnergyBar FILE=Textures\SlotEnergyBar.dds
#exec TEXTURE IMPORT NAME=SlotEnergyKeg FILE=Textures\SlotEnergyKeg.dds
#exec TEXTURE IMPORT NAME=SlotExplosion FILE=Textures\SlotExplosion.dds
#exec TEXTURE IMPORT NAME=SlotFairy FILE=Textures\SlotFairy.dds
#exec TEXTURE IMPORT NAME=SlotPotionHEA FILE=Textures\SlotPotionHEA.dds
#exec TEXTURE IMPORT NAME=SlotMoneyBag FILE=Textures\SlotMoneyBag.dds
#exec TEXTURE IMPORT NAME=SlotPoster FILE=Textures\SlotPoster.dds
#exec TEXTURE IMPORT NAME=SlotPotion1 FILE=Textures\SlotPotion1.dds
#exec TEXTURE IMPORT NAME=SlotPotion2 FILE=Textures\SlotPotion2.dds
#exec TEXTURE IMPORT NAME=SlotPotion3 FILE=Textures\SlotPotion3.dds
#exec TEXTURE IMPORT NAME=SlotPotion4 FILE=Textures\SlotPotion4.dds
#exec TEXTURE IMPORT NAME=SlotPotion5 FILE=Textures\SlotPotion5.dds
#exec TEXTURE IMPORT NAME=SlotPotion6 FILE=Textures\SlotPotion6.dds
#exec TEXTURE IMPORT NAME=SlotPotion7 FILE=Textures\SlotPotion7.dds
#exec TEXTURE IMPORT NAME=SlotPotion8 FILE=Textures\SlotPotion8.dds
#exec TEXTURE IMPORT NAME=SlotPotion9 FILE=Textures\SlotPotion9.dds
#exec TEXTURE IMPORT NAME=SlotShamrock FILE=Textures\SlotShamrock.dds
#exec TEXTURE IMPORT NAME=SlotSkull FILE=Textures\SlotSkull.dds
#exec TEXTURE IMPORT NAME=SlotUnknown FILE=Textures\SlotUnknown.dds
#exec TEXTURE IMPORT NAME=SlotWitch FILE=Textures\SlotWitch.dds
#exec TEXTURE IMPORT NAME=SlotCoinSpin FILE=Textures\SlotCoinSpin.dds
#exec TEXTURE IMPORT NAME=SlotCoinStackSpin FILE=Textures\SlotCoinStackSpin.dds
#exec TEXTURE IMPORT NAME=SlotEnergyBarSpin FILE=Textures\SlotEnergyBarSpin.dds
#exec TEXTURE IMPORT NAME=SlotEnergyKegSpin FILE=Textures\SlotEnergyKegSpin.dds
#exec TEXTURE IMPORT NAME=SlotMoneyBagSpin FILE=Textures\SlotMoneyBagSpin.dds
#exec TEXTURE IMPORT NAME=SlotPotion1Spin FILE=Textures\SlotPotion1Spin.dds
#exec TEXTURE IMPORT NAME=SlotPotion2Spin FILE=Textures\SlotPotion2Spin.dds
#exec TEXTURE IMPORT NAME=SlotPotion3Spin FILE=Textures\SlotPotion3Spin.dds
#exec TEXTURE IMPORT NAME=SlotPotion4Spin FILE=Textures\SlotPotion4Spin.dds
#exec TEXTURE IMPORT NAME=SlotPotion5Spin FILE=Textures\SlotPotion5Spin.dds
#exec TEXTURE IMPORT NAME=SlotPotion6Spin FILE=Textures\SlotPotion6Spin.dds
#exec TEXTURE IMPORT NAME=SlotPotion7Spin FILE=Textures\SlotPotion7Spin.dds
#exec TEXTURE IMPORT NAME=SlotPotion8Spin FILE=Textures\SlotPotion8Spin.dds
#exec TEXTURE IMPORT NAME=SlotPotion9Spin FILE=Textures\SlotPotion9Spin.dds
#exec TEXTURE IMPORT NAME=SlotShamrockSpin FILE=Textures\SlotShamrockSpin.dds
#exec TEXTURE IMPORT NAME=SlotWitchSpin FILE=Textures\SlotWitchSpin.dds


struct FMinMaxStruct
{
	var() float Min, Max;
	var float Count;
};

struct MinMaxStruct
{
	var() int Min, Max;
	var int Count;
};

struct SetPropStruct
{
	var() string Variable, Value;
};

enum eBonusType
{
	BT_None,
	BT_Free_Spins
};

struct BonusStruct
{
	var() eBonusType BonusType;
	var() MinMaxStruct iFreeSpinCount;
	var() float fFreeSpinsDelay;
	var() array<Sound> BonusRewardSound;
};

struct CostSignTextStruct
{
	var() string sWinText, sFullscreenText, sMaxWinText, sLossText, sSpinText, sOutOfServiceText;
	var() bool bCostDecrementsWithBetProcessing, bShowSpinCountForSpinText;
};

struct PrizeStruct
{
    var() array< class<Actor> > PrizeClass, FullscreenPrizeClass;
    var() int iDropWeight;
    var() MinMaxStruct iDropCount, iFullscreenMultiplier;
	var() Material SlotMaterial;
	var() name nStateToRun, nEventToFireTo;
	var() array<Sound> SpawnSound;
    var() vector vOffset;
    var() rotator rOffset;
	var() bool bIgnoreMultiplier, bBadPrize, bMaxWinPrize, bSurpriseFullscreen, bMustFullscreen, bDisableSlotMachine;
	var() FMinMaxStruct fThrowVelocityMultiplier, fThrowLengthMultiplier, fThrowHeightMultiplier;
	var() float fThrowDeviationLengthMultiplier;
	var() BonusStruct BonusSettings;
	var() array<SetPropStruct> SetProps;
};

struct WitchStruct
{
	var() float fAppearDistance;
	var() array<Mesh> WitchMeshes;
	var() array<Material> WitchSkins;
	var() vector vOffset;
	var() rotator rOffset;
	var() name nAppearAnim, nDisappearAnim, nIdleAnim, nSpinIdleAnim, nPayoutAnim;
	var() bool bTurnToPlayer;
	var() array<Sound> WitchAppearSound, WitchDisappearSound;
	var() array<SetPropStruct> SetProps;
};

var() array<PrizeStruct> PrizesToWin, PrizesOnLoss;
var() MinMaxStruct iCostOfBet, iSpinsPerBet, iTotalLives;
var() FMinMaxStruct fBetProcessTime, fDelayBeforeSpin, fSpinTime, fRepeatIconChance, fSlotSpinRate;
var() Material CostSignMaterialOverride;
var() array<Material> SlotSpinMaterials;
var() int iCostSignTextOffset[8];
var() CostSignTextStruct CostSignTexts;
var() float fPrizeDropTime, fPrizeDropInitialDelay;
var() bool bLockPlayerWhileSpinning, bUseLifeSystem, bDetermineRTP;
var() MUtils.EFont CostSignFontType[4];
var() Color CostSignTextColor;
var() WitchStruct WitchSettings;
var() Sound SpinLoop1Sound, SpinLoop2Sound, SpinLoop3Sound;
var() array<Sound> ProcessBetSuccessSound, ProcessBetFailSound, SpinStartSound, SpinStopSound, WinSound, FullscreenSound, MaxWinSound, LossSound;
var int iSubtractedCoins, iOldSubtractedCoins, iCurrentPrize, iPrizeIndex, iPrizeClassIndex, iMatchingIcons, iRewardMultiplier, iRTPBestHit;
var float fRTPTotalValue, fElapsedTime;
var array<float> RTPs;
var array<int> NextSlotIconIndexes;
var bool bGUIOpen, bDisabled;
var MVendingWitch Witch;
var Material CostSignBackup, SavingTexture;
var ScriptedTexture CostSign;
var string sCostSignText;
var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var array<KWHudItem> HudItems;
var BaseCam Cam;
var MUtils U;


event PostBeginPlay()
{
	local Actor A;
	local AIScript AIS;
	local class<AIController> AIC;
	local MeshAnimation MeshAnim;
	local int i;
	
	U = GetUtils();
	
	if(bool(GetPropertyText("bIsMainPlayer")))
	{
		bDontPossess = true;
	}
	
	SplashTime = 0.0;
	SpawnTime = Level.TimeSeconds;
	EyeHeight = BaseEyeHeight;
	OldRotYaw = float(Rotation.Yaw);
	
	if(Level.bStartup && U.GetHealth(self) > 0.0 && !bDontPossess)
	{
		if(AIScriptTag != 'None')
		{
			foreach AllActors(class'AIScript', AIS, AIScriptTag)
			{
				break;
			}
			
			if(AIS != none)
			{
				AIS.SpawnControllerFor(self);
				
				if(Controller != none)
				{
					return;
				}
			}
		}
		
		SetPropertyText("AIC", GetPropertyText("ControllerClass"));
		
		if(AIC != none && Controller == none)
		{
			Controller = Spawn(AIC);
		}
		
		if(Controller != none)
		{
			Controller.Possess(self);
			
			AIController(Controller).Skill += SkillModifier;
		}
	}
	
	if(!bNoDefaultInventory)
	{
		AddDefaultInventory();
	}
	
	SetJumpVars();
	KWAddShadow();
	MaxHealth = U.GetHealth(self);
	GroundSpeed = GroundRunSpeed;
	WalkingPct = GroundWalkSpeed / GroundRunSpeed;
	CreationTime = Level.TimeSeconds;
	
	for(i = 0; i < AttachTypeArray.Length; i++)
	{
		A = Spawn(AttachTypeArray[i], self);
		
		if(A != none)
		{
			A.SetPhysics(PHYS_Trailer);
			A.SetCollision(false, false, false);
			A.bCollideWorld = false;
			AttachedActorArray.Insert(AttachedActorArray.Length, 1);
			AttachedActorArray[AttachedActorArray.Length - 1] = A;
		}
	}
	
	AnimBlendParams(ATTACKCHANNEL_LOWER, 0, 0, 0, LOWER_BODY_BONE);
	AnimBlendParams(ATTACKCHANNEL_UPPER, 0, 0, 0, UPPER_BODY_BONE);
	AnimBlendParams(ARMCHANNEL_RIGHT, 0, 0, 0, RIGHT_ARM_BONE);
	AnimBlendParams(ARMCHANNEL_LEFT, 0, 0, 0, LEFT_ARM_BONE);
	
	iCostOfBet.Count = U.RandRangeInt(iCostOfBet.Min, iCostOfBet.Max);
	iSpinsPerBet.Count = U.RandRangeInt(iSpinsPerBet.Min, iSpinsPerBet.Max);
	fRepeatIconChance.Count = U.RandRangeFloat(fRepeatIconChance.Min, fRepeatIconChance.Max);
	iTotalLives.Count = U.RandRangeInt(iTotalLives.Min, iTotalLives.Max);
	
	NextSlotIconIndexes = GetNextSlotIcons(fRepeatIconChance.Count);
	
	MakeCostSign();
	
	SetCostSignText(string(iCostOfBet.Count));
	
	A = none;
	
	U.MFancySpawn(class'MVendingWitch', Location + U.Vec(0.0, 0.0, 62.0 * (Drawscale / 0.6)) + WitchSettings.vOffset, U.Rota(0, Rotation.Yaw + 16384, 0) + WitchSettings.rOffset, A);
	
	if(A != none)
	{
		Witch = MVendingWitch(A);
		Witch.S = self;
		
		Witch.SetDrawScale(DrawScale);
		Witch.SetCollisionSize(Witch.default.CollisionRadius * (Drawscale / 0.6), Witch.default.CollisionHeight * (Drawscale / 0.6));
		
		if(WitchSettings.WitchMeshes.Length != 0)
		{
			Witch.LinkMesh(WitchSettings.WitchMeshes[Rand(WitchSettings.WitchMeshes.Length)]);
			MeshAnim = MeshAnimation(DynamicLoadObject(string(Witch.Mesh), class'MeshAnimation'));
			LinkSkelAnim(MeshAnim);
		}
		
		if(WitchSettings.WitchSkins.Length != 0)
		{
			Witch.Skins[0] = WitchSettings.WitchSkins[Rand(WitchSettings.WitchSkins.Length)];
		}
		
		for(i = 0; i < WitchSettings.SetProps.Length; i++)
		{
			Witch.SetPropertyText(WitchSettings.SetProps[i].Variable, WitchSettings.SetProps[i].Value);
		}
	}
	
	RandomizeSlotIcons();
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

event Tick(float DeltaTime)
{
	if(bDetermineRTP)
	{
		DetermineRTP();
	}
}

function DetermineRTP() // Runs logic to determine what the RTP of the machine is. Should be used in a tick event
{
	if(RTPs.Length >= 2000)
	{
		Log("---");
		Log("RTP roughly determined!");
		Log("---");
		Log("RTP (after 1000000 spins) = ~" $ U.FloatToString((fRTPTotalValue / (float(iCostOfBet.Count) * (float(RTPs.Length) * 500.0)) * 100.0), 2) $ "%");
		Log("Best Hit =" @ string(iRTPBestHit) @ "coins (" $ string(iRTPBestHit / iCostOfBet.Count) $ "x)");
		Log("Spent" @ U.FloatToString(float(iCostOfBet.Count) * (float(RTPs.Length) * 500.0)) @ "coins, got payed back" @ U.Floor(fRTPTotalValue) @ "coins");
		
		bDetermineRTP = false;
		
		return;
	}
	
	if(RTPs.Length % 20 == 0)
	{
		Log("Progress:" @ U.FloatToString((float(RTPs.Length) / 2000.0) * 100.0) $ "%");
		Log("Current RTP (after" @ U.FloatToString(float(RTPs.Length) * 500.0) @ "spins) = ~" $ U.FloatToString((fRTPTotalValue / (float(iCostOfBet.Count) * (float(RTPs.Length) * 500.0)) * 100.0), 2) $ "%");
		Log("Best Hit =" @ string(iRTPBestHit) @ "coins (" $ string(iRTPBestHit / iCostOfBet.Count) $ "x)");
		Log("Spent" @ U.FloatToString(float(iCostOfBet.Count) * (float(RTPs.Length) * 500.0)) @ "coins, got payed back" @ U.Floor(fRTPTotalValue) @ "coins so far");
	}
	
	RTPs.Insert(RTPs.Length, 1);
	RTPs[RTPs.Length - 1] = SimulateSpins();
	
	fRTPTotalValue += RTPs[RTPs.Length - 1];
	
	Log("Simulated 500 spins costing" @ string(iCostOfBet.Count * 500) @ "coins, got payed back" @ U.Floor(RTPs[RTPs.Length - 1]) @ "coins");
}

function MakeCostSign() // Makes/instantiates the cost sign
{
	if(CostSignMaterialOverride != none)
	{
		SavingTexture = CostSignMaterialOverride;
	}
	else
	{
		SavingTexture = Skins[0];
	}
	
	CostSign = ScriptedTexture(Level.ObjectPool.AllocateObject(class'ScriptedTexture'));
	CostSign.Client = self;
	
	if(SavingTexture.IsA('BitmapMaterial'))
	{
		CostSign.SetSize(BitmapMaterial(SavingTexture).USize, BitmapMaterial(SavingTexture).VSize);
	}
	else
	{
		CostSign.SetSize(128, 64);
	}
	
	Skins[0] = CostSign;
	
	SetCostSignText("", true);
}

function DestroyCostSign() // Destroys the cost sign
{
	Skins[0] = SavingTexture;
	
	if(CostSign != none)
	{
		Level.ObjectPool.FreeObject(CostSign);
		
		CostSign = none;
	}
}

event PostLoadGame(bool bLoadFromSaveGame)
{
	if(bLoadFromSaveGame)
	{
		MakeCostSign();
	}
}

function SetCostSignText(string S, optional bool B) // Sets the text for the cost sign
{
	if(!B)
	{
		sCostSignText = S;
	}
	
	CostSign.Revision = int(!bool(CostSign.Revision));
}

event Destroyed()
{
	DestroyCostSign();
	
	Witch.Destroy();
	
	super.Destroyed();
}

event PreSaveGame()
{
	DestroyCostSign();
	
	// Can't easily recover the slot spinning animations so we'll just show the final results early
	if(IsInState('SlotSpin'))
	{
		Skins[2] = PrizesToWin[NextSlotIconIndexes[0]].SlotMaterial;
		Skins[3] = PrizesToWin[NextSlotIconIndexes[1]].SlotMaterial;
		Skins[4] = PrizesToWin[NextSlotIconIndexes[2]].SlotMaterial;
	}
}

event PostSaveGame()
{
	MakeCostSign();
}

event RenderTexture(ScriptedTexture Tex)
{
	local int iTextWidth, iTextHeight, iFontIndex;
	local Font fTextFont;
	
	if(CostSign == none || Tex == none)
	{
		return;
	}
	
	if(SavingTexture.IsA('BitmapMaterial'))
	{
		Tex.DrawTile(0, 0, BitmapMaterial(SavingTexture).USize, BitmapMaterial(SavingTexture).VSize, 0, 0, Tex.USize, Tex.VSize, SavingTexture, U.MakeColor(255, 255, 255, 255));
	}
	else
	{
		Tex.DrawTile(0, 0, 128, 64, 0, 0, Tex.USize, Tex.VSize, SavingTexture, U.MakeColor(255, 255, 255, 255));
	}
	
	iFontIndex = Clamp(Len(sCostSignText) - 1, 0, 3);
	
	fTextFont = U.GetFontFromEnum(CostSignFontType[iFontIndex]);
	
	Tex.TextSize(sCostSignText, fTextFont, iTextWidth, iTextHeight);
	
	Tex.DrawText((((Tex.USize / 2) - (iTextWidth / 2)) + 2) + iCostSignTextOffset[iFontIndex * 2], (((Tex.VSize / 2) - (iTextHeight / 2)) + 2) + iCostSignTextOffset[(iFontIndex * 2) + 1], sCostSignText, fTextFont, U.MakeColor(0, 0, 0, 255));
	Tex.DrawText(((Tex.USize / 2) - (iTextWidth / 2)) + iCostSignTextOffset[iFontIndex * 2], ((Tex.VSize / 2) - (iTextHeight / 2)) + iCostSignTextOffset[(iFontIndex * 2) + 1], sCostSignText, fTextFont, CostSignTextColor);
}

function MaterialSequence GetRandomSpinIcon() // Gets a random spinning icon animation
{
	local MaterialSequence MS;
	local int i;
	local float fTotalTime;
	local array<int> Is;
	
	MS = MaterialSequence(Level.ObjectPool.AllocateObject(class'MaterialSequence'));
	
	fTotalTime = 0.0;
	
	Is = U.ShuffleIntArray(SlotSpinMaterials.Length);
	
	for(i = 0; i < SlotSpinMaterials.Length; i++)
	{
		MS.SequenceItems.Insert(MS.SequenceItems.Length, 1);
		
		MS.SequenceItems[i].Material = SlotSpinMaterials[Is[i]];
		MS.SequenceItems[i].Time = U.RandRangeFloat(fSlotSpinRate.Min, fSlotSpinRate.Max) / 20.0;
		MS.SequenceItems[i].Action = MSA_FadeToMaterial;
		
		fTotalTime += MS.SequenceItems[i].Time;
	}
	
	MS.TotalTime = fTotalTime;
	
	return MS;
}

function RandomizeSlotIcons() // Randomizes the slot icons
{
	local int i;
	
	for(i = 2; i < 5; i++)
	{
		Skins[i] = PrizesToWin[Rand(PrizesToWin.Length)].SlotMaterial;
	}
}

function int SimulateSpins() // Simulates 500 spins and returns the total amount of coins returned
{
	local int i, j, iTotalValue, iLocalValue;
	
	for(i = 0; i < 500; i++)
	{
		iLocalValue = 0;
		
		iSpinsPerBet.Count = U.RandRangeInt(iSpinsPerBet.Min, iSpinsPerBet.Max);
		
		Respin:
		
		Skins[2] = PrizesToWin[NextSlotIconIndexes[0]].SlotMaterial;
		Skins[3] = PrizesToWin[NextSlotIconIndexes[1]].SlotMaterial;
		Skins[4] = PrizesToWin[NextSlotIconIndexes[2]].SlotMaterial;
		
		iSpinsPerBet.Count--;
		
		iPrizeIndex = GetPrizeIndex(PrizesToWin);
		
		if(iPrizeIndex > -1 && (!PrizesToWin[iPrizeIndex].bMustFullscreen || (PrizesToWin[iPrizeIndex].bMustFullscreen && iMatchingIcons > 2)))
		{
			if(!PrizesToWin[iPrizeIndex].bIgnoreMultiplier && iMatchingIcons > 2)
			{
				iRewardMultiplier = U.RandRangeInt(PrizesToWin[iPrizeIndex].iFullscreenMultiplier.Min, PrizesToWin[iPrizeIndex].iFullscreenMultiplier.Max);
			}
			else
			{
				iRewardMultiplier = 1;
			}
			
			if(PrizesToWin[iPrizeIndex].BonusSettings.BonusType == BT_Free_Spins)
			{
				UpdateFreeSpinsCount();
				
				iSpinsPerBet.Count += PrizesToWin[iPrizeIndex].BonusSettings.iFreeSpinCount.Count * iRewardMultiplier;
			}
			
			PrizesToWin[iPrizeIndex].iDropCount.Count = U.RandRangeInt(PrizesToWin[iPrizeIndex].iDropCount.Min, PrizesToWin[iPrizeIndex].iDropCount.Max) * iRewardMultiplier;
			
			for(j = 0; j < PrizesToWin[iPrizeIndex].iDropCount.Count; j++)
			{
				if(PrizesToWin[iPrizeIndex].FullscreenPrizeClass.Length != 0 && iMatchingIcons > 2)
				{
					iPrizeClassIndex = Rand(PrizesToWin[iPrizeIndex].FullscreenPrizeClass.Length);
					
					if(PrizesToWin[iPrizeIndex].FullscreenPrizeClass[iPrizeClassIndex] == class'Coin' || PrizesToWin[iPrizeIndex].FullscreenPrizeClass[iPrizeClassIndex] == class'MCoin')
					{
						iLocalValue += 1;
					}
					else if(PrizesToWin[iPrizeIndex].FullscreenPrizeClass[iPrizeClassIndex] == class'CoinStack' || PrizesToWin[iPrizeIndex].FullscreenPrizeClass[iPrizeClassIndex] == class'MCoinStack')
					{
						iLocalValue += 10;
					}
					else if(PrizesToWin[iPrizeIndex].FullscreenPrizeClass[iPrizeClassIndex] == class'MoneyBag' || PrizesToWin[iPrizeIndex].FullscreenPrizeClass[iPrizeClassIndex] == class'MMoneyBag')
					{
						iLocalValue += U.RandRangeInt(10, 100);
					}
				}
				else
				{
					iPrizeClassIndex = Rand(PrizesToWin[iPrizeIndex].PrizeClass.Length);
					
					if(PrizesToWin[iPrizeIndex].PrizeClass[iPrizeClassIndex] == class'Coin' || PrizesToWin[iPrizeIndex].PrizeClass[iPrizeClassIndex] == class'MCoin')
					{
						iLocalValue += 1;
					}
					else if(PrizesToWin[iPrizeIndex].PrizeClass[iPrizeClassIndex] == class'CoinStack' || PrizesToWin[iPrizeIndex].PrizeClass[iPrizeClassIndex] == class'MCoinStack')
					{
						iLocalValue += 10;
					}
					else if(PrizesToWin[iPrizeIndex].PrizeClass[iPrizeClassIndex] == class'MoneyBag' || PrizesToWin[iPrizeIndex].PrizeClass[iPrizeClassIndex] == class'MMoneyBag')
					{
						iLocalValue += U.RandRangeInt(10, 100);
					}
				}
			}
		}
		else
		{
			iPrizeIndex = U.wRNG(GetWeightsOfPrizes(PrizesOnLoss));
			
			PrizesOnLoss[iPrizeIndex].iDropCount.Count = U.RandRangeInt(PrizesOnLoss[iPrizeIndex].iDropCount.Min, PrizesOnLoss[iPrizeIndex].iDropCount.Max);
			
			for(j = 0; j < PrizesOnLoss[iPrizeIndex].iDropCount.Count; j++)
			{
				iPrizeClassIndex = Rand(PrizesOnLoss[iPrizeIndex].PrizeClass.Length);
				
				if(PrizesOnLoss[iPrizeIndex].PrizeClass[iPrizeClassIndex] == class'Coin' || PrizesOnLoss[iPrizeIndex].PrizeClass[iPrizeClassIndex] == class'MCoin')
				{
					iLocalValue += 1;
				}
				else if(PrizesOnLoss[iPrizeIndex].PrizeClass[iPrizeClassIndex] == class'CoinStack' || PrizesOnLoss[iPrizeIndex].PrizeClass[iPrizeClassIndex] == class'MCoinStack')
				{
					iLocalValue += 10;
				}
				else if(PrizesOnLoss[iPrizeIndex].PrizeClass[iPrizeClassIndex] == class'MoneyBag' || PrizesOnLoss[iPrizeIndex].PrizeClass[iPrizeClassIndex] == class'MMoneyBag')
				{
					iLocalValue += U.RandRangeInt(10, 100);
				}
			}
		}
		
		NextSlotIconIndexes = GetNextSlotIcons(fRepeatIconChance.Count);
		
		if(iSpinsPerBet.Count > 0)
		{
			goto 'Respin';
		}
		
		if(iRTPBestHit < iLocalValue)
		{
			iRTPBestHit = iLocalValue;
		}
		
		iTotalValue += iLocalValue;
	}
	
	return iTotalValue;
}

function ActivateVendor()
{
	local float fOldPauseDelay;
	
	if(!CanPlaceBet())
	{
		return;
	}
	
	PC = U.GetPC();
	
	fOldPauseDelay = Level.PauseDelay;
	Level.PauseDelay = 0.0;
	
	bGUIOpen = true;
	
	PC.ClientOpenMenu("MPak.MPlaceBetPage");
	
	bGUIOpen = false;
	
	Level.PauseDelay = fOldPauseDelay;
}

function bool CanPlaceBet() // Returns true if the player is allowed to place a bet
{
	return IsInState('Inactive') && !Witch.bDisabled && !bDisabled;
}

function array<int> GetWeightsOfPrizes(array<PrizeStruct> Ps) // Returns the weights of all possible prizes, used for the weighted RNG
{
	local int i;
	local array<int> iWeights;
	
	for(i = 0; i < Ps.Length; i++)
	{
		iWeights.Insert(iWeights.Length, 1);
		iWeights[iWeights.Length - 1] = Ps[i].iDropWeight;
	}
	
	return iWeights;
}

function int GetPrizeIndex(array<PrizeStruct> Ps) // Determines which prize was spun in, if applicable
{
	local int i;
	
	iMatchingIcons = int(Skins[2] == Skins[3]) + int(Skins[3] == Skins[4]) + int(Skins[2] == Skins[4]);
	
	if(iMatchingIcons > 0)
	{
		for(i = 0; i < Ps.Length; i++)
		{
			if((Ps[i].SlotMaterial == Skins[2] && Ps[i].SlotMaterial == Skins[3]) || (Ps[i].SlotMaterial == Skins[3] && Ps[i].SlotMaterial == Skins[4]) || (Ps[i].SlotMaterial == Skins[2] && Ps[i].SlotMaterial == Skins[4]))
			{
				return i;
			}
		}
	}
	
	return -1;
}

function SpawnAPrize(PrizeStruct P, int iPrizeClassIndex, optional bool bFullscreenPrize) // Spawns/throws a prize with the provided settings
{
	local Actor Prize;
	local vector vForwardVector, vVelocity;
	local float sinAlpha, cosAlpha, betha, sinBetha, cosBetha, sinDeviationAngle, cosDeviationAngle, fLength;
	local int i;
	
	if(!bFullscreenPrize)
	{
		U.MFancySpawn(P.PrizeClass[iPrizeClassIndex], Witch.Location + U.Vec(0.0, 0.0, Witch.CollisionHeight / 2.0) + P.vOffset, Witch.Rotation + P.rOffset, Prize);
	}
	else
	{
		U.MFancySpawn(P.FullscreenPrizeClass[iPrizeClassIndex], Witch.Location + U.Vec(0.0, 0.0, Witch.CollisionHeight / 2.0) + P.vOffset, Witch.Rotation + P.rOffset, Prize);
	}
	
	if(Prize.IsA('KWPickup'))
	{
		KWPickup(Prize).bBounceIntoPlace = true;
		Prize.GotoState('BounceIntoPlace');
	}
	else if(Prize.IsA('MPickup'))
	{
		MPickup(Prize).bBounceIntoPlace = true;
		Prize.GotoState('BounceIntoPlace');
	}
	
	// Get the forward vector of the calling actor's rotation
	vForwardVector = vector(U.Rota(0, Witch.Rotation.Yaw, 0));
	sinAlpha = vForwardVector.Y;
	cosAlpha = vForwardVector.X;
	
	// Generate a random deviation angle
	betha = U.RandRangeFloat(-FClamp(P.fThrowDeviationLengthMultiplier, 0.0, 1.0), FClamp(P.fThrowDeviationLengthMultiplier, 0.0, 1.0));
	sinBetha = Sin(betha);
	cosBetha = Cos(betha);
	
	// Calculate the angle components for the deviation
	sinDeviationAngle = (sinBetha * cosAlpha) + (cosBetha * sinAlpha);
	cosDeviationAngle = (cosBetha * cosAlpha) - (sinBetha * sinAlpha);
	
	// Generate a random length for the velocity vector
	fLength = U.RandRangeFloat(P.fThrowLengthMultiplier.Min, P.fThrowLengthMultiplier.Max);
	
	// Calculate the velocity components with deviation and forward multiplier
	vVelocity.X = fLength * cosDeviationAngle;
	vVelocity.Y = fLength * sinDeviationAngle;
	
	// Apply a random factor to the Z component (upward velocity)
	vVelocity.Z = 1.0 * U.RandRangeFloat(P.fThrowHeightMultiplier.Min, P.fThrowHeightMultiplier.Max);
	
	// Apply the overall start velocity multiplier
	vVelocity *= 100.0 * U.RandRangeFloat(P.fThrowVelocityMultiplier.Min, P.fThrowVelocityMultiplier.Max);
	
	Prize.Velocity = vVelocity;
	
	if(P.nStateToRun != 'None')
	{
		Prize.GotoState(P.nStateToRun);
	}
	
	if(P.nEventToFireTo != 'None')
	{
		TriggerEvent(P.nEventToFireTo, self, self);
	}
	
	if(P.SpawnSound.Length != 0)
	{
		U.PlayASound3D(Prize,, P.SpawnSound[Rand(P.SpawnSound.Length)]);
	}
	
	if(P.SetProps.Length != 0)
	{
		for(i = 0; i < P.SetProps.Length; i++)
		{
			Prize.SetPropertyText(P.SetProps[i].Variable, P.SetProps[i].Value);
		}
	}
}

function array<int> GetNextSlotIcons(float fChanceOfRepeat) // Returns the indexes of the next 3 slot icons to pick from
{
	local int i, iFullscreenIconIndex;
	local bool bSurprise;
	local array<int> Indexes;
	
	for(i = 0; i < 3; i++)
	{
		Indexes.Insert(Indexes.Length, 1);
		Indexes[Indexes.Length - 1] = U.wRNG(GetWeightsOfPrizes(PrizesToWin));
	}
	
	iFullscreenIconIndex = -1;
	
	for(i = 0; i < 3; i++)
	{
		if(U.PercentChance(fChanceOfRepeat))
		{
			Indexes[i] = Indexes[Rand(Indexes.Length)];
		}
	}
	
	// All of this code below is just for making sure that if a prize must do a surprise fullscreen that it doesn't show 1 or 2 icons
	for(i = 0; i < 3; i++)
	{
		if(PrizesToWin[Indexes[i]].bSurpriseFullscreen && iFullscreenIconIndex == -1)
		{
			iFullscreenIconIndex = Indexes[i];
			
			break;
		}
	}
	
	if(iFullscreenIconIndex != -1)
	{
		bSurprise = true;
		
		for(i = 0; i < 3; i++)
		{
			if(Indexes[i] != iFullscreenIconIndex)
			{
				bSurprise = false;
				
				break;
			}
		}
		
		if(!bSurprise)
		{
			for(i = 0; i < 3; i++)
			{
				while(Indexes[i] == iFullscreenIconIndex)
				{
					Indexes[i] = U.wRNG(GetWeightsOfPrizes(PrizesToWin));
				}
			}
			
			for(i = 0; i < 3; i++)
			{
				if(U.PercentChance(fChanceOfRepeat))
				{
					Indexes[i] = Indexes[Rand(Indexes.Length)];
				}
			}
		}
	}
	
	return Indexes;
}

function UpdateFreeSpinsCount() // Updates all free spins counts to their next values
{
	local int i;
	
	for(i = 0; i < PrizesToWin.Length; i++)
	{
		if(PrizesToWin[i].BonusSettings.BonusType == BT_Free_Spins)
		{
			PrizesToWin[i].BonusSettings.iFreeSpinCount.Count = U.RandRangeInt(PrizesToWin[iPrizeIndex].BonusSettings.iFreeSpinCount.Min, PrizesToWin[iPrizeIndex].BonusSettings.iFreeSpinCount.Max);
		}
	}
}

auto state Inactive{}

state ProcessBet // Logic for processing a bet placed
{
	event BeginState()
	{
		if(PrizesToWin.Length == 0 || U.GetInventoryCount(class'CoinCollection') < iCostOfBet.Count || (bUseLifeSystem && iTotalLives.Count == 0))
		{
			if(ProcessBetFailSound.Length != 0)
			{
				U.PlayASound3D(self,, ProcessBetFailSound[Rand(ProcessBetFailSound.Length)]);
			}
			
			GotoState('Inactive');
			
			return;
		}
		
		fBetProcessTime.Count = U.RandRangeFloat(fBetProcessTime.Min, fBetProcessTime.Max);
		iSubtractedCoins = 0;
		iOldSubtractedCoins = 0;
		fElapsedTime = 0.0;
		
		if(bLockPlayerWhileSpinning)
		{
			U.GetPC().GotoState('StateNoPawnMove');
		}
		
		if(ProcessBetSuccessSound.Length != 0)
		{
			U.PlayASound3D(self,, ProcessBetSuccessSound[Rand(ProcessBetSuccessSound.Length)]);
		}
	}
	
	event Tick(float DeltaTime)
	{
		iSubtractedCoins = int(Lerp(fElapsedTime / fBetProcessTime.Count, 0.0, iCostOfBet.Count));
		
		U.SubtractInventory(class'CoinCollection', iSubtractedCoins - iOldSubtractedCoins);
		
		if(CostSignTexts.bCostDecrementsWithBetProcessing)
		{
			SetCostSignText(string(iCostOfBet.Count - iSubtractedCoins));
		}
		
		iOldSubtractedCoins = iSubtractedCoins;
		
		fElapsedTime += DeltaTime;
		
		if(iSubtractedCoins >= iCostOfBet.Count)
		{
			if(iSubtractedCoins != iCostOfBet.Count)
			{
				U.AddInventory(class'CoinCollection', iSubtractedCoins - iCostOfBet.Count);
				
				if(CostSignTexts.bCostDecrementsWithBetProcessing)
				{
					SetCostSignText("0");
				}
			}
			
			GotoState('SlotSpin');
		}
	}
}

state SlotSpin // Logic for slot machine spinning
{
	event BeginState()
	{
		iSpinsPerBet.Count = U.RandRangeInt(iSpinsPerBet.Min, iSpinsPerBet.Max);
		
		if(iSpinsPerBet.Count <= 0)
		{
			GotoState('Inactive');
			
			return;
		}
	}
	
	Begin:
	
	Sleep(U.RandRangeFloat(fDelayBeforeSpin.Min, fDelayBeforeSpin.Max));
	
	Respin:
	
	// Initialize pre-spin logic
	Witch.GotoState('Spinning');
	
	if(CostSignTexts.bShowSpinCountForSpinText && iSpinsPerBet.Count >= 2)
	{
		SetCostSignText(string(iSpinsPerBet.Count - 1));
	}
	else if(CostSignTexts.sSpinText != "")
	{
		SetCostSignText(CostSignTexts.sSpinText);
	}
	
	if(bUseLifeSystem)
	{
		iTotalLives.Count -= 1;
	}
	
	// Startup a spin
	if(SpinStartSound.Length != 0)
	{
		U.PlayASound3D(self,, SpinStartSound[Rand(SpinStartSound.Length)]);
	}
	
	Skins[2] = GetRandomSpinIcon();
	Skins[3] = GetRandomSpinIcon();
	Skins[4] = GetRandomSpinIcon();
	
	// Spin 1
	AmbientSound = SpinLoop1Sound;
	
	Sleep(U.RandRangeFloat(fSpinTime.Min, fSpinTime.Max));
	
	if(SpinStopSound.Length != 0)
	{
		U.PlayASound3D(self,, SpinStopSound[Rand(SpinStopSound.Length)]);
	}
	
	Skins[2] = PrizesToWin[NextSlotIconIndexes[0]].SlotMaterial;
	
	// Spin 2
	AmbientSound = SpinLoop2Sound;
	
	Sleep(U.RandRangeFloat(fSpinTime.Min, fSpinTime.Max));
	
	if(SpinStopSound.Length != 0)
	{
		U.PlayASound3D(self,, SpinStopSound[Rand(SpinStopSound.Length)]);
	}
	
	Skins[3] = PrizesToWin[NextSlotIconIndexes[1]].SlotMaterial;
	
	// Spin 3
	AmbientSound = SpinLoop3Sound;
	
	Sleep(U.RandRangeFloat(fSpinTime.Min, fSpinTime.Max));
	
	if(SpinStopSound.Length != 0)
	{
		U.PlayASound3D(self,, SpinStopSound[Rand(SpinStopSound.Length)]);
	}
	
	Skins[4] = PrizesToWin[NextSlotIconIndexes[2]].SlotMaterial;
	
	AmbientSound = none;
	
	// Spins Done
	iSpinsPerBet.Count -= 1;
	
	iPrizeIndex = GetPrizeIndex(PrizesToWin);
	
	if(!PrizesToWin[iPrizeIndex].bIgnoreMultiplier && iMatchingIcons > 2)
	{
		iRewardMultiplier = U.RandRangeInt(PrizesToWin[iPrizeIndex].iFullscreenMultiplier.Min, PrizesToWin[iPrizeIndex].iFullscreenMultiplier.Max);
	}
	else
	{
		iRewardMultiplier = 1;
	}
	
	if(iPrizeIndex > -1 && !PrizesToWin[iPrizeIndex].bBadPrize && (!PrizesToWin[iPrizeIndex].bMustFullscreen || (PrizesToWin[iPrizeIndex].bMustFullscreen && iMatchingIcons > 2)))
	{
		Witch.GotoState('Payout');
		
		if(PrizesToWin[iPrizeIndex].bDisableSlotMachine)
		{
			bDisabled = true;
		}
		
		if(iMatchingIcons > 2)
		{
			if(PrizesToWin[iPrizeIndex].bMaxWinPrize && MaxWinSound.Length != 0)
			{
				U.PlayASound3D(self,, MaxWinSound[Rand(MaxWinSound.Length)]);
			}
			else if(FullscreenSound.Length != 0)
			{
				U.PlayASound3D(self,, FullscreenSound[Rand(FullscreenSound.Length)]);
			}
		}
		else if(WinSound.Length != 0)
		{
			U.PlayASound3D(self,, WinSound[Rand(WinSound.Length)]);
		}
		
		if(iMatchingIcons > 2)
		{
			if(PrizesToWin[iPrizeIndex].bMaxWinPrize && CostSignTexts.sMaxWinText != "")
			{
				SetCostSignText(CostSignTexts.sMaxWinText);
			}
			else if(CostSignTexts.sFullscreenText != "")
			{
				SetCostSignText(CostSignTexts.sFullscreenText);
			}
		}
		else if(CostSignTexts.sWinText != "")
		{
			SetCostSignText(CostSignTexts.sWinText);
		}
		
		if(PrizesToWin[iPrizeIndex].BonusSettings.BonusType == BT_Free_Spins)
		{
			if(PrizesToWin[iPrizeIndex].BonusSettings.BonusRewardSound.Length != 0)
			{
				U.PlayASound3D(self,, PrizesToWin[iPrizeIndex].BonusSettings.BonusRewardSound[Rand(PrizesToWin[iPrizeIndex].BonusSettings.BonusRewardSound.Length)]);
			}
			
			UpdateFreeSpinsCount();
			
			iSpinsPerBet.Count += PrizesToWin[iPrizeIndex].BonusSettings.iFreeSpinCount.Count * iRewardMultiplier;
			iTotalLives.Count += PrizesToWin[iPrizeIndex].BonusSettings.iFreeSpinCount.Count * iRewardMultiplier;
			
			Sleep(PrizesToWin[iPrizeIndex].BonusSettings.fFreeSpinsDelay);
		}
		
		PrizesToWin[iPrizeIndex].iDropCount.Count = U.RandRangeInt(PrizesToWin[iPrizeIndex].iDropCount.Min, PrizesToWin[iPrizeIndex].iDropCount.Max) * iRewardMultiplier;
		
		Sleep(fPrizeDropInitialDelay);
		
		for(iCurrentPrize = 0; iCurrentPrize < PrizesToWin[iPrizeIndex].iDropCount.Count; iCurrentPrize++)
		{
			if(PrizesToWin[iPrizeIndex].FullscreenPrizeClass.Length != 0 && iMatchingIcons > 2)
			{
				iPrizeClassIndex = Rand(PrizesToWin[iPrizeIndex].FullscreenPrizeClass.Length);
				
				SpawnAPrize(PrizesToWin[iPrizeIndex], iPrizeClassIndex, true);
			}
			else
			{
				iPrizeClassIndex = Rand(PrizesToWin[iPrizeIndex].PrizeClass.Length);
				
				SpawnAPrize(PrizesToWin[iPrizeIndex], iPrizeClassIndex);
			}
			
			Sleep(fPrizeDropTime / PrizesToWin[iPrizeIndex].iDropCount.Count);
		}
	}
	else
	{
		if(LossSound.Length != 0)
		{
			U.PlayASound3D(self,, LossSound[Rand(LossSound.Length)]);
		}
		
		if(CostSignTexts.sLossText != "")
		{
			SetCostSignText(CostSignTexts.sLossText);
		}
		
		if(!PrizesToWin[iPrizeIndex].bBadPrize)
		{
			iPrizeIndex = U.wRNG(GetWeightsOfPrizes(PrizesOnLoss));
			
			if(PrizesOnLoss[iPrizeIndex].bDisableSlotMachine)
			{
				bDisabled = true;
			}
			
			PrizesOnLoss[iPrizeIndex].iDropCount.Count = U.RandRangeInt(PrizesOnLoss[iPrizeIndex].iDropCount.Min, PrizesOnLoss[iPrizeIndex].iDropCount.Max);
			
			for(iCurrentPrize = 0; iCurrentPrize < PrizesOnLoss[iPrizeIndex].iDropCount.Count; iCurrentPrize++)
			{
				iPrizeClassIndex = Rand(PrizesOnLoss[iPrizeIndex].PrizeClass.Length);
				
				SpawnAPrize(PrizesOnLoss[iPrizeIndex], iPrizeClassIndex);
				
				Sleep(fPrizeDropTime / PrizesOnLoss[iPrizeIndex].iDropCount.Count);
			}
		}
		else
		{
			PrizesToWin[iPrizeIndex].iDropCount.Count = U.RandRangeInt(PrizesToWin[iPrizeIndex].iDropCount.Min, PrizesToWin[iPrizeIndex].iDropCount.Max) * iRewardMultiplier;
			
			if(PrizesToWin[iPrizeIndex].bDisableSlotMachine)
			{
				bDisabled = true;
			}
			
			for(iCurrentPrize = 0; iCurrentPrize < PrizesToWin[iPrizeIndex].iDropCount.Count; iCurrentPrize++)
			{
				if(PrizesToWin[iPrizeIndex].FullscreenPrizeClass.Length != 0 && iMatchingIcons > 2)
				{
					iPrizeClassIndex = Rand(PrizesToWin[iPrizeIndex].FullscreenPrizeClass.Length);
					
					SpawnAPrize(PrizesToWin[iPrizeIndex], iPrizeClassIndex, true);
				}
				else
				{
					iPrizeClassIndex = Rand(PrizesToWin[iPrizeIndex].PrizeClass.Length);
					
					SpawnAPrize(PrizesToWin[iPrizeIndex], iPrizeClassIndex);
				}
				
				Sleep(fPrizeDropTime / PrizesToWin[iPrizeIndex].iDropCount.Count);
			}
		}
	}
	
	NextSlotIconIndexes = GetNextSlotIcons(fRepeatIconChance.Count);
	
	if(iSpinsPerBet.Count > 0 && (!bUseLifeSystem || (bUseLifeSystem && iTotalLives.Count > 0)))
	{
		goto 'Respin';
	}
	else
	{
		if(bLockPlayerWhileSpinning)
		{
			U.GetPC().GotoState('PlayerWalking');
		}
		
		if(!bUseLifeSystem || (bUseLifeSystem && iTotalLives.Count > 0) || bDisabled)
		{
			Witch.GotoState('Active');
			
			SetCostSignText(string(iCostOfBet.Count));
		}
		else
		{
			Witch.bDisabled = true;
			Witch.GotoState('Inactive');
			
			if(CostSignTexts.sOutOfServiceText != "")
			{
				SetCostSignText(CostSignTexts.sOutOfServiceText);
			}
			else
			{
				SetCostSignText(string(iCostOfBet.Count));
			}
		}
		
		GotoState('Inactive');
	}
}

state DriveThroughIdle{}

state DriveThroughTaunt{}


defaultproperties
{
	PrizesToWin(0)=(PrizeClass=(class'MCoin'),iDropWeight=75,iDropCount=(Min=15,Max=30),iFullscreenMultiplier=(Min=3,Max=5),SlotMaterial=Texture'SlotCoin',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(1)=(PrizeClass=(class'MCoinStack'),iDropWeight=45,iDropCount=(Min=2,Max=3),iFullscreenMultiplier=(Min=3,Max=6),SlotMaterial=Texture'SlotCoinStack',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(2)=(PrizeClass=(class'MMoneyBag'),iDropWeight=1,iDropCount=(Min=5,Max=5),iFullscreenMultiplier=(Min=70,Max=70),SlotMaterial=Texture'SlotMoneyBag',bMaxWinPrize=true,fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(3)=(PrizeClass=(class'MEnergyBar'),iDropWeight=35,iDropCount=(Min=1,Max=1),iFullscreenMultiplier=(Min=2,Max=5),SlotMaterial=Texture'SlotEnergyBar',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(4)=(PrizeClass=(class'MEnergyKeg'),iDropWeight=15,iDropCount=(Min=1,Max=1),iFullscreenMultiplier=(Min=2,Max=2),SlotMaterial=Texture'SlotEnergyKeg',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(5)=(PrizeClass=(class'MShamrock'),iDropWeight=5,iDropCount=(Min=1,Max=1),iFullscreenMultiplier=(Min=2,Max=2),SlotMaterial=Texture'SlotShamrock',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(6)=(PrizeClass=(class'MShrekPoster1SH',class'MShrekPoster2SH',class'MShrekPoster3SH',class'MShrekPoster4SH',class'MShrekPoster5SH',class'MShrekPoster6SH',class'MShrekPoster7SH',class'MShrekPoster8SH',class'MShrekPoster9SH',class'MShrekPoster10SH',class'MShrekPoster11SH',class'MShrekPoster12SH'),iDropWeight=5,iDropCount=(Min=1,Max=1),iFullscreenMultiplier=(Min=2,Max=2),SlotMaterial=Texture'SlotPoster',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(7)=(PrizeClass=(class'MPotion1SH'),iDropWeight=3,iDropCount=(Min=1,Max=2),iFullscreenMultiplier=(Min=2,Max=4),SlotMaterial=Texture'SlotPotion1',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(8)=(PrizeClass=(class'MPotion2SH'),iDropWeight=3,iDropCount=(Min=1,Max=2),iFullscreenMultiplier=(Min=2,Max=4),SlotMaterial=Texture'SlotPotion2',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(9)=(PrizeClass=(class'MPotion3SH'),iDropWeight=3,iDropCount=(Min=1,Max=2),iFullscreenMultiplier=(Min=2,Max=4),SlotMaterial=Texture'SlotPotion3',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(10)=(PrizeClass=(class'MPotion4SH'),iDropWeight=3,iDropCount=(Min=1,Max=2),iFullscreenMultiplier=(Min=2,Max=4),SlotMaterial=Texture'SlotPotion4',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(11)=(PrizeClass=(class'MPotion5SH'),iDropWeight=3,iDropCount=(Min=1,Max=2),iFullscreenMultiplier=(Min=2,Max=4),SlotMaterial=Texture'SlotPotion5',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(12)=(PrizeClass=(class'MPotion6SH'),iDropWeight=3,iDropCount=(Min=1,Max=2),iFullscreenMultiplier=(Min=2,Max=4),SlotMaterial=Texture'SlotPotion6',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(13)=(PrizeClass=(class'MPotion7SH'),iDropWeight=3,iDropCount=(Min=1,Max=2),iFullscreenMultiplier=(Min=2,Max=4),SlotMaterial=Texture'SlotPotion7',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(14)=(PrizeClass=(class'MPotion8SH'),iDropWeight=3,iDropCount=(Min=1,Max=2),iFullscreenMultiplier=(Min=2,Max=4),SlotMaterial=Texture'SlotPotion8',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(15)=(PrizeClass=(class'MPotion9SH'),iDropWeight=3,iDropCount=(Min=1,Max=2),iFullscreenMultiplier=(Min=2,Max=4),SlotMaterial=Texture'SlotPotion9',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(16)=(PrizeClass=(class'MPotionHEA'),iDropWeight=2,iDropCount=(Min=1,Max=1),iFullscreenMultiplier=(Min=2,Max=2),SlotMaterial=Texture'SlotPotionHEA',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(17)=(PrizeClass=(class'MStrengthPotion'),iDropWeight=5,iDropCount=(Min=1,Max=1),iFullscreenMultiplier=(Min=2,Max=2),SlotMaterial=Texture'Shrek2_Univ_Tex.PickUps.slot5',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(18)=(PrizeClass=(class'MMicePotionWeak',class'MMicePotionWeak',class'MMicePotionStrong'),iDropWeight=5,iDropCount=(Min=1,Max=1),iFullscreenMultiplier=(Min=2,Max=2),SlotMaterial=Texture'Shrek2_Univ_Tex.PickUps.slot7',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(19)=(PrizeClass=(class'MPixiePotionWeak',class'MPixiePotionWeak',class'MPixiePotionStrong'),iDropWeight=5,iDropCount=(Min=1,Max=1),iFullscreenMultiplier=(Min=2,Max=2),SlotMaterial=Texture'SlotFairy',fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesToWin(20)=(iDropWeight=10,iFullscreenMultiplier=(Min=5,Max=5),SlotMaterial=Texture'SlotWitch',BonusSettings=(BonusType=BT_Free_Spins,iFreeSpinCount=(Min=2,Max=2),fFreeSpinsDelay=3.0,BonusRewardSound=(Sound'Items.pickup_HeroBar')))
	PrizesOnLoss(0)=(PrizeClass=(class'MCoin'),iDropWeight=10,iDropCount=(Min=3,Max=7),SpawnSound=(Sound'UI.PotionUI_coin_countdown'),fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesOnLoss(1)=(PrizeClass=(class'MCoinStack'),iDropWeight=2,iDropCount=(Min=1,Max=2),fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	PrizesOnLoss(2)=(PrizeClass=(class'MMoneyBag',class'MCoin',class'MCoinStack'),iDropWeight=1,iDropCount=(Min=1,Max=1),fThrowVelocityMultiplier=(Min=1.0,Max=1.0),fThrowLengthMultiplier=(Min=1.0,Max=1.0),fThrowHeightMultiplier=(Min=1.0,Max=1.0),fThrowDeviationLengthMultiplier=0.9)
	iCostOfBet=(Min=25,Max=25)
	iSpinsPerBet=(Min=1,Max=1)
	fBetProcessTime=(Min=1.0,Max=1.0)
	fDelayBeforeSpin=(Min=0.3,Max=0.3)
	fSpinTime=(Min=1.0,Max=1.0)
	fRepeatIconChance=(Min=0.25,Max=0.25)
	fSlotSpinRate=(Min=1.0,Max=1.0)
	SlotSpinMaterials(0)=Texture'SlotCoinSpin'
	SlotSpinMaterials(1)=Texture'SlotCoinStackSpin'
	SlotSpinMaterials(2)=Texture'SlotEnergyBarSpin'
	SlotSpinMaterials(3)=Texture'SlotEnergyKegSpin'
	SlotSpinMaterials(4)=Texture'SlotMoneyBagSpin'
	SlotSpinMaterials(5)=Texture'SlotPotion1Spin'
	SlotSpinMaterials(6)=Texture'SlotPotion2Spin'
	SlotSpinMaterials(7)=Texture'SlotPotion3Spin'
	SlotSpinMaterials(8)=Texture'SlotPotion4Spin'
	SlotSpinMaterials(9)=Texture'SlotPotion5Spin'
	SlotSpinMaterials(10)=Texture'SlotPotion6Spin'
	SlotSpinMaterials(11)=Texture'SlotPotion7Spin'
	SlotSpinMaterials(12)=Texture'SlotPotion8Spin'
	SlotSpinMaterials(13)=Texture'SlotPotion9Spin'
	SlotSpinMaterials(14)=Texture'SlotShamrockSpin'
	SlotSpinMaterials(15)=Texture'SlotWitchSpin'
	iCostSignTextOffset(1)=-34
	iCostSignTextOffset(3)=-29
	iCostSignTextOffset(5)=-24
	iCostSignTextOffset(7)=-17
	CostSignTexts=(sWinText="WIN",sFullscreenText="BIG",sMaxWinText="MAX",sLossText="X",sSpinText="GO",bCostDecrementsWithBetProcessing=true,bShowSpinCountForSpinText=true)
	fPrizeDropTime=1.50
	fPrizeDropInitialDelay=1.50
	CostSignFontType(0)=F_FontNeuzeit37
	CostSignFontType(1)=F_FontNeuzeit29
	CostSignFontType(2)=F_FontNeuzeit24
	CostSignFontType(3)=F_FontNeuzeit17
	CostSignTextColor=(B=210,G=40,R=210,A=255)
	WitchSettings=(fAppearDistance=512.0,WitchMeshes=(SkeletalMesh'EnvAnims.VendingWitch'),nAppearAnim="Popup",nDisappearAnim="PopDown",nIdleAnim="casualidle",nSpinIdleAnim="Idle",nPayoutAnim="Reward",WitchAppearSound=(Sound'Items.slot_talkie_popup'),WitchDisappearSound=(Sound'Items.slot_door_close'))
	SpinLoop1Sound=Sound'Items.slot_spinloop1'
	SpinLoop2Sound=Sound'Items.slot_spinloop2'
	SpinLoop3Sound=Sound'Items.slot_spinloop3'
	ProcessBetSuccessSound(0)=Sound'Items.slot_coin_deposit'
	ProcessBetFailSound(0)=Sound'Items.slot_stop'
	SpinStartSound(0)=Sound'Items.slot_start'
	SpinStopSound(0)=Sound'Items.slot_stop'
	WinSound(0)=Sound'Items.slot_win_fanfare'
	FullscreenSound(0)=Sound'Items.slot_win_fanfare'
	MaxWinSound(0)=Sound'soundeffects.fanfare'
	LossSound(0)=Sound'UI.PotionUI_cancel'
	Skins(0)=Texture'SlotEmptyCostSign'
	Skins(1)=Texture'Shrek2_Univ_Tex.PickUps.stand'
	Skins(2)=Texture'SlotCoin'
	Skins(3)=Texture'SlotMoneyBag'
	Skins(4)=Texture'SlotEnergyKeg'
	bCouldBeAttacked=false
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'Shrek2_Univ_SM.Witch_SlotShape'
	Mesh=none
	DrawScale=0.6
	CollisionRadius=45.0
	CollisionHeight=80.0
	bCanBeBaseForPawns=true
}