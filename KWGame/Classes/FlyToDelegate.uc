//================================================================================
// FlyToDelegate.
//================================================================================

class FlyToDelegate extends Info;

var KWPawn Controlled;
var Actor ControlledPrevOwner;
var EPhysics SavedPhysics;
var Vector vFlyToStart;
var Vector vFlyToDest;
var Vector vFlyToDestOffset;
var Rotator rFlyToOffsetRotOffset;
var Rotator rFlyToRotStepSize;
var float fFlyToTime;
var float fFlyToTimeSpan;
var float fEaseBetweenLinearness;
var bool bFlyToTurnWithChar;
var Actor aFlyToActor;
var bool bFlyToStayLockedToActor;
var Vector vSplinePoint;
var bool bUseSplinePoint;
var bool bUseMoveSmoothInsteadOfSetLocation;
var name StateToGotoAfterInactive;

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

function Init(KWPawn Parent)
{
}

function float GetFlyToPercent()
{
}

function bool FlyToDone()
{
}

function bool IsInactive()
{
}

function GoInactive()
{
}

function Destroyed()
{
}

function DoFlyTo(Vector DestLoc, KWGame.enumMoveType MoveType, float TimeSpan, optional Vector SplinePoint, optional name StateToGoToWhenDone)
{
}

function DoFlyTo_Actor(Actor A, Vector VOffset, KWGame.enumMoveType MoveType, float TimeSpan, optional bool bTurnWithChar, optional bool bRelativeToChar, optional bool bStayLockedToActor, optional Vector SplinePoint, optional Rotator rRotStepSize, optional name StateToGoToWhenDone)
{
}

function StartFlyTo(KWGame.enumMoveType MoveType, float TimeSpan, Vector SplinePoint)
{
}

function SetSpecialSplinePoint(float f)
{
}

function SetOwnershipForFlyto(bool bUseFlyToOrder, optional Actor newOwnerForDelegate)
{
}

defaultproperties
{
}
