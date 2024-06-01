//================================================================================
// KWGame.
//================================================================================

class KWGame extends GameInfo;

enum enumMoveType
{
    MOVE_TYPE_LINEAR,
    MOVE_SNAP,
    MOVE_TYPE_EASE_FROM,
    MOVE_TYPE_EASE_TO,
    MOVE_TYPE_EASE_FROM_AND_TO
};

struct SoundGroup
{
    var() Sound Sound;
    var() string LocalizedSound;
    var() float Volume;
    var() float Pitch;
    var() float Radius;
    var() Range PitchRange;
    var() Actor.ESoundSlot slot;
};

struct Range
{
    var() config float Min;
    var() config float Max;
};

struct RangeVector
{
    var() config Range X;
    var() config Range Y;
    var() config Range Z;
};

enum EMaterialType
{
    MTYPE_None,
    MTYPE_Stone,
    MTYPE_Rug,
    MTYPE_Wood,
    MTYPE_Cave,
    MTYPE_Cloud,
    MTYPE_Wet,
    MTYPE_Grass,
    MTYPE_Metal,
    MTYPE_Dirt,
    MTYPE_Hay,
    MTYPE_Leaf,
    MTYPE_Snow,
    MTYPE_Sand,
    MTYPE_QuickSand,
    MTYPE_Mud,
    MTYPE_WetCanJump
};

enum ELumosType {
  Lumos_None,
  Lumos_Appear,
  Lumos_Disappear
};

enum EMountAction {
  MA_AutoFinishMount,
  MA_AbleFinishMount,
  MA_UnAbleFinishMount,
  MA_StepUpOnlyMount
};

enum ECollideType
{
    CT_Cylinder,
    CT_Box
};

var() bool bAllowBehindView;
var Vector StartLocation;
var bool SimpleShadows;
var bool NoShadows;
var(GameState) string CurrentGameState;

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

function float EaseFunction(float t, KWGame.enumMoveType EaseType);

function SetGameState(string NewGameState)
{
}

function string GetGameState()
{
}

function int GetNumericGameState()
{
}

event InitGame(string Options, out string Error)
{
}

function ProcessServerTravel(string URL, bool bItems)
{
}

event PlayerController Login(string Portal, string Options, out string Error)
{
}

event PostLogin(PlayerController NewPlayer)
{
}

function SetPlayerDefaults(Pawn PlayerPawn)
{
}

function KWHeroController GetHeroController()
{
}

function string GetLevelName()
{
}

function Persistence_SaveBool(string VarName, bool val)
{
}

function bool Persistence_RestoreBool(string VarName, out int val)
{
}

function Persistence_SaveByte(string VarName, byte val)
{
}

function bool Persistence_RestoreByte(string VarName, out byte val)
{
}

exec function DumpPawnStates()
{
}

exec function ShowGameState()
{
}

defaultproperties
{
     bAllowBehindView=True
     bRestartLevel=False
     AutoAim=1.000000
     DefaultPlayerClassName="KWGame.KWHeroPawn"
     ScoreBoardType="XInterface.ScoreBoardDeathMatch"
     HUDType="KWGame.KWHud"
     MapListType="XInterface.MapListDeathMatch"
     MapPrefix="KW"
     BeaconName="KW"
     MaxPlayers=32
     GameName="KWGame"
     PlayerControllerClassName="KWGame.KWHeroController"
}
