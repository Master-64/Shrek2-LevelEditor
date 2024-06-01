//================================================================================
// KWPawnNative.
//================================================================================

class KWPawnNative extends Pawn
  Config(User);

var SplineManager SplineManager;
var(Spline) name SplinePathName;
var(Spline) name StartSplinePointTag;
var(Spline) name DestSplinePointTag;
var(Spline) float SplineSpeed;
var(Spline) float SplineAccel;
var KWInterpolationPoint LastIPoint;
var Rotator SplineRotSave;
var(Spline) bool bInterpolating_IgnoreRot;
var(Spline) float IPSpeed;
var const native float LastMoveTime;
var const native Vector OldLocation;
var float fNavStallTime;
var(AI) float fMinDistBeforeStall;
var(AI) float fTimeBeforeStall;
var(AI) float fTimeToUseAdvancedTacticsAfterStall;
var Vector vStepDiff;
var(AI) class<AIController> ControllerClass;
var(Movement) bool bCanJump;
var(Movement) bool bCanWalk;
var(Movement) bool bCanSwim;
var(Movement) bool bCanFly;
var(Movement) bool bCanClimbLadders;
var(Movement) bool bCanStrafe;
var(Movement) bool bCanDoubleJump;
var(Movement) bool bAvoidLedges;
var(Movement) bool bStopAtLedges;
var(Pawn) bool bCanBeBaseForPawns;
var(Movement) float WaterSpeed;
var(Movement) float AirSpeed;
var(Movement) float LadderSpeed;
var(Movement) float AccelRate;
var(Movement) float JumpZ;
var(AnimTweaks) float BaseMovementRate;
var(Animation) name MovementAnims[4];
var(AnimTweaks) float BlendChangeTime;
var(Skeletal) name MouthBone;
var(Movement) float StepHeight;
var(Movement) float StepWidth;
var(Movement) float GroundFrictionOverride;
var(Movement) bool bOverrideGroundFriction;
var(Movement) float FlyFrictionOverride;
var(Movement) bool bOverrideFlyFriction;
var(Pawn) float fMinFloorZ;
var(Pawn) float fLumosRadius;
var(Actor) KWGame.ELumosType LumosType;
var(Advanced) KWGame.EMountAction MountAction;
var(Advanced) KWGame.EMaterialType MaterialType;
var(Lighting) bool bNoShadows;
var(Advanced) bool bHideOnDetailDrop;
var(Display) int AlphaSortLayer;
var(Display) float LODBiasSW;
var(Display) float CullDistanceSW;
var(Advanced) bool bDontBatch;
var(Sound) float TransientSoundPitch;
var(Collision) const float CollisionWidth;
var(Collision) KWGame.ECollideType CollideType;
var(Movement) bool bSmoothDesiredRot;
var(Movement) Rotator RotationalAcceleration;
var(Movement) float fRotationalTightness;
var(Collision) bool bAlignBottom;
var(Collision) bool bAlignBottomAlways;
var(Actor) string Label;
var(Editing) bool bPauseWithSpecial;
var(Collision) bool bBlocksCamera;
var(Display) bool bUseSkinColorMod;
var(Display) Color SkinColorModifier;
var(Animation) float fDefaultAnimRate;
var(Animation) float fDefaultTweenTime;
var(Animation) int DefaultAnimChannel;
var(Reaction) Class<Projectile> vulnerableToClass;
var(Targeting) float SizeModifier;
var(Targeting) Vector CentreOffset;
var(Targeting) float GestureDistance;
var(Targeting) bool bGestureFaceHorizOnly;
var(Targeting) bool bMustClickToTarget;
var(GameState) array<string> ExcludeFromGameStates;
var(Opacity) bool bChangeOpacityForCamera;
var(Opacity) float DesiredOpacityForCamera;
var(Opacity) float SpeedOpacityForCamera;
var(Opacity) float CurrentOpacityForCamera;

function AddPawn();

function RemovePawn();

function AddSpecialPawn();

function RemoveSpecialPawn();

function CM(coerce string S);

function LogAndCM(coerce string S);

function CMAndLog(coerce string S);

function bool assertm(bool B, coerce string S);

function Actor GetActorFromLabel(string rTag);

function OnEvent(name EventName);

function SetOpacity(float NewOpacity);

function MakeSkins();

function SetSkinColor(optional byte R, optional byte G, optional byte B, optional byte A);

function AddNotify(MeshAnimation AnimSet, name sequence, float frame, name EventName);

function AddNotifyObj(AnimNotify Notify);

function bool SaveGameExists(int iSlot);

function bool FancySetLocation(Vector NewLocation, optional bool bZOnly);

function Actor FancySpawn(class<Actor> type, optional Actor Owner, optional name SpawnTag, optional Vector SpawnLocation, optional Rotator SpawnRotation, optional bool bZOnly);

function Vector ApproximateTrajectoryByTime(Vector vPosStart, Vector vPosEnd, float fTimeEnd, float accuracy, optional float AlternateZAccel);

function Vector ComputeTrajectoryByTime(Vector vPosStart, Vector vPosEnd, float fTimeEnd, optional float AlternateZAccel);

function Vector ComputeTrajectoryByVelocity(Vector vPosStart, Vector vPosEnd, float fStartVelocity, optional float AlternateZAccel);

function Vector ComputeTrajectoryByAngle(Vector vPosStart, Vector vPosEnd, float fStartAngle, optional float AlternateZAccel);

function SetAnimRate(float rate, optional int Channel);

function float GetAnimRate(optional int Channel);

function float GetAnimFrame(optional int Channel);

function float GetAnimTime(optional int Channel);

function name GetAnimSequence(optional int Channel);

function float GetAnimNumFrames(optional int Channel);

function MeshAnimation GetAnimObjectByName(name NameOfAnim);

function KSleep();

function FindCurrentMusic(out string CurrentMusic);

function array<string> Split(string Source, optional string Delimiter);

function bool OnCutExitCommand(string Command, out string sError);

static function string LoadStringArray(array<string> StringArray, string Filename);

static function string SaveStringArray(array<string> StringArray, string Filename);

static function string GetIniEntry(string SectionName, string KeyName, string PackageName);

static function KWDeleteSaveGame(int iSlot);

static function SetUTracing(bool bNewUTracing, optional bool bTraceNative);

static function bool IsUTracing();

static function string GetLanguage();

static function bool NeedSAPFont();

function name GetLastStateName();

static function float VSize2d(Vector V);

static function Vector normal2d(Vector V);

static function Vector vector2d(Vector V);

function Rotator RotationDiff(Rotator B, Rotator A);

function int RotationDir(int A, int B);

function float FClampScale(float f, float c1, float c2, float s1, float s2);

function float EaseBetween(float t);

function float EaseBetweenBell(float t);

function float EaseBetweenParabola(float t);

function float FancyEaseBetween(float t, optional float HowLinear);

function float EaseFrom(float t);

function float EaseTo(float t);

function string StripSpaces(string S);

static final function vector Vec(float X, float Y, float Z);

function bool PawnAtInterpolationPoint(KWInterpolationPoint IPoint, InterpolationManager IManager)
{
}

function SplineAtDestPoint(KWInterpolationPoint IPoint, InterpolationManager IManager)
{
}

function SplineTick(float dtime)
{
}

function FollowSplinePath(optional name PathName, optional float Speed, optional float Accel, optional name StartPointTag, optional name EndPointTag, optional bool bSnapToStartLoc, optional KWGame.enumMoveType MoveType, optional bool bDontAlignAlongPath, optional float Time)
{
}

function float CalcSplineSpeedFromTime(float Time, KWInterpolationPoint startPoint, name EndPointTag)
{
}

function GlobalCutBypass()
{
}

defaultproperties
{
     vStepDiff=(X=100.000000,Z=16.000000)
	 bJumpCapable=True
     bCanJump=True
     bCanWalk=True
     bCanWalkOffLedges=True
     bLOSHearing=True
     bUseCompressedPosition=True
     bWeaponBob=True
     Visibility=128
     DesiredSpeed=1.00
     MaxDesiredSpeed=1.00
     HearingThreshold=2800.00
     SightRadius=5000.00
     AvgPhysicsTime=0.10
     GroundSpeed=600.00
     WaterSpeed=300.00
     AirSpeed=600.00
     LadderSpeed=200.00
     AccelRate=2048.00
     JumpZ=420.00
     AirControl=0.05
     WalkingPct=0.50
     CrouchedPct=0.50
     MaxFallSpeed=1200.00
     fMinFloorZ=0.70
     BaseEyeHeight=64.00
     EyeHeight=54.00
     CrouchHeight=40.00
     CrouchRadius=34.00
     Health=100.00
     HeadScale=1.00
     noise1time=-10.00
     noise2time=-10.00
     Bob=0.01
     SoundDampening=1.00
     DamageScaling=1.00
     ControllerClass=Class'AIController'
     LandMovementState=PlayerWalking
     WaterMovementState=PlayerSwimming
     BaseMovementRate=525.00
     BlendChangeTime=0.25
     MouthBone=Body__Mouth
     fLumosRadius=512.00
     StepHeight=16.00
     StepWidth=32.00
     DrawType=DT_Mesh
     bStasis=True
     bUpdateSimulatedPosition=True
     RemoteRole=ROLE_SimulatedProxy
     NetPriority=2.00
     bTravel=True
     bCanBeDamaged=True
     bShouldBaseAtStartup=True
     bOwnerNoSee=True
     bCanTeleport=True
     bDisturbFluidSurface=True
     SoundRadius=60.00
     SoundVolume=255
     bCollideActors=True
     bCollideWorld=True
     bBlockActors=True
     bBlockPlayers=True
     bProjTarget=True
     bRotateToDesired=True
     RotationRate=(Pitch=4096,Yaw=20000,Roll=3072),
     bNoRepMesh=True
     bDirectional=True
	 bLightingVisibility=True
     bUseDynamicLights=True
     bAcceptsProjectors=True
     bReplicateMovement=True
     Role=ROLE_Authority
     NetUpdateFrequency=100.00
     LODBias=1.00
     LODBiasSW=1.00
     DrawScale=1.00
     DrawScale3D=(X=1.00,Y=1.00,Z=1.00),
     MaxLights=4
     ScaleGlow=1.00
     Style=STY_Normal
     bMovable=True
     SoundPitch=64
     TransientSoundVolume=0.30
     TransientSoundRadius=300.00
     TransientSoundPitch=1.00
     bBlockZeroExtentTraces=True
     bBlockNonZeroExtentTraces=True
     bJustTeleported=True
     RotationalAcceleration=(Pitch=200000,Yaw=200000,Roll=200000),
     fRotationalTightness=5.00
     Mass=100.00
     MessageClass=Class'LocalMessage'
     bAlignBottom=True
     bPauseWithSpecial=True
     SkinColorModifier=(R=128,G=128,B=128,A=255),
     fDefaultAnimRate=1.00
     SizeModifier=1.00
     CentreOffset=(X=0.00,Y=0.00,Z=10.00),
     GestureDistance=1.00
     DesiredOpacityForCamera=0.50
     SpeedOpacityForCamera=1.00
     CurrentOpacityForCamera=1.00
}
