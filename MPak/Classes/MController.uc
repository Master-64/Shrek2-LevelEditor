// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MController extends ShrekController
	Config(MPak);


var float fAnnTime, fTimeAfterLoading, fPlayASoundVolume, fTeleportDist;
var byte AnnColorR, AnnColorG, AnnColorB;
var name NewState;
var bool bCanTPBack, bModifyHealthSFX, bModifyHealthKnockback, bTPBackOncePerTP, bAlwaysGlitchedTripleJump, bShowCrosshair, bOldbShowCrosshair;
var vector OldTPLoc;
var int iTPRetryAttempts, iSummonRetryAttempts;
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
	
	Log(class'MVersion'.default.ModName @ class'MVersion'.default.Version @ "-- A pawn is using Master's Controller, made by Master_64");
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

event PlayerTick(float DeltaTime)
{
	local KWGame.EMaterialType MaterialType;
	local name animseq;
	local int NumAnims;
	
	if(Pawn == none)
	{
		return;
	}
	
	if(Pawn.IsA('Donkey') || Pawn.IsA('MDonkey'))
	{
		if(Pawn.Velocity != U.Vec(0.0, 0.0, 0.0))
		{
			animseq = KWPawn(Pawn).GetAnimSequence();
			
			for(NumAnims = 0; NumAnims < KWPawn(Pawn).IdleAnims.Length; NumAnims++)
			{
				if(animseq == 'bored3a' || animseq == 'bored3b' || animseq == 'bored3c')
				{
					Pawn.PlayAnim(KWPawn(Pawn).IdleAnimName);
					
					break;
				}
			}
		}
	}
	
	SHHeroPawn(Pawn).UseSHJumpMagnet();
	MaterialType = SHHeroPawn(Pawn).TraceMaterial(Pawn.Location, 1.5 * Pawn.CollisionHeight);
	
	if(MaterialType != MTYPE_Wet && SHHeroPawn(Pawn).bInWater)
	{
		SHHeroPawn(Pawn).HeroOutOfWater();
	}
	
	if(MaterialType != MTYPE_QuickSand && SHHeroPawn(Pawn).bInQuicksand)
	{
		SHHeroPawn(Pawn).HeroOutOfQuicksand();
	}
	
	if(MaterialType == MTYPE_QuickSand)
	{
		if(!SHHeroPawn(Pawn).bInQuicksand)
		{
			SHHeroPawn(Pawn).HeroInQuicksand();
		}		
	}
	else if(MaterialType == MTYPE_Wet)
	{
		if(!SHHeroPawn(Pawn).bInWater)
		{
			SHHeroPawn(Pawn).HeroInWater();
		}
	}
	
	CheckForCameraBlocking(DeltaTime);
	
	if(KWPawn(Pawn).CanDoubleJump() && bPressedJump)
	{
		KWPawn(Pawn).DoDoubleJump(false);
	}
	
	if(bFire == 1 && !bLastPressedFire)
	{
		KWPawn(Pawn).PressedFire();
	}
	
	if(bFire == 0 && bLastPressedFire)
	{
		if(Cursor != none && Pawn != none)
		{
			Cursor.ReleasedFire();
			KWPawn(Pawn).ReleasedFire();
		}
	}
	
	if(bAltFire == 0 && bLastPressedAltFire)
	{
		if(Cursor != none && Pawn != none)
		{
			Cursor.ReleasedAltFire();
			KWPawn(Pawn).ReleasedFire();
		}
	}
	
	bLastPressedFire = bFire != 0;
	bLastPressedAltFire = bAltFire != 0;
	
	if(bShowCrosshair != bOldbShowCrosshair)
	{
		if(bShowCrosshair && Cursor == none)
		{
			makeCursor();
		}
		else if(!bShowCrosshair && Cursor != none)
		{
			U.FancyDestroy(Cursor);
		}
	}
	
	bOldbShowCrosshair = bShowCrosshair;
	
	super.PlayerTick(DeltaTime);
}

event NotifyJumpApex()
{
	if(!bAlwaysGlitchedTripleJump)
	{
		Pawn.PlayFalling();
	}
}

event PostLoadGame(bool bLoadFromSaveGame)
{
	if(bLoadFromSaveGame)
	{
		AddCheats();
	}
}

function makeCursor()
{
	if(bShowCrosshair && Cursor == none)
	{
		Cursor = Spawn(DefaultSelectCursorType, self);
	}
}


defaultproperties
{
	fTeleportDist=10000.0
	fAnnTime=1.0
	AnnColorR=255
	AnnColorG=255
	AnnColorB=255
	fPlayASoundVolume=0.4
	bModifyHealthSFX=true
	bModifyHealthKnockback=true
	iTPRetryAttempts=28
	iSummonRetryAttempts=75
	MinHitWall=-1.0
	AcquisitionYawRate=20000
	PlayerReplicationInfoClass=class'PlayerReplicationInfo'
	bHidden=true
	bHiddenEd=true
	bAlwaysMouseLook=true
	bZeroRoll=true
	bDynamicNetSpeed=true
	AnnouncerVolume=4
	MaxResponseTime=0.70
	OrthoZoom=40000.0
	CameraDist=9.0
	DesiredFOV=85.0
	DefaultFOV=85.0
	FlashScale=(X=1.0,Y=1.0,Z=1.0)
	MaxTimeMargin=0.35
	ProgressTimeOut=8.0
	QuickSaveString="Quick Saving"
	NoPauseMessage="Game is not pauseable"
	ViewingFrom="Now viewing from"
	OwnCamera="Now viewing from own camera"
	LocalMessageClass=class'LocalMessage'
	EnemyTurnSpeed=45000
	SpectateSpeed=600.0
	DynamicPingThreshold=400.0
	bEnablePickupForceFeedback=true
	bEnableWeaponForceFeedback=true
	bEnableDamageForceFeedback=true
	bEnableGUIForceFeedback=true
	bForceFeedbackSupported=true
	FovAngle=85.0
	Handedness=1.0
	bIsPlayer=true
	bCanOpenDoors=true
	bCanDoSpecial=true
	NetPriority=3.0
	bTravel=true
	bRotateToDesired=true
	bUseBaseCam=true
	bMovePawn=true
	bUseCameraAxesForPawnMove=true
	bShouldRotate=true
	bArrowKeysYaw=true
	strGameMenu="KWGame.MainMenuPage"
	strGameMenuSave="KWGame.MainMenuPage"
	bBehindView=true
	bNotifyApex=true
	RotationRate=(Pitch=4096,Yaw=45000,Roll=3072)
	bPauseWithSpecial=false
	PotionMusicHandle=-1
	Save0Image="storybookanimTX.box_button"
	Save1Image="storybookanimTX.box_button"
	Save2Image="storybookanimTX.box_button"
	Save3Image="storybookanimTX.box_button"
	Save4Image="storybookanimTX.box_button"
	Save5Image="storybookanimTX.box_button"
	DefaultSelectCursorType=class'MSelectCursor'
	CameraClass=class'ShCam'
	rSnapRotation=(Pitch=-1,Yaw=0,Roll=0)
	rSnapRotationSpeed=(Pitch=7,Yaw=0,Roll=0)
	bDoOpacityForCamera=true
	CheatClass=class'MCheatManager'
	InputClass=class'SHPlayerInput'
	IngameWantedPosterPopUpImage="SH_Menu.WantedPosters.Full_Want_Shrek"
	bFadeInWantedPoster=true
	minsfx=Sound'UI.page_turn'
	bFirstCoin=true
}