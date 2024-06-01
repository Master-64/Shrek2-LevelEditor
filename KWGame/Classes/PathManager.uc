//================================================================================
// PathManager.
//================================================================================

class PathManager extends Info
  Placeable;

struct PathActorInfo
{
  var() name ActorTag;
  var() name PathMarkerTag;
  var Actor PathActor;
  var PathMarker currMarker;
};
var() name StartingPathTag;
var() name EndingPathTag;
var() Color PathColor;
var array<PathActorInfo> ActorsOnPath;
var array<PathMarker> PathMarkers;
var() bool bDebug;
var() bool bActive;
var() array<name> TagsToShowWhenActive;
var() array<name> TagsToHideWhenActive;
var() array<name> EventsToTriggerWhenActive;
var() array<name> TagsToShowWhenInActive;
var() array<name> TagsToHideWhenInActive;
var() array<name> EventsToTriggerWhenInActive;

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

function Trigger(Actor Other, Pawn inst)
{
}

function SetActiveProps()
{
}

function PathActorInfo ActorPathInfo(Actor toAdd, optional PathMarker startMarker)
{
}

function PathMarker GetNodeByActor(Actor requestor)
{
}

function PathMarker GetClosestPathMarker(Vector queryPoint)
{
}

function bool OnPath(Actor requestor)
{
}

function float GetPctOfPathByActor(Actor requestor)
{
}

function Vector ClosestPointOnPath(Actor requestor)
{
}

function Vector GetDirByActor(Actor requestor)
{
}

function Vector NearestPointOnPerimeter(Actor requestor)
{
}

defaultproperties
{
     bDebug=True
}
