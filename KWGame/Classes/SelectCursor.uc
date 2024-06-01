//================================================================================
// SelectCursor.
//================================================================================

class SelectCursor extends Actor;

var PlayerController Player;
var bool bReadyToTargetClickOnly;
var float fClickTimeThreshold;
var() bool bTargetSelf;
var Actor aPossibleTarget;
var Actor aCurrentTarget;
var bool bCursorOn;
var() bool bOnByDefault;
var bool bActivated;
var() bool bActivatedByDefault;
var float fCursorDistanceFromScreen;
var Vector vLOS_Dir;
var Vector vLOS_Start;
var Vector vLOS_End;
var Vector vLastValidHitPos;
var config float fLOS_Distance;
var Vector vHitLocation;
var Vector vHitNormal;
var bool bHitSomething;
var bool bDebug;
var Emitter temp;

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

function Setup()
{
}

function Fire(optional float f)
{
}

function AltFire(optional float f)
{
}

event ReleasedFire()
{
}

event ReleasedAltFire()
{
}

function bool PressingFire()
{
}

function bool PressingAltFire()
{
}

function SetLOSDistance(float fNewDistance)
{
}

function bool CanCameraSeeYouInFOV(int rOutsideFOV, Vector pos)
{
}

function bool IsFacingTarget(Actor aTarget)
{
}

function bool bIgnoreActor(Actor HitActor, Vector Loc)
{
}

function bool IsValidTarget(Actor Other)
{
}

function DrawLines(HUD HUD)
{
}

function float AddDistFromPawn()
{
}

function UpdateCursorPosition(optional bool bJustStopAtClosestPawnOrWall)
{
}

function TurnCursorOn(bool bTurnOn)
{
}

function Activate(bool bActivate)
{
}

function bool bIsActivated()
{
}

defaultproperties
{
     fClickTimeThreshold=0.200000
     bOnByDefault=True
     fCursorDistanceFromScreen=50.000000
     fLOS_Distance=1500.000000
     CollisionRadius=5.000000
     CollisionHeight=5.000000
}
