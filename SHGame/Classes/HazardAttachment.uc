//================================================================================
// HazardAttachment.
//================================================================================

class HazardAttachment extends Actor;

var bool bInstantDeath;
var int DamageAmount;
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

function float EaseFunction(float t, KWGame.enumMoveType EaseType);

function string StripSpaces(string S);

static final function vector Vec(float X, float Y, float Z);


function Bump(Actor Other)
{
}

defaultproperties
{
     Physics=PHYS_Trailer
     DrawType=DT_Mesh
     CollideType=CT_Box
     bLightingVisibility=true
     bUseDynamicLights=true
     bAcceptsProjectors=true
     bReplicateMovement=true
     RemoteRole=ROLE_DumbProxy
     Role=ROLE_Authority
     NetUpdateFrequency=100
     NetPriority=1
     LODBias=1
     LODBiasSW=1
     Texture=Texture'S_Actor'
     DrawScale=1
     DrawScale3D=(X=1,Y=1,Z=1)
     MaxLights=4
     ScaleGlow=1
     Style=STY_Normal
     bMovable=true
     SoundRadius=64
     SoundVolume=128
     SoundPitch=64
     TransientSoundVolume=0.3
     TransientSoundRadius=300
     TransientSoundPitch=1
     CollisionRadius=22
     CollisionHeight=22
     bBlockZeroExtentTraces=true
     bBlockNonZeroExtentTraces=true
     bJustTeleported=true
     RotationalAcceleration=(Pitch=200000,Yaw=200000,Roll=200000)
     fRotationalTightness=5
     Mass=100
     MessageClass=Class'LocalMessage'
     bAlignBottom=true
     bPauseWithSpecial=true
     SkinColorModifier=(B=128,G=128,R=128,A=255)
     fDefaultAnimRate=1
     SizeModifier=1
     CentreOffset=(X=0,Y=0,Z=10)
     GestureDistance=1
     DesiredOpacityForCamera=0.5
     SpeedOpacityForCamera=1
     CurrentOpacityForCamera=1
}
