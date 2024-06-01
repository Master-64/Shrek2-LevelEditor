//================================================================================
// BaseCam.
//================================================================================

class BaseCam extends KWPawn
  Config(User);

const TWO_PI= 6.283185307179586476925286766559;
const MAX_ROLL_DIFF= 16000;
const MAX_YAW_DIFF= 30000;
const BASE_EXTENT_FOR_COLLISION_TRACE= 100.0;
const MIN_DISTANCE_FROM_TARGET= 30.0;
const DISTANCE_SCALAR_MIN= 0.15;
const PITCH_MOVING_IN_SPREAD= 32768.0f;
const PITCH_MOVING_IN_THRESHOLD= 0.0f;
const USE_DEBUG_MODE= false;
const NUM_USER_SETTINGS= 4;

struct Line
{
  var Vector Start;
  var Vector End;
};
var PlayerController Player;
var Actor savedOwnerOfTargetActor;
var int numOfFans;
var float fMouseDeltaX;
var float fMouseDeltaY;
var bool bSyncRotationWithTarget;
var bool bSyncPositionWithTarget;
var float fCameraRollModifier;
var bool bDoWorldCollisionCheck;
var bool bIgnoreTarget;
var BaseCamTarget CamTarget;
var Vector vForward;
var Rotator rRotationStep;
var Rotator rDestRotation;
var Vector vDestPosition;
var Rotator rCurrRotation;
var Vector vCurrPosition;
var float fDestLookAtDistance;
var float fDesiredLookAtDistance;
var float fCurrLookAtDistance;
var float fDestLookAtHeight;
var float fCurrLookAtHeight;
var float fMoveBackTightness;
var CamSettings CurrentSet;
var Rotator rBossRotationOffset;
var Rotator rExtraRotation;
var CamSettings CamSetStandard;
var CamSettings CamSetTransition;
var CamSettings CamSetQuidditch;
var CamSettings CamSetFlyingCar;
var CamSettings CamSetCutScene;
var CamSettings CamSetDueling;
var CamSettings CamSetFree;
var CamSettings CamSetBoss;
var CamSettings CamSetFollow;
var CamSettings UserSettings[4];
var Rotator rViewConeRot;
var config bool bUseViewCone;
var Rotator rSavedRotation;
var Vector vSavedPosition;
var float fPitchMovingInThreshold;
var float fPitchMovingInSpread;
var float fDistanceScalar;
var float fDistanceScalarMin;
var float DESIRED_DIST_FROM_WALL;
var() bool bHideTargetActorIfInside;
var() int MaxBossAimRot;
var string cue;
var bool bInsideSomething;
var bool bDebug;
var bool bTransitioning;
var float fTimeForTransfer;
var float fTimeSinceTransfer;
var Vector vOrigPos;
var Rotator rOrigRot;
var bool bRecord;
var float fSampleRate;
var(recording) float fDefaultSampleRate;
var float fTimeSinceLastSample;
var string currentSession;
var int currentIndex;
var int MainIndex;
var Sample LastSample;
var Sample NextSample;
var array<Sample> sampleArray;
var float MaxShakeRoll;
var float ShakeRollTime;
var float ShakeRollRate;
var Vector ShakeOffset;
var Vector ShakeOffsetTime;
var Vector MaxShakeOffset;
var Vector ShakeOffsetRate;
var float SimpleShakeTotalTime;
var float SimpleShakeTime;
var float SimpleShakeMag;
var float SimpleShakeDecayTime;
var Rotator ShakeRotOffset;
var float fTrainRoll;
var float fTrainRollVel;
var float fTrainOverallMag;
var bool bDoTrainShake;
var float LastTime;
var float ROT_TO_RAD;
var array<Line> debugLines;

enum ECamMode {
  CM_Startup,
  CM_Idle,
  CM_Transition,
  CM_Standard,
  CM_Quidditch,
  CM_FlyingCar,
  CM_Dueling,
  CM_CutScene,
  CM_Boss,
  CM_Follow,
  CM_Delete,
  CM_Playback,
  CM_Free,
  CM_MenuCam
};

function float ConvertRotToDeg(int iRot)
{
}

function float ConvertDegToRot(float fDeg)
{
}

function SetRot(Rotator newRot)
{
}

function SetYaw(float fYaw)
{
}

function SetPitch(float fPitch)
{
}

function SetRoll(float FRoll)
{
}

function SetMinPitch(float fPitch)
{
}

function SetMaxPitch(float fPitch)
{
}

function SetRotStep(Rotator Step)
{
}

function SetRotStepYaw(float fYaw)
{
}

function SetRotStepPitch(float fPitch)
{
}

function SetRotStepRoll(float FRoll)
{
}

function SetMoveBackTightness(float fTight)
{
}

function SetRotTightness(float fTight)
{
}

function SetRotSpeed(float fSpeed)
{
}

function SetMoveTightness(Vector fTight)
{
}

function SetMoveSpeed(float fSpeed)
{
}

function SetDistanceModifier(float factor, optional bool bSmoothTrans)
{
}

function SetTargetActorByname(name Target)
{
}

private function SetTargetActor(Actor Target)
{
}

function SetOffset(Vector V)
{
}

function SetXOffset(float X)
{
}

function SetYOffset(float Y)
{
}

function SetZOffset(float Z)
{
}

function SetModeByString(string Str)
{
}

function SetSyncPosWithTarget(bool bSyncPos)
{
}

function SetSyncRotWithTarget(bool bSyncRot)
{
}

function SetFOV(float fFOV, float fTime, KWGame.enumMoveType MoveType)
{
}

function SetPosition(Vector pos)
{
}

function BaseCam.ECamMode GetModeFromString(string Str)
{
}

function SetCameraMode(BaseCam.ECamMode eMode)
{
}

function GotoLastCameraMode()
{
}

function TransitionToCameraMode(BaseCam.ECamMode eMode)
{
}

function ShowSettings()
{
}

function LoadUserSettings(int i)
{
}

function SaveUserSettings(int i)
{
}

function setPlayer(PlayerController NewPlayer)
{
}

function SetMovementPhysics()
{
}

function InitRotation(Rotator Rot)
{
}

function InitPosition(Vector pos)
{
}

function PreCutPossess()
{
}

function PostCutPossess()
{
}

function PostCutUnPossess()
{
}

function PossessedBy(Controller C)
{
}

function UnPossessed()
{
}

function DestroyDelegates(optional bool bOnlyMoveDelegates)
{
}

function TurnOffAllFaders()
{
}

function StartRecording(string session, optional float newSampleRate)
{
}

function StopRecording()
{
}

function TakeSample(float fTimeSinceLast)
{
}

function PlayBack(string session, optional int startingIndex)
{
}

function int findIndexForSample(string session, int startingIndex)
{
}

function Sample GotoNextSample()
{
}

function SetRotatePawnFirst(bool bPawnFirst)
{
}

function ClearTransitioningFlag()
{
}

function InitSettings(CamSettings CamSet, bool bSyncWithTargetPos, bool bSyncWithTargetRot)
{
}

function InitTarget(Actor A, optional float fTimeToTrans, optional bool bResetSettings, optional bool bForceInitTarget)
{
}

function InitPositionAndRotation(bool bSnapToNewPosAndRot)
{
}

function Actor GetCurrentTargetActor()
{
}

function DrawLines(HUD HUD)
{
}

function bool bUpdateRot()
{
}

function bool bUpdateLoc()
{
}

function UpdateDistance(float fTimeDelta)
{
}

function bool ShouldUseViewCone()
{
}

function UpdateRotationUsingVectors(float fTimeDelta)
{
}

function ApplyInput(float fTimeDelta)
{
}

function ApplyMouseXToDestYaw(float fTimeDelta, optional bool bApplyToBossOffset)
{
}

function ApplyMouseYToDestPitch(float fTimeDelta, optional bool bApplyToBossOffset)
{
}

function Rotator rotNormalize(Rotator OldRot)
{
}

function SetDestRotation(Rotator newRot)
{
}

function UpdateRotation(float fTimeDelta)
{
}

function SetFinalRotation(Rotator R)
{
}

function Vector GetFinalLoc()
{
}

function Rotator GetFinalRot()
{
}

function UpdatePosition(float fTimeDelta, optional bool bSkipWorldCheck)
{
}

function bool bShouldBlock(Actor HitActor, optional Vector desiredLocation)
{
}

function bool CheckCollisionWithWorld(optional float fTimeDelta)
{
}

function TransitionTo(Actor A, float fTimeToTrans)
{
}

function Transition(float fTimeToTrans)
{
}

function DoSimpleFade(bool bFadeIn)
{
}

function DoFade(float A, float R, float G, float B, float fTime, KWGame.enumMoveType MoveType, optional bool bFlash)
{
}

function ShakeView(float shaketime, float RollMag, Vector OffsetMag, float RollRate, Vector OffsetRate, float OffsetTime)
{
}

private function ClientShake(Vector ShakeRoll, Vector OffsetMag, Vector ShakeRate, float OffsetTime)
{
}

function CheckShake(out float MaxOffset, out float offset, out float rate, out float Time)
{
}

function SimpleShakeView(float shaketime, float mag, optional float DecayTime)
{
}

private function SimpleClientShake(float shaketime, float mag, optional float DecayTime)
{
}

function ViewShake(float DeltaTime)
{
}

function bool CameraCanSeeYou(Vector pos)
{
}

function SetDefaultCameraSettings(KWPawn kwp)
{
}

exec function SetDistance(float fDist, optional bool bSmoothTrans)
{
}

defaultproperties
{
     numOfFans=4
     bSyncPositionWithTarget=True
     bDoWorldCollisionCheck=True
     fMoveBackTightness=4.000000
     CamSetQuidditch=(vLookAtOffset=(X=0,Y=0,Z=65),fLookAtDistance=175,fLookAtHeight=0,fRotTightness=2,fRotSpeed=0,fMoveTightness=(X=7,Y=7,Z=7),fMoveSpeed=0,fMaxMouseDeltaX=20000,fMaxMouseDeltaY=10000,fMinPitch=-14000,fMaxPitch=14000)
     CamSetFlyingCar=(vLookAtOffset=(X=0,Y=0,Z=175),fLookAtDistance=400,fLookAtHeight=0,fRotTightness=4,fRotSpeed=0,fMoveTightness=(X=4,Y=4,Z=4),fMoveSpeed=0,fMaxMouseDeltaX=20000,fMaxMouseDeltaY=10000,fMinPitch=-14000,fMaxPitch=14000)
     CamSetDueling=(vLookAtOffset=(X=0,Y=0,Z=45),fLookAtDistance=200,fLookAtHeight=0,fRotTightness=8,fRotSpeed=4,fMoveTightness=(X=3.5,Y=3.5,Z=3.5),fMoveSpeed=0,fMaxMouseDeltaX=20000,fMaxMouseDeltaY=10000,fMinPitch=-14000,fMaxPitch=14000)
     rViewConeRot=(Pitch=2000,Yaw=7000)
     bUseViewCone=True
     fDistanceScalar=1.000000
     DESIRED_DIST_FROM_WALL=15.000000
     bHideTargetActorIfInside=True
     fTimeForTransfer=1.000000
     fDefaultSampleRate=60.000000
     fTrainOverallMag=0.200000
     bAllowPitch=True
     AirSpeed=500.000000
     bHidden=False
     CollisionRadius=0.000000
     CollisionHeight=0.000000
     bCollideActors=False
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
     bRotateToDesired=False
}
