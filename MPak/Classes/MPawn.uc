// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// All variables here must be modified with SetPropertyText() and GetPropertyText()
// var(Movement) bool bCanJump;
// var(Movement) bool bCanWalk;
// var(Movement) bool bCanSwim;
// var(Movement) bool bCanFly;
// var(Movement) bool bCanClimbLadders;
// var(Movement) bool bCanStrafe;
// var(Movement) bool bCanDoubleJump;
// var(Movement) bool bAvoidLedges;
// var(Movement) bool bStopAtLedges;
// var() bool bCanBeBaseForPawns;
// var(Movement) float WaterSpeed;
// var(Movement) float AirSpeed;
// var(Movement) float LadderSpeed;
// var(Movement) float AccelRate;
// var(Movement) float JumpZ;
// var(Health) travel float Health;
// var(AI) class<AIController> ControllerClass;
// var(AnimTweaks) float BaseMovementRate;
// var(Animation) name MovementAnims[4];
// var(PlayerControl) bool bIsMainPlayer;
// var bool bUseAccelRateForWalkingBrake;
// var float fMinFloorZ;
// var(Skeletal) name MouthBone;
// var const Pawn nextPawn;
// var const Pawn nextSpecialPawn;
// var bool bSpecialPawn;
// var(AI) bool bUseRealTimePathCheck;
// var bool bLumosOn;
// var bool bLumosOff;
// var float fLumosRadius;
// var(Movement) float StepHeight;
// var(Movement) float StepWidth;
// var float MaxMountHeight;
// var bool bUseStaticMeshSizeForMount;
// var(Movement) float GroundFrictionOverride;
// var(Movement) bool bOverrideGroundFriction;
// var(Movement) float FlyFrictionOverride;
// var(Movement) bool bOverrideFlyFriction;


class MPawn extends SHPawn
	Placeable
	Config(MPak);


var() bool bModifiedBumplines;
// var() bool bCanMount, bCannotJump, bDisableLandBobbing, bDisableFallDamage, bModifiedBumplines;
var() float fBlinkChance;
// var() float fLandingBobMultiplier;
var(Animation) name _MovementAnims[4];
var(AnimTweaks) float _BaseMovementRate;
var(Routing) array<string> Routes;
var name nPreCutPossessState[2];
var class<AIController> AIC;
var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var array<KWHudItem> HudItems;
var BaseCam Cam;
var MUtils U;


event PreBeginPlay()
{
	if(bool(GetPropertyText("bSpecialPawn")))
	{
		AddSpecialPawn();
	}
	
	AddPawn();
	
	if(!bGameRelevant && Level.NetMode != NM_Client && !Level.Game.BaseMutator.CheckRelevance(self))
	{
		Destroy();
	}
	
	if(bool(GetPropertyText("bChangeOpacityForCamera")) && U.IsSoftwareRendering())
	{
		SetPropertyText("bChangeOpacityForCamera", "False");
		
		bBlocksCamera = true;
	}
	
	Instigator = self;
	DesiredRotation = Rotation;
	
	if(bDeleteMe)
	{
		return;
	}
	
	if(BaseEyeHeight == 0.0)
	{
		BaseEyeHeight = 0.8 * CollisionHeight;
	}
	
	EyeHeight = BaseEyeHeight;
	
	if(MenuName == "")
	{
		MenuName = GetItemName(string(Class));
	}
}

event PostBeginPlay()
{
	local Actor A;
	local AIScript AIS;
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
	
	AnimBlendParams(ATTACKCHANNEL_LOWER, 0.0, 0.0, 0.0, LOWER_BODY_BONE);
	AnimBlendParams(ATTACKCHANNEL_UPPER, 0.0, 0.0, 0.0, UPPER_BODY_BONE);
	AnimBlendParams(ARMCHANNEL_RIGHT, 0.0, 0.0, 0.0, RIGHT_ARM_BONE);
	AnimBlendParams(ARMCHANNEL_LEFT, 0.0, 0.0, 0.0, LEFT_ARM_BONE);
}

event Tick(float DeltaTime)
{
	PC = U.GetPC();
	HP = U.GetHP();
	
	if(bIsSliding)
	{
		TickSliding(DeltaTime);
	}
	
	if(bCanBlink)
	{
		fBlinkingTime -= DeltaTime;
		
		if(U.PercentChance(fBlinkChance) && fBlinkingTime <= 0.0)
		{
			StartBlinkAnimation();
		}
		
		if(fBlinkingTime < 0.0)
		{
			StopBlinkAnimation();
		}
	}
	
	fDespawnTime += DeltaTime;
	
	if(fDespawnTime >= 1.0)
	{
		fDespawnTime = 0.0;
		
		if(bDespawnable && bDespawned)
		{
			if(!U.GetCam().CameraCanSeeYou(Location))
			{
				Destroy();
			}
		}
	}
	
	if(IsLeadChar())
	{
		if(VSize2d(Acceleration) > 5.0 || vOldLocation != Location)
		{
			SetTargetLocations();
		}
		
		bUseLastLocationArray = true;
	}
	
	if(bUseLastLocationArray)
	{
		TickLastLocationArray(DeltaTime);
	}
	
	if(Acceleration.X != 0.0 || Acceleration.Y != 0.0)
	{
		if(PawnAccelerationTimer == 0.0)
		{
			OnStartedAccelerating();
		}
		
		PawnMotionlessTimer = 0.0;
		PawnAccelerationTimer += DeltaTime;
	}
	else
	{
		if(PawnMotionlessTimer == 0.0)
		{
			OnStoppedAccelerating();
		}
		
		PawnAccelerationTimer = 0.0;
		PawnMotionlessTimer += DeltaTime;
	}
	
	if(Physics == PHYS_Walking)
	{
		vLastGroundPosition = Location;
		vYawAtLastGroundPosition = Rotation.Yaw;
		
		if(WaterRipples != none)
		{
			PlayWaterRipples(DeltaTime);
		}
	}
	
	if(ExtraAccelTimer > 0.0)
	{
		ExtraAccelTimer -= DeltaTime;
		
		if(ExtraAccelTimer <= 0.0)
		{
			ExtraAccelTimer = 0.0;
			ConstantAcceleration = U.Vec(0.0, 0.0, 0.0);
		}
	}
	
	if(AdditionalPrePivotDest != AdditionalPrePivot)
	{
		TickPrePivotTweening(DeltaTime);
	}
	
	if(!bUnableToBounce && BouncePadHit != none && U.GetHealth(self) > 0.0)
	{
		DoJump(true);
		BouncePadHit.OnBounce(self);
		OnBounceExtra(BouncePadHit.bCanMoveWhileJumping);
		BouncePadHit = none;
	}
	
	if(bTweenGroundSpeed)
	{
		TickGroundSpeedTweening(DeltaTime);
	}
	
	if(Physics == PHYS_Falling && bFallingAutoDecel2d && Acceleration == U.Vec(0.0, 0.0, 0.0) && VSize2d(Velocity) > 10.0)
	{
		Velocity -= (normal2d(Velocity) * 400.0 * DeltaTime);
	}
	
	if(bControlsCameraRot && PC.bUseBaseCam)
	{
		U.GetCam().ApplyInput(DeltaTime);
	}
	
	vOldLocation = Location;
	
	ProcessMovementAnims();
}

function ProcessMovementAnims()
{
	local byte bDirection;
	
	bDirection = GetRunningDirection();
	
	if(bDirection > -1)
	{
		LoopAnim(_MovementAnims[bDirection], 1.0, 0.2, 0);
	}
	else
	{
		PlayIdle();
	}
}

function byte GetRunningDirection()
{
	PC = U.GetPC();
	
	if(PC.aBaseY > 0.0)
	{
		return 0; // Forward
	}
	else if(PC.aBaseY < 0.0)
	{
		return 1; // Backward
	}
	else if(PC.aStrafe < 0.0)
	{
		return 2; // Left
	}
	else if(PC.aStrafe > 0.0)
	{
		return 3; // Right
	}
	else
	{
		return -1; // Not moving
	}
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

event bool Mount(vector Delta, Actor A)
{
	local MountVolume mv;
	local int i;
	local vector HitLocation, HitNormal;
	local Actor aTrace;

	if(aHolding != none)
	{
		return false;
	}
	
	if(IsInState('Mounting') || IsInState('MountFinish') || IsInState('MountHanging'))
	{
		return false;
	}
	
	for(i = 0; i < Touching.Length; i++)
	{
		if(Touching[i].IsA('ShimmyNode'))
		{
			if(ShimmyNode(Touching[i]).bFallDown)
			{
				return false;
			}
		}
	}
	
	if(A == none)
	{
		A = Level;		
	}
	else if(A.IsA('LevelInfo'))
	{
		foreach TouchingActors(class'MountVolume', mv)
		{
			break;
		}
		
		if(mv == none)
		{
			return false;
		}
	}
	else if(!A.bIsMountable)
	{
		return false;
	}

	bDoingMountThatTCsShouldFollow = false;
	
	if(IsLeadChar() && Physics == PHYS_Falling)
	{
		for(i = 0; i < 2; i++)
		{
			if(TrailingChar[i] != none && ((Location + Delta - TrailingChar[i].Location) * Vect(1.0, 1.0, 0.0) Dot (Delta * Vect(1.0, 1.0, 0.0))) > 0.0)
			{
				TrailingChar[i].KWAIController.JumpToLeadCharLoc(true, Delta);
				
				bDoingMountThatTCsShouldFollow = true;
			}
		}
	}
	
	MountDestination = Location + Delta;
	
	if(bUseNewMountCode)
	{
		aTrace = Trace(HitLocation, HitNormal, MountDestination - Vect(0.0, 0.0, 100.0), MountDestination, true, U.Vec(CollisionRadius, CollisionRadius, CollisionHeight));
		
		if(aTrace != none)
		{
			MountDestination.Z = HitLocation.Z + 0.8;
		}
	}
	
	MountBase = A;
	SetBase(A);
	Velocity = Vect(0.0, 0.0, 0.0);
	Acceleration = Vect(0.0, 0.0, 0.0);
	bMountFinished = false;
	
	GotoState('Mounting');
	
	return true;
}

event PreSaveGame()
{
	bInitializeAnimation = false;
	
	return;
}

event PostSaveGame()
{
	return;
}

event PostLoadGame(bool bLoadFromSaveGame)
{
	if(bLoadFromSaveGame)
	{
		KWRemoveShadow();
		KWAddShadow();
		bInitializeAnimation = false;
		PlayWaiting();
	}
}

function float DeliverLocalizedDialog(string DlgID, bool bPlaySound, optional float fDisplayDuration, optional string IntFileName, optional string ExplicitString, optional bool No3D, optional float fVolume, optional bool bNoSubtitle, optional bool bUseSlotIn, optional Actor.ESoundSlot SlotIn)
{
	local float fReturn;
	
	fReturn = super.DeliverLocalizedDialog(DlgID, bPlaySound, fDisplayDuration, IntFileName, ExplicitString, No3D, fVolume, bNoSubtitle, bUseSlotIn, SlotIn);
	
	if(bModifiedBumplines)
	{
		U.LipSyncDialog(self, Sound(DynamicLoadObject("AllDialog." $ DlgID, class'Sound')), Localize("all", DlgID, "HPdialog"));
	}
	
	return fReturn;
}


defaultproperties
{
	QuicksandGroundSpeed=150.0
	LOWER_BODY_BONE=body_root_joint
	UPPER_BODY_BONE=body_waist_joint
	RIGHT_ARM_BONE=body_r_clavicle_joint
	LEFT_ARM_BONE=body_l_clavicle_joint
	ATTACKCHANNEL_LOWER=12
	ATTACKCHANNEL_UPPER=14
	ARMCHANNEL_RIGHT=40
	ARMCHANNEL_LEFT=41
	WaterGroundSpeed=150.0
	SpecialAttackTime=20.0
	PickUpType=-1
	WadeAnims(0)=wade
	WadeAnims(1)=wadebackward
	WadeAnims(2)=wadeleft
	WadeAnims(3)=waderight
	SpeedOpacityForFadeOut=0.5
	CurrentOpacityForFadeOut=1
	bDropShadowOnActors=true
	bAllFallingMountsUseBigClimb=true
	BigClimbStart=jumptoclimb
	BigClimbEnd=climb
	BigClimbOffset=190.0
	BigShimmyOffset=190.0
	StepUpOffset=50.0
	bAbleToDoShimmy=true
	HangIdleAnim=hangidle
	JumpToHangAnim=jumptohang
	ShimmyRightAnim=shimmyright
	ShimmyLeftAnim=shimmyleft
	ShimmyRightEndAnim=shimmyrightend
	ShimmyLeftEndAnim=shimmyleftend
	HangToLandAnim=hangtoland
	StepUpAnim=climb
	StepUpNoTransAnim=climb2
	TAKEHITBONE=body_root_joint
	bCanClimbLadders=false
	SoundRadius=300.0
	fAccurateThrowingTime=1.0
	fThrowVelocity=400.0
	CameraSetStandard=(vLookAtOffset=(X=0.0,Y=0.0,Z=70.0),fLookAtDistance=150.0,fLookAtHeight=0.0,fRotTightness=8.0,fRotSpeed=15.0,fMoveTightness=(X=0.0,Y=0.0,Z=0.0),fMoveSpeed=0.0,fMaxMouseDeltaX=20000.0,fMaxMouseDeltaY=10000.0,fMinPitch=-14000.0,fMaxPitch=14000)
	CameraSetCutScene=(vLookAtOffset=(X=0.0,Y=0.0,Z=0.0),fLookAtDistance=128.0,fLookAtHeight=0.0,fRotTightness=2.0,fRotSpeed=5.0,fMoveTightness=(X=0.0,Y=0.0,Z=0.0),fMoveSpeed=0.0,fMaxMouseDeltaX=20000.0,fMaxMouseDeltaY=10000.0,fMinPitch=-14000.0,fMaxPitch=14000)
	CameraSetFree=(vLookAtOffset=(X=0.0,Y=0.0,Z=0.0),fLookAtDistance=0.0,fLookAtHeight=0.0,fRotTightness=10.0,fRotSpeed=5.0,fMoveTightness=(X=0.0,Y=0.0,Z=0.0),fMoveSpeed=600.0,fMaxMouseDeltaX=20000.0,fMaxMouseDeltaY=10000.0,fMinPitch=-14000.0,fMaxPitch=14000)
	CameraSetBoss=(vLookAtOffset=(X=0.0,Y=0.0,Z=100.0),fLookAtDistance=170.0,fLookAtHeight=0.0,fRotTightness=0.0,fRotSpeed=0.0,fMoveTightness=(X=0.0,Y=0.0,Z=0.0),fMoveSpeed=0.0,fMaxMouseDeltaX=0.0,fMaxMouseDeltaY=0.0,fMinPitch=0.0,fMaxPitch=0)
	CameraSetFollow=(vLookAtOffset=(X=0.0,Y=0.0,Z=70.0),fLookAtDistance=150.0,fLookAtHeight=0.0,fRotTightness=0.0,fRotSpeed=15.0,fMoveTightness=(X=0.0,Y=0.0,Z=0.0),fMoveSpeed=0.0,fMaxMouseDeltaX=20000.0,fMaxMouseDeltaY=10000.0,fMinPitch=-14000.0,fMaxPitch=14000)
	fDesiredCamDistFromWall=15.0
	fCameraRollModifier=1.0
	bDoWorldCollisionCheck=true
	bPrefersBehind=true
	DefaultPlayerControllerClass=class'KWHeroController'
	bTakesDamage=true
	bTakesDamageCheat=true
	AdditionalPrePivotTweenSpeed=100.0
	ConstantRotationRate=(Pitch=0,Yaw=16000,Roll=0)
	ConstantRotationAccel=16000.0
	bRelevantToTriggersWhileInCutscene=true
	BlobShadowLightDistance=380.0
	WalkAnims(0)=Walk
	WalkAnims(1)=Walk
	WalkAnims(2)=Walk
	WalkAnims(3)=Walk
	CompanionWalkAnim=Walk
	BigClimbStartNoTrans=climb96startNoTrans
	BigClimbEndNoTrans=climb96endNoTrans
	Climb32NoTransAnimName=climb32NoTrans
	Climb64NoTransAnimName=climb64NoTrans
	BigClimbAnimRate_Temp=1.0
	Climb32Offset=32.0
	Climb64Offset=64.0
	IdleTiredAnimName=Idle
	IdleAnimName=Idle
	SlideAnimName=SlideIdle
	SlideLeftAnimName=SlideIdle
	SlideRightAnimName=SlideIdle
	SlideAccelRate=100.0
	GroundSlideSpeed=600.0
	GroundSlideSpeedFast=850.0
	GroundSlideSpeedSlow=400.0
	fSlideSkateForce=200.0
	SlideYawChangeRate=14000
	SlidingAmbientMinPitch=48
	SlidingAmbientMaxPitch=115
	SlidingAmbientVolume=100
	SlideLeaveTrackDieTimeout=2.0
	PickupAnimRate=1.0
	GroundRunSpeed=220.0
	GroundWalkSpeed=90.0
	GroundCarrySpeed=220.0
	TweenGroundSpeedRate=300.0
	fLandingTweenInTime=0.1
	fLandingTweenOutTime=1
	fLandingAnimRate=0.5
	fJumpTweenTime=0.2
	fJumpAnimRate=1.0
	fIdleAnimRate=1.0
	fIdleAnimTweenTime=0.5
	fAirStillAnimRate=1.0
	fAirStillAnimTweenTime=0.1
	RootBone=body_root
	HeadBone=Body_Head
	NeckBone=Body_Neck
	HeadRotElement=RE_RollPos
	bAcceptAllInventory=true
	FootstepVolume=1.0
	DefaultGroundMovementState=StateGroundMovement
	DefaultAirMovementState=StateAirMovement
	MountCylScaleMag=2.0
	bUseCollisionDuringMount=true
	OnTrig_SoundVolume=1.0
	LeadingActorDistance=300.0
	LastLocationArrayMaxLen=15
	fChanceToPlayIdle=0.2
	DegreeOffsetFromBehind=70.0
	DegreeOffsetFromBehindFight=60.0
	DistanceOffset=70.0
	DistanceOffsetFight=100.0
	IdleMonitorTimeOut=1.5
	AccelMonitorTimeOut=1.0
	IdleWanderRadius=96.0
	WanderPauseOdds=0.4
	WanderPauseDurationMin=1.0
	WanderPauseDurationMax=3.0
	WanderDistance=72.0
	WanderTowardsLeadCharDistance=40.0
	IdleRotationRateScale=0.5
	fIdleToleranceOffset=40.0
	fDoubleJumpHeight=96.0
	fJumpHeight=64.0
	fJumpDist=192.0
	ShimmySpeed=70.0
	RunningGameSlot=9998
	ControllerClass=none
	_MovementAnims(0)=run
	_MovementAnims(1)=Run_Back
	_MovementAnims(2)=Run_Left
	_MovementAnims(3)=Run_Right
	TurnLeftAnim=StandTurnLeft135
	TurnRightAnim=StandTurnRight135
	Physics=PHYS_Walking
	bStasis=false
	bUseCylinderCollision=true
	RotationRate=(Pitch=4096,Yaw=80000,Roll=3072)
	vStepDiff=(X=100.0,Y=0.0,Z=16.0)
	bJumpCapable=true
	bCanJump=true
	bCanWalk=true
	bCanWalkOffLedges=true
	bLOSHearing=true
	bUseCompressedPosition=true
	bWeaponBob=true
	Visibility=128
	DesiredSpeed=1.0
	MaxDesiredSpeed=1.0
	HearingThreshold=2800.0
	SightRadius=5000.0
	AvgPhysicsTime=0.1
	GroundSpeed=600.0
	WaterSpeed=300.0
	AirSpeed=600.0
	LadderSpeed=200.0
	AccelRate=2048.0
	JumpZ=420.0
	AirControl=0.05
	WalkingPct=0.5
	CrouchedPct=0.5
	MaxFallSpeed=1200.0
	fMinFloorZ=0.7
	BaseEyeHeight=64.0
	EyeHeight=54.0
	CrouchHeight=40.0
	CrouchRadius=34.0
	Health=100.0
	HeadScale=1.0
	noise1time=-10.0
	noise2time=-10.0
	Bob=0.008
	SoundDampening=1.0
	DamageScaling=1.0
	LandMovementState=PlayerWalking
	WaterMovementState=PlayerSwimming
	BaseMovementRate=525.0
	BlendChangeTime=0.25
	MouthBone="Body__Mouth"
	fLumosRadius=512.0
	StepHeight=16.0
	StepWidth=32.0
	DrawType=DT_Mesh
	bUpdateSimulatedPosition=true
	RemoteRole=ROLE_SimulatedProxy
	NetPriority=2.0
	Texture=Texture'S_Pawn'
	bTravel=true
	bCanBeDamaged=true
	bShouldBaseAtStartup=true
	bOwnerNoSee=true
	bCanTeleport=true
	bDisturbFluidSurface=true
	SoundVolume=255
	CollisionRadius=24.0
	CollisionHeight=44.0
	bCollideActors=true
	bCollideWorld=true
	bBlockActors=true
	bBlockPlayers=true
	bProjTarget=true
	bRotateToDesired=true
	bNoRepMesh=true
	bDirectional=true
	bLightingVisibility=true
	bUseDynamicLights=true
	bAcceptsProjectors=true
	bReplicateMovement=true
	Role=ROLE_Authority
	NetUpdateFrequency=100.0
	LODBias=1.0
	LODBiasSW=1.0
	DrawScale=1.0
	DrawScale3D=(X=1.0,Y=1.0,Z=1.0)
	MaxLights=4
	ScaleGlow=1.0
	Style=STY_Normal
	bMovable=true
	SoundPitch=64
	TransientSoundVolume=0.3
	TransientSoundRadius=300.0
	TransientSoundPitch=1.0
	bBlockZeroExtentTraces=true
	bBlockNonZeroExtentTraces=true
	bJustTeleported=true
	RotationalAcceleration=(Pitch=200000,Yaw=200000,Roll=200000)
	fRotationalTightness=5.0
	Mass=100.0
	MessageClass=class'LocalMessage'
	bAlignBottom=true
	bPauseWithSpecial=true
	SkinColorModifier=(B=127,G=127,R=127,A=255)
	fDefaultAnimRate=1.0
	SizeModifier=1.0
	CentreOffset=(X=0.0,Y=0.0,Z=10.0)
	GestureDistance=1.0
	DesiredOpacityForCamera=0.5
	SpeedOpacityForCamera=1.0
	CurrentOpacityForCamera=1.0
}