//================================================================================
// KWPawn.
//================================================================================

class KWPawn extends KWPawnNative
  Config(User);

const MaxRunningGameSlot= 9999;
const MinRunningGameSlot= 9997;
const kDefaultFacialAnimString= "_Calm";
const FIRINGBLENDBONE= 'lower_back';
const NUM_ANIM_CHANNELS= 20;
const BLINK_BROW_RIGHT_ANIMCHANNEL= 39;
const BLINK_BROW_LEFT_ANIMCHANNEL= 38;
const BLINK_LOWER_RIGHT_ANIMCHANNEL= 37;
const BLINK_UPPER_RIGHT_ANIMCHANNEL= 36;
const BLINK_LOWER_LEFT_ANIMCHANNEL= 35;
const BLINK_UPPER_LEFT_ANIMCHANNEL= 34;
const LIPSYNC_ANIMCHANNEL_MAX= 33;
const LIPSYNC_ANIMCHANNEL_MIN= 25;
const FACIAL_ANIMCHANNEL= 24;
const HEADLOOK_ANIMCHANNEL= 23;
const TAKEHITCHANNEL= 22;
const CUTSCENE_FULL_BODY_2= 21;
const CUTSCENE_FULL_BODY_1= 20;
const UPPERBODY_CHANNEL= 13;
const FULLBODY_CHANNEL= 12;
const FALLINGCHANNEL= 1;
const RESTINGPOSECHANNEL= 0;
struct IdleDialogAnimStruct
{
  var name AnimName;
  var float AnimRate;
  var float AnimTime;
  var string Text;
};

enum ERotElement {
  RE_PitchPos,
  RE_PitchNeg,
  RE_RollPos,
  RE_RollNeg,
  RE_YawPos,
  RE_YawNeg
};

struct CamSettings
{
  var() Vector vLookAtOffset;
  var() float fLookAtDistance;
  var() float fLookAtHeight;
  var() float fRotTightness;
  var() float fRotSpeed;
  var() Vector fMoveTightness;
  var() float fMoveSpeed;
  var() float fMaxMouseDeltaX;
  var() float fMaxMouseDeltaY;
  var() float fMinPitch;
  var() float fMaxPitch;
};

var KWAIController KWAIController;
var BaseCam cam;
var() bool bDespawnable;
var bool bDespawned;
var float fDespawnTime;
var() bool bAccurateThrowing;
var() float fAccurateThrowingTime;
var() float fThrowVelocity;
var(CameraSettings) CamSettings CameraSetStandard;
var(CameraSettings) CamSettings CameraSetCutScene;
var(CameraSettings) CamSettings CameraSetFree;
var(CameraSettings) CamSettings CameraSetBoss;
var(CameraSettings) CamSettings CameraSetFollow;
var(CameraSettings) float CameraSnapRotationPitch;
var(CameraSettings) bool CameraNoSnapRotation;
var(CameraSettings) bool bControlsCameraRot;
var(CameraSettings) float fDesiredCamDistFromWall;
var(CameraSettings) float fCameraRollModifier;
var(CameraSettings) bool bDoWorldCollisionCheck;
var bool bAllowPitch;
var bool bRollNotYaw;
var() bool bPrefersBehind;
var(PlayerControl) Class<PlayerController> DefaultPlayerControllerClass;
var float MaxHealth;
var(AI) Class<CompanionCombatManager> DefaultManagerClass;
var Actor CutNotifyActor;
var string CutErrorString;
var string sCutNotifyCue;
var Vector vOldLocation;
var float fLastLandedTime;
var() float Damage;
var() bool bTakesDamage;
var() bool bTakesDamageCheat;
var float CreationTime;
var float ExtraAccelTimer;
var Vector AdditionalPrePivotDest;
var Vector AdditionalPrePivot;
var() float AdditionalPrePivotTweenSpeed;
var bool bDoFallingAutoDecel2d;
var bool bFallingAutoDecel2d;
var() Rotator ConstantRotationRate;
var Rotator CurrentRotationRate;
var() float ConstantRotationAccel;
var(Events) name DestroyedEvent;
var() bool bRelevantToTriggersWhileInCutscene;
var Actor aHolding;
var Actor ActorToCarry;
var() bool bCanBePickedUp;
var Controller SavedController;
var bool SavedColActors;
var bool SavedBlockActors;
var bool SavedBlockPlayers;
var float YawToCarryingActor;
var Vector HoldingLocOffset;
var Rotator HoldingRotOffset;
var int pickupAnimChannel;
var(BumpLines) bool bUseBumpLine;
var(BumpLines) bool bBumpCaptureHero;
var(BumpLines) string BumpLineSet;
var(BumpLines) string AlternateBumpLineSet;
var(BumpLines) string BumpLineSetPrefix;
var(BumpLines) bool bDoRandomBumpLine;
var ShadowProjector Shadow;
var(Lighting) bool bDropShadowOnActors;
var(Lighting) bool bUseBlobShadow;
var(Lighting) float BlobShadowLightDistance;
var() name SwimAnims[4];
var() name CrouchAnims[4];
var() name WalkAnims[4];
var() name RunAnims[4];
var() name AirAnims[4];
var() name TakeoffAnims[4];
var() name LandAnims[4];
var() name DoubleJumpAnims[4];
var() name DodgeAnims[4];
var() name AirStillAnim;
var() name TakeoffStillAnim;
var() name CrouchTurnRightAnim;
var() name CrouchTurnLeftAnim;
var() name CarryTurnRightAnim;
var() name CarryTurnLeftAnim;
var() name IdleCrouchAnim;
var() name IdleSwimAnim;
var() name IdleWeaponAnim;
var() name CompanionWalkAnim;
var() bool bCouldNotWalkAsCompanion;
var() bool bAllFallingMountsUseBigClimb;
var() name BigClimbStart;
var() name BigClimbStartNoTrans;
var() name BigClimbEnd;
var() name BigClimbEndNoTrans;
var() name Climb32NoTransAnimName;
var() name Climb64NoTransAnimName;
var() float BigClimbStartOffset;
var() float BigClimbOffset;
var() float BigShimmyOffset;
var() float BigClimbAnimRate_Temp;
var() float StepUpOffset;
var() float Climb32Offset;
var() float Climb64Offset;
var() bool bAbleToDoShimmy;
var() float fShimmyDelay;
var() float fTimeDoingShimmy;
var() bool bSaidShimmyBumpLine;
var() name HangIdleAnim;
var() name HangIdleNoTransAnim;
var() name JumpToHangAnim;
var() name JumpToHangNoTransAnim;
var() name ShimmyRightAnim;
var() name ShimmyLeftAnim;
var() name ShimmyRightEndAnim;
var() name ShimmyLeftEndAnim;
var() name ShimmyRightNoTransAnim;
var() name ShimmyLeftNoTransAnim;
var() name ShimmyRightEndNoTransAnim;
var() name ShimmyLeftEndNoTransAnim;
var() name HangToLandAnim;
var() name StepUpAnim;
var() name StepUpNoTransAnim;
var() float ShimmyControlUp;
var() float ShimmyControlRight;
var Rotator ShimmyDir;
var Actor ShimmyNodePrev;
var Actor ShimmyNodeNext;
var Actor ShimmyNodeCurr;
var(Animations) name IdleTiredAnimName;
var(Animations) name IdleAnimName;
var(Animations) name RunAnimName;
var(Animations) name WalkAnimName;
var(Sliding) name SlideAnimName;
var(Sliding) name SlideLeftAnimName;
var(Sliding) name SlideRightAnimName;
var(Sliding) float SlideAccelRate;
var(Sliding) float GroundSlideSpeed;
var(Sliding) float GroundSlideSpeedFast;
var(Sliding) float GroundSlideSpeedSlow;
var(Sliding) float fSlideSkateForce;
var int SlideDirectionYaw;
var int SlideDirectionYawDest;
var(Sliding) int SlideYawChangeRate;
var() bool bIsSliding;
var float LastSlideJumpTime;
var float ForceGroundSlideSpeedTimer;
var name PendingSlideAnim;
var float TimeOfLastAnimChange;
var(Sliding) Sound SlidingAmbient;
var(Sliding) byte SlidingAmbientMinPitch;
var(Sliding) byte SlidingAmbientMaxPitch;
var(Sliding) byte SlidingAmbientVolume;
var(Sliding) float SlideLeaveTrackDieTimeout;
var(Sliding) array<string> StartSlidingEmotes;
var(Sliding) array<string> OffJumpEmotes;
var(Sliding) array<string> OffEdgeOfTrackEmotes;
var(Sliding) Class<Emitter> SlidingFeetEmitterType;
var Emitter SlideRHeelEmitter;
var Emitter SlideLHeelEmitter;
var(Animations) name CarryIdleAnimName;
var(Animations) name CarryForwardAnimName;
var(Animations) name CarryBackwardAnimName;
var(Animations) name CarryKnockBackAnimName;
var(Animations) name CarryStrafeLeftAnimName;
var(Animations) name CarryStrafeRightAnimName;
var(Animations) name PickupAnimName;
var(Animations) float PickupAnimRate;
var(Animations) bool bAllowMovementWhilePickupAndCarry;
var(Animations) name ThrowAnimName;
var(Animations) name KnockBackAnimName;
var(Skeletal) name PickupBoneName;
var(Movement) float GroundRunSpeed;
var(Movement) float GroundWalkSpeed;
var(Movement) float GroundCarrySpeed;
var() float BaseCarryMovementRate;
var() bool bTweenGroundSpeed;
var float DestGroundSpeed;
var() float TweenGroundSpeedRate;
var float PawnMotionlessTimer;
var float PawnAccelerationTimer;
var(Animation) float fLandingTweenInTime;
var(Animation) float fLandingTweenOutTime;
var(Animation) float fLandingAnimRate;
var(Animation) float fJumpTweenTime;
var(Animation) float fJumpAnimRate;
var(Animation) float fIdleAnimRate;
var(Animation) float fIdleAnimTweenTime;
var(Animation) float fIdleAnimTweenTimeCutScene;
var(Animation) float fAirStillAnimRate;
var(Animation) float fAirStillAnimTweenTime;
var(Animation) float fDoubleJumpAnimRate;
var(Animation) float fDoubleJumpTweenTime;
var(Animation) bool bPickRandomStartFrameForAnimateStanding;
var(Skeletal) name RootBone;
var(Skeletal) name HeadBone;
var(Skeletal) name NeckBone;
var(Skeletal) name UpperBodyBone;
var(Skeletal) name LeftUpperLidBone;
var(Skeletal) name LeftLowerLidBone;
var(Skeletal) name RightUpperLidBone;
var(Skeletal) name RightLowerLidBone;
var(Skeletal) name LeftBrowBone;
var(Skeletal) name RightBrowBone;
var() ERotElement NeckRotElement;
var() ERotElement HeadRotElement;
var() name LeftBlinkAnim;
var() name RightBlinkAnim;
var float fBlinkingTime;
var() bool bCanBlink;
var() bool bNoDefaultInventory;
var() bool bAcceptAllInventory;
var() config array<byte> SelectedEquipment;
var() array<string> RequiredEquipment;
var() array<string> OptionalEquipment;
var(sounds) string drown_String;
var(sounds) string breathagain_String;
var(sounds) string GaspSound_String;
var(sounds) array<string> LandGrunts_String;
var(sounds) array<string> JumpSounds_String;
var(sounds) array<string> HurtSounds_String;
var(sounds) array<string> FallSounds_String;
var(sounds) array<string> FarFallSounds_String;
var() Sound drown;
var() Sound breathagain;
var() Sound GaspSound;
var() array<Sound> LandGrunts;
var() array<Sound> JumpSounds;
var() array<Sound> HurtSounds;
var() array<Sound> FallSounds;
var() array<Sound> FarFallSounds;
var(sounds) array<Sound> LandingStone;
var(sounds) array<Sound> LandingRug;
var(sounds) array<Sound> LandingWood;
var(sounds) array<Sound> LandingWet;
var(sounds) array<Sound> LandingGrass;
var(sounds) array<Sound> LandingMetal;
var(sounds) array<Sound> LandingDirt;
var(sounds) array<Sound> LandingHay;
var(sounds) array<Sound> LandingLeaf;
var(sounds) array<Sound> LandingSnow;
var(sounds) array<Sound> LandingSand;
var(sounds) array<Sound> LandingMud;
var(sounds) array<Sound> LandingNone;
var(sounds) array<Sound> FootstepsStone;
var(sounds) array<Sound> FootstepsRug;
var(sounds) array<Sound> FootstepsWood;
var(sounds) array<Sound> FootstepsWet;
var(sounds) array<Sound> FootstepsGrass;
var(sounds) array<Sound> FootstepsMetal;
var(sounds) array<Sound> FootstepsDirt;
var(sounds) array<Sound> FootstepsHay;
var(sounds) array<Sound> FootstepsLeaf;
var(sounds) array<Sound> FootstepsSnow;
var(sounds) array<Sound> FootstepsSand;
var(sounds) array<Sound> FootstepsMud;
var(sounds) array<Sound> FootstepsNone;
var(sounds) float FootstepVolume;
var(sounds) array<int> FootFrames;
var(sounds) array<int> FootFramesWalk;
var(sounds) array<int> FootFramesRun;
var(sounds) array<int> FootFramesCarry;
var(sounds) Sound silence;
var() Class<Emitter> LandedFX;
var() Class<Emitter> WetLandedFX;
var(WaterRipple) Class<Emitter> WaterRipples;
var(WaterRipple) float fMoveWaterRipplesTime;
var(WaterRipple) float fRestWaterRipplesTime;
var float fCurrWaterRipplesTime;
var float fResetWaterRipplesTime;
var() name DefaultGroundMovementState;
var() name DefaultAirMovementState;
var() bool bUseNewMountCode;
var() float MountCylScaleMag;
var() bool bUseCollisionDuringMount;
var Vector MountDelta;
var Vector MountStartLocation;
var Vector MountDeltaAccum;
var float PullAwayFromWallDelta2d;
var Vector vPullAwayFromWallDelta;
var Vector fMountSave;
var float fLastAnimTime;
var Vector MountDestination;
var Actor MountBase;
var bool bFallingMount;
var name StateToGotoAfterMount;
var bool bMountFinished;
var Actor aHiddenMountActor;
var Vector vLastMountBonePos;
var Vector vTotalBoneMovement;
var bool bColCylChanged;
var bool bClimbEndAnimStarted;
var Vector vDebugMountRootBoneLoc;
var(Routing) string RouteName;
var(Routing) string FirstStopOnRoute;
var(Routing) string LastStopOnRoute;
var Actor GoalTarget;
var FlyToDelegate FlyToDel;
var bool bDoingDoubleJump;
var float DoubleJumpZ;
var name TempName;
var float TempFloat1;
var float TempFloat2;
var Vector TempVector;
var travel string PreviousLevelName;
var() name OnTrig_AnimToPlay;
var() Sound OnTrig_SoundToPlay;
var() float OnTrig_SoundVolume;
var() float LeadingActorDistance;
var() bool bDestroyOnLanded;
var() bool bDestroyOnHitWall;
var KWPawn TrailingChar[2];
var Vector vTCTarget[2];
var Vector vLCLocation;
var Actor vTargetLocator[2];
var Vector vLastGroundPosition;
var int vYawAtLastGroundPosition;
var bool bDoingMountThatTCsShouldFollow;
var bool bUseLastLocationArray;
var int LastLocationArrayMaxLen;
var array<Vector> LastLocationArray;
var float TimeOfLastLocationSave;
var int TOLLSTickCounter;
var() array<name> IdleAnims;
var() float fChanceToPlayIdle;
var() array<IdleDialogAnimStruct> IdleDialogAnims;
var(Companion) bool bCompanionDebug;
var(Companion) bool bCompanionDebugMore;
var(Companion) name nCompanionDebugTag;
var(HeroFollow) float DegreeOffsetFromBehind;
var(HeroFight) float DegreeOffsetFromBehindFight;
var float DegreeOffsetFromBehindOriginal;
var(HeroFollow) float DistanceOffset;
var(HeroFight) float DistanceOffsetFight;
var float DistanceOffsetOriginal;
var(HeroFollow) bool bCanIdleWander;
var(HeroWander) float IdleMonitorTimeOut;
var(HeroWander) float AccelMonitorTimeOut;
var(HeroWander) float IdleWanderRadius;
var(HeroWander) float WanderPauseOdds;
var(HeroWander) float WanderPauseDurationMin;
var(HeroWander) float WanderPauseDurationMax;
var(HeroWander) float WanderDistance;
var(HeroWander) float WanderTowardsLeadCharDistance;
var(HeroWander) float IdleRotationRateScale;
var(HeroWander) int iNumWanderDestinations;
var(HeroWander) float fIdleToleranceOffset;
var KWPawn aBoss;
var name TAKEHITBONE;
var(Movement) float fDoubleJumpHeight;
var(Movement) float fJumpHeight;
var(Movement) float fJumpDist;
var(Movement) float ShimmySpeed;
var float fJumpDistScalar;
var BouncePad BouncePadHit;
var() bool bUnableToBounce;
var travel string LastLoopedMusic;
var HeadLookManager HeadLookMgr;
var globalconfig int RunningGameSlot;
var transient bool bNeedToDeleteRunningGames;
var(AttachedActors) array< class<Actor> > AttachTypeArray;
var(AttachedActors) array<Actor> AttachedActorArray;
var(Health) travel float Health;
var(PlayerControl) bool bIsMainPlayer;
var() bool bUseAccelRateForWalkingBrake;
var const bool bTryToUncrouch;
var(AI) bool bUseRealTimePathCheck;

event PostPersistentDataRestored();

function SetActorMeshes(Actor Target, string meshname, optional string SkinName)
{
}

static function class<PlayerController> GetDefaultPlayerControllerClass()
{
}

function StartBlinkAnimation()
{
}

function StopBlinkAnimation()
{
}

function bool RelocatePawn(Vector Loc)
{
}

function KWAddShadow()
{
}

function KWRemoveShadow()
{
}

event BaseChange()
{
}

function bool PawnLandedOnMe(KWPawn lander)
{
}

function bool SaveOnTouchingSavePoint()
{
}

function MovePawn(string S, optional bool bInstant, optional bool bUseTagInsteadOfLabel, optional bool bNoRotation)
{
}

function MovePawnWithoutRotation(string S, optional bool bInstant, optional bool bUseTagInsteadOfLabel)
{
}

function SetJumpVars()
{
}

function SetMovementPhysics()
{
}

function Bump(Actor Other)
{
}

function bool CanDoPickupActor()
{
}

function bool IsTired()
{
}

function PickupActor(Actor Other)
{
}

function DropCarryingActor()
{
}

function GiveDamageToPlayer(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional bool DontSayBumpLine)
{
}

function bool InFrontOfMe(Actor A)
{
}

function Actor FindClosestTargetPoint()
{
}

function Actor AccurateThrowing(Actor A)
{
}

function AccurateThrowObject(Actor A, Actor Target, bool bCollideActors, bool bCollideWorld)
{
}

function ThrowCarryingActor()
{
}

function PlayerThrowCarryingActor()
{
}

function PlayerThrowCarryingActorGeneral(float Speed)
{
}

function bool ObjectPickup(Actor obj, name nHoldingBone)
{
}

function ObjectThrow(Vector vThrow, bool bCollideActors, bool bCollideWorld)
{
}

function ColObjTouch(Actor Other, GenericColObj ColObj)
{
}

function Trigger(Actor Other, Pawn EventInstigator)
{
}

function DeliverRandomDialog(array<string> StringArray, optional bool bNoSubtitles)
{
}

function string GetRandString(array<string> selectArray)
{
}

function Sound GetRandSound(array<Sound> selectArray)
{
}

function QuickSave()
{
}

function QuickLoad()
{
}

function OnSaveGame()
{
}

function OnEvent(name EventName)
{
}

function Controller GetRealController()
{
}

event EncroachedBy(Actor Other)
{
}

function KillPawn()
{
}

function FraserIsGod()
{
}

function BaseCam GetBaseCam()
{
}

function float GetHealth()
{
}

function AddHealth(float Amount)
{
}

function float GetBossHealth()
{
}

function StartBossEncounter(BossEncounterTrigger bet)
{
}

function StopBossEncounter()
{
}

function CreateKWAIController(optional class<KWAIController> clsType)
{
}

function PlayWaterRipples(float dtime)
{
}

function OnBounceExtra(bool bCanMoveWhileJumping)
{
}

function TickGroundSpeedTweening(float dt)
{
}

function TickPrePivotTweening(float dt)
{
}

function Landed(Vector N)
{
}

function HitWall(Vector HitNormal, Actor HitWall)
{
}

function Touch(Actor Other)
{
}

function OnStartedAccelerating()
{
}

function OnStoppedAccelerating()
{
}

function OnLeadCharStoppedAccelerating()
{
}

function PossessedBy(Controller C)
{
}

function bool StateIsInterruptible()
{
}

function SnapRotToActor(Actor aDest)
{
}

function name GetDefaultGroundMovementState()
{
}

function name GetDefaultAirMovementState()
{
}

function GotoDefaultGroundMovementState()
{
}

function GotoDefaultAirMovementState()
{
}

function LoadLevel(string LevelName)
{
}

function bool AllowShowMenu()
{
}

function bool IsHero()
{
}

function bool isAJumpAnimation(name animseq)
{
}

function CreateLandedFX()
{
}

function CreateWetLandedFX()
{
}

event PlayLanded(float impactVel)
{
}

event PlayJump()
{
}

function KWGame.EMaterialType TraceMaterial(Vector Start, float deltaZ, optional out Vector HitLoc, optional out Vector HitNorm)
{
}

function AddFootStepsNotify(optional MeshAnimation MeshAnim)
{
}

function PlayFootStepsSound()
{
}

function KWGame.EMaterialType PlayLandingSound()
{
}

function PlayLandingHardSound()
{
}

function PlayDoubleJump()
{
}

function AnimateStanding()
{
}

function PlayIdle()
{
}

function PlayWaiting()
{
}

function PlayFalling()
{
}

function PlayFallingSound()
{
}

function StartSliding()
{
}

function EndSliding()
{
}

function SetSlideAnim(name AnimName)
{
}

function SetSlidingParams(int Speed, optional float ForcedSpeed)
{
}

function SetNewSlideDirection(Rotator NewRotation, KWSlideDirection Other)
{
}

function PlayTurnShortSound()
{
}

function PlayTurnLongSound()
{
}

function PlayEnterSlideSound()
{
}

function PlaySlideJumpSound()
{
}

function PlayFlyOffTrackSideSound()
{
}

function TickSliding(float dtime)
{
}

event ModifyVelocity(float DeltaTime, Vector OldVelocity)
{
}

function bool IsRelevantToTelepit(TelePit tp)
{
}

function bool OnTelepitTouch(TelePit tp)
{
}

function bool IsRelevantToTrigger(Trigger t)
{
}

function bool CanPlayFidgets()
{
}

function bool IsAnIdleAnim(name AnimName)
{
}

event AnimEnd(int Channel)
{
}

function bool IsALandingAnim(name anim)
{
}

event SetWalking(bool bNewIsWalking)
{
}

event ChangeAnimation()
{
}

function TweenOutAnimChannels(float tweenTime, optional bool bZeroOutNow)
{
}

function LoopIfNeeded(name NewAnim, float NewRate, float BlendIn, int Channel)
{
}

function StopMovement()
{
}

function EventDoJumpUp(Vector vJumpDir)
{
}

function bool RespondToEventDoJumpUp()
{
}

function PlayJumpSound()
{
}

function PlayDoubleJumpSound()
{
}

function PlayThrowingSound()
{
}

function PlayPainSound()
{
}

function PlayClimbingSound()
{
}

function PlayShimmySound()
{
}

function SayShimmyBumpLine()
{
}

function bool DoJump(bool bUpdating)
{
}

function bool DoJump_Player(bool bUpdating)
{
}

function DoDoubleJump(bool bUpdating)
{
}

function bool CanDoubleJump()
{
}

event Falling()
{
}

function DoFlyTo(Vector DestLoc, KWGame.enumMoveType MoveType, float TimeSpan, optional name StateToGoToWhenDone, optional Vector SplinePoint)
{
}

function DoFlyTo_Actor(Actor A, Vector VOffset, KWGame.enumMoveType MoveType, float TimeSpan, optional bool bTurnWithChar, optional bool bRelativeToChar, optional bool bStayLockedToActor, optional name StateToGoToWhenDone, optional Vector SplinePoint, optional Rotator rRotStepSize)
{
}

event OnFlyToDone()
{
}

function name GetIdleAnimName()
{
}

function name GetPickupAnimName(Actor A)
{
}

function name GetThrowAnimName(Actor A)
{
}

function name GetCarryIdleAnimName(Actor A)
{
}

function name GetCarryForwardAnimName(Actor A)
{
}

function name GetCarryBackwardAnimName(Actor A)
{
}

function name GetCarryStrafeLeftAnimName(Actor A)
{
}

function name GetCarryStrafeRightAnimName(Actor A)
{
}

function name GetCarryTurnLeftAnim(Actor A)
{
}

function name GetCarryTurnRightAnim(Actor A)
{
}

function bool InAnAir()
{
}

event bool Mount(Vector Delta, Actor A)
{
}

function CheckForTouchingShimmyNodes(name SeqName)
{
}

function JumpFromShimmy()
{
}

function DoTraceDown(string S)
{
}

function bool IsInLoadout(class<Inventory> InventoryClass)
{
}

function AddDefaultInventory()
{
}

function CreateInventory(string InventoryClassName)
{
}

function Inventory FindInventoryType(Class DesiredClass)
{
}

function HoldCarriedObject(CarriedObject O, name AttachmentBone)
{
}

function bool AddToInventoryCollection(class<KWInventoryCollection> CollectionClass, int iNumItems)
{
}

function bool SubtractFromInventoryCollection(class<KWInventoryCollection> CollectionClass, int iNumItems)
{
}

function bool AddInventory(Inventory NewItem)
{
}

function int GetInventoryCount(name InventoryClassName)
{
}

function PressedFire()
{
}

function ReleasedFire()
{
}

function ReleasedAltFire()
{
}

event Destroyed()
{
}

function bool PointOfView()
{
}

function cutBypass()
{
}

function GlobalCutBypass()
{
}

function string ParseDelimitedString(string Text, string Delimiter, int Count, optional bool bToEndOfLine)
{
}

function float DeliverLocalizedDialog(string DlgID, bool bPlaySound, optional float fDisplayDuration, optional string IntFileName, optional string ExplicitString, optional bool No3D, optional float fVolume, optional bool bNoSubtitle, optional bool bUseSlotIn, optional KWGame.ESoundSlot SlotIn)
{
}

function string HandleFacialExpression(out string dlgString, int sndLen, optional bool bDONTdoFacialAnim)
{
}

function ResetLastLocationArray()
{
}

function TickLastLocationArray(float dt)
{
}

function bool IsLeadChar()
{
}

function bool IsTrailingChar()
{
}

function bool OnlyOneTrailingChar()
{
}

function TrailingCharOnEvent(name E)
{
}

function KWPawn PickRandomCompanion()
{
}

function MakeDebugTargetLocators()
{
}

function AddHealthToCompanions(float Amount)
{
}

function AddHealthToCompanionsAndSelf(float Amount)
{
}

function AddHealthUpToMinPercent(float fMinHealthPercent)
{
}

function AddHealthUpToMinPercent_Companions(float fMinHealthPercent)
{
}

function AddHealthUpToMinPercent_CompanionAndSelf(float fMinHealthPercent)
{
}

function AddTrailingChar(KWPawn H)
{
}

function OnStartTrailingLeadChar()
{
}

function AddTrailingCharExtraInit()
{
}

function AddTrailingCharBasedOnCutName(string inCutName)
{
}

function AddTrailingCharBasedOnTag(name inTag)
{
}

function DropTrailingCharBasedOnCutName(string inCutName)
{
}

function DropTrailingChar(KWPawn H, optional bool bFinal)
{
}

function bool IsAHeroPawn()
{
}

function SwitchControlToPawn(string CompanionLabel, optional KWPawn NewPawn, optional float fTimeToSwitch, optional bool bSwitchLocation)
{
}

function StopLeading()
{
}

function SetTargetLocations()
{
}

function TrailingCharFightWithHero(string Command, optional name EnemyManagerTag)
{
}

static function class<KWAIController> GetCompanionCombatControllerType()
{
}

function OnTrailingCharJoinsFight(KWAIController TC, Pawn aBossFocus, optional CompanionCombatManager enemyManager)
{
}

function CompanionInit()
{
}

function SetVarsForCompanionFighting()
{
}

function SetVarsForCompanionNormal()
{
}

function UnTouchedClimbBoundary(CompanionClimbBoundaryKeyPoint ccbkp)
{
}

function DebugRelocateTrailingCharsToLeadCharPosition()
{
}

function HeadLookEnable(bool bEnable)
{
}

function HeadLookSetParameters(bool bTurnToTrack, bool bIgnoreWhenTrackLost)
{
}

function HeadLookScanEnvironment()
{
}

function HeadLookLockOnActor(Actor LockTarget)
{
}

function PreCutPossess()
{
}

function PostCutPossess()
{
}

function PreCutUnPossess()
{
}

function PostCutUnPossess()
{
}

function bool OnCutExitCommand(string Command, out string sError)
{
}

event CannotReachLastRouteGoal()
{
}

function DestroyDelegates(optional bool bOnlyMoveDelegates)
{
}

function SetIdleAnimName(name AnimName)
{
}

function ShowWeapon(bool bShow)
{
}

function BaseCam KWGetCamera()
{
}

function KWPawn GetKwPawnFromTag(name kid)
{
}

function Vector KWWorldToScreen(Vector WorldLoc, float ScreenWidth, float ScreenHeight, float FOV, Vector CamLoc, Rotator CamRot)
{
}

function Vector KWScreenToWorld(Vector ScreenLoc, float ScreenWidth, float ScreenHeight, float FOV, Vector CamLoc, Rotator CamRot, optional out Vector vLook)
{
}

function Vector KWGetWorldLoc(Vector ScreenPos, float canvSizeX, float canvSizeY, optional out Vector vLook)
{
}

function SetDespawnFlag()
{
}

function StartSavedRunningGame(int GameSlot)
{
}

function DeleteRunningGames()
{
}

defaultproperties
{
     fAccurateThrowingTime=1.000000
     fThrowVelocity=400.000000
     CameraSetStandard=(vLookAtOffset=(X=0,Y=0,Z=70),fLookAtDistance=150,fLookAtHeight=0,fRotTightness=8,fRotSpeed=15,fMoveTightness=(X=0,Y=0,Z=0),fMoveSpeed=0,fMaxMouseDeltaX=20000,fMaxMouseDeltaY=10000,fMinPitch=-14000,fMaxPitch=14000)
     CameraSetCutScene=(vLookAtOffset=(X=0,Y=0,Z=0),fLookAtDistance=128,fLookAtHeight=0,fRotTightness=2,fRotSpeed=5,fMoveTightness=(X=0,Y=0,Z=0),fMoveSpeed=0,fMaxMouseDeltaX=20000,fMaxMouseDeltaY=10000,fMinPitch=-14000,fMaxPitch=14000)
     CameraSetFree=(vLookAtOffset=(X=0,Y=0,Z=0),fLookAtDistance=0,fLookAtHeight=0,fRotTightness=10,fRotSpeed=5,fMoveTightness=(X=0,Y=0,Z=0),fMoveSpeed=600,fMaxMouseDeltaX=20000,fMaxMouseDeltaY=10000,fMinPitch=-14000,fMaxPitch=14000)
     CameraSetBoss=(vLookAtOffset=(X=0,Y=0,Z=100),fLookAtDistance=170,fLookAtHeight=0,fRotTightness=0,fRotSpeed=0,fMoveTightness=(X=0,Y=0,Z=0),fMoveSpeed=0,fMaxMouseDeltaX=0,fMaxMouseDeltaY=0,fMinPitch=0,fMaxPitch=0)
     CameraSetFollow=(vLookAtOffset=(X=0,Y=0,Z=70),fLookAtDistance=150,fLookAtHeight=0,fRotTightness=0,fRotSpeed=15,fMoveTightness=(X=0,Y=0,Z=0),fMoveSpeed=0,fMaxMouseDeltaX=20000,fMaxMouseDeltaY=10000,fMinPitch=-14000,fMaxPitch=14000)
     fDesiredCamDistFromWall=15.000000
     fCameraRollModifier=1.000000
     bDoWorldCollisionCheck=True
     bPrefersBehind=True
     DefaultPlayerControllerClass=Class'KWGame.KWHeroController'
     bTakesDamage=True
     bTakesDamageCheat=True
     AdditionalPrePivotTweenSpeed=100.000000
     ConstantRotationRate=(Yaw=16000)
     ConstantRotationAccel=16000.000000
     bRelevantToTriggersWhileInCutscene=True
     BlobShadowLightDistance=380.000000
     WalkAnims(0)="Walk"
     WalkAnims(1)="Walk"
     WalkAnims(2)="Walk"
     WalkAnims(3)="Walk"
     CompanionWalkAnim="Walk"
     BigClimbStart="climb96start"
     BigClimbStartNoTrans="climb96startNoTrans"
     BigClimbEnd="climb96end"
     BigClimbEndNoTrans="climb96endNoTrans"
     Climb32NoTransAnimName="climb32NoTrans"
     Climb64NoTransAnimName="climb64NoTrans"
     BigClimbOffset=96.000000
     BigShimmyOffset=96.000000
     BigClimbAnimRate_Temp=1.000000
     Climb32Offset=32.000000
     Climb64Offset=64.000000
     IdleTiredAnimName="Idle"
     IdleAnimName="Idle"
     SlideAnimName="SlideIdle"
     SlideLeftAnimName="SlideIdle"
     SlideRightAnimName="SlideIdle"
     SlideAccelRate=100.000000
     GroundSlideSpeed=600.000000
     GroundSlideSpeedFast=850.000000
     GroundSlideSpeedSlow=400.000000
     fSlideSkateForce=200.000000
     SlideYawChangeRate=14000
     SlidingAmbientMinPitch=48
     SlidingAmbientMaxPitch=115
     SlidingAmbientVolume=100
     SlideLeaveTrackDieTimeout=2.000000
     PickupAnimRate=1.000000
     GroundRunSpeed=220.000000
     GroundWalkSpeed=90.000000
     GroundCarrySpeed=220.000000
     TweenGroundSpeedRate=300.000000
     fLandingTweenInTime=0.100000
     fLandingTweenOutTime=1.000000
     fLandingAnimRate=0.500000
     fJumpTweenTime=0.200000
     fJumpAnimRate=1.000000
     fIdleAnimRate=1.000000
     fIdleAnimTweenTime=0.500000
     fAirStillAnimRate=1.000000
     fAirStillAnimTweenTime=0.100000
     RootBone="body_root"
     HeadBone="Body_Head"
     NeckBone="Body_Neck"
     bAcceptAllInventory=True
     FootstepVolume=1.000000
     DefaultGroundMovementState="StateGroundMovement"
     DefaultAirMovementState="StateAirMovement"
     MountCylScaleMag=2.000000
     bUseCollisionDuringMount=True
     OnTrig_SoundVolume=1.000000
     LeadingActorDistance=300.000000
     LastLocationArrayMaxLen=15
     fChanceToPlayIdle=0.200000
     DegreeOffsetFromBehind=70.000000
     DegreeOffsetFromBehindFight=60.000000
     DistanceOffset=70.000000
     DistanceOffsetFight=100.000000
     IdleMonitorTimeOut=1.500000
     AccelMonitorTimeOut=1.000000
     IdleWanderRadius=96.000000
     WanderPauseOdds=0.400000
     WanderPauseDurationMin=1.000000
     WanderPauseDurationMax=3.000000
     WanderDistance=72.000000
     WanderTowardsLeadCharDistance=40.000000
     IdleRotationRateScale=0.500000
     fIdleToleranceOffset=40.000000
     TAKEHITBONE="'"
     fDoubleJumpHeight=96.000000
     fJumpHeight=64.000000
     fJumpDist=192.000000
     ShimmySpeed=70.000000
     RunningGameSlot=9998
     bCanClimbLadders=True
     ControllerClass=None
     MovementAnims(0)="run"
     MovementAnims(1)="Run_Back"
     MovementAnims(2)="Run_Left"
     MovementAnims(3)="Run_Right"
     TurnLeftAnim="StandTurnLeft135"
     TurnRightAnim="StandTurnRight135"
     bStasis=False
     bUseCylinderCollision=True
     RotationRate=(Yaw=80000)
	 Physics=PHYS_Walking
}
