//================================================================================
// CommentaryManager.
//================================================================================

class CommentaryManager extends Info;

struct CommentData
{
  var name CommentKeyTAG;
  var name eSpeakingCharacter;
  var name InterruptionKey;
  var bool bNoGap;
  var name ResponseKey;
  var name ResponseCharacterTAG;
  var int eAction;
  var name ActorToActOnTAG;
};

struct Candidate
{
  var int Variant;
  var float fWeight;
};

struct VarDialogInfo
{
  var int Variations;
  var bool bHasBeenSaid;
  var float fTimeLastSaid;
};

const MAX_COMMENT_VARIANTS= 30;
struct DialogInfo
{
  var string DlgName;
  var bool bHasBeenSaid;
  var float fTimeLastSaid;
};

struct VarSpeakingActorInfo
{
  var Actor TheActor;
  var name TheTag;
};

var float fNextTimeACommentCanBeSaid;
var float fTimeLastDialogFinished;
var float fGapTime;
var int NumCandidates;
var bool bAmPaused;
var() float fCommentaryVolume;
var() bool bNoSubtitles;
var() int NumCompanionComments;
var() array<string> CompanionComments;
var int NumSpeakingActors;
var() array<VarSpeakingActorInfo> SpeakingActors;
var() array<VarDialogInfo> Comments;
var() float fNoGapTimeBetweenComments;
var() float fMinGapTimeBetweenComments;
var() float fMaxGapTimeBetweenComments;
var() float fMinTimeBeforeCommentRepeat;
var() Candidate Candidates[90];
var Actor LastSpeakingActor;
var() bool without3D;
var CommentData TimedComment;
var bool AmConversing;
var ConversationTrigger CurrentConversation;
var int WhichConversationDialog;
var CommentaryTrigger CurrentCommentary;

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

function ComposeCommentList(name KeyName)
{
}

function bool AddKeyName(name KeyName)
{
}

function Actor GetCommentaryActor(name TagIn)
{
}

function string GetGenericID(int eventNum, int Variant, bool GetID)
{
}

function string GetTextID(int eventNum, int Variant)
{
}

function string GetCommentId(int eventNum, int Variant)
{
}

function string EventNumToEventName(int Num)
{
}

function int GetCommentKeyIndex(name SearchName)
{
}

function float SaySimpleComment(name CommentKey, optional string IntFileName, optional KWPawn kwp)
{
}

function bool SayComment(name CommentKey, name SpeakingCharacterTAG, optional name InterruptionKey, optional bool bNoGap, optional int eAction, optional name ActorToActOnTAG, optional Actor SpeakingCharacterActor, optional string IntFileName, optional out float DialogLength, optional bool SayNow)
{
}

function StartCommentary(CommentaryTrigger CommentaryTgrIN)
{
}

function StartConversation(ConversationTrigger ConversationTrgIN)
{
}

function SayFirstConversationDialog()
{
}

function SayNextConversationDialog()
{
}

function PauseCommentary()
{
}

function UnPauseCommentary()
{
}

defaultproperties
{
     fCommentaryVolume=1.400000
	 CompanionComments(0)="KOD_Acorn"
     fNoGapTimeBetweenComments=0.050000
     fMinGapTimeBetweenComments=5.600000
     fMaxGapTimeBetweenComments=10.000000
     fMinTimeBeforeCommentRepeat=90.000000
     without3D=True
}
