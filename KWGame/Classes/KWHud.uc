//================================================================================
// KWHud.
//================================================================================

class KWHud extends HUD
  Config(User);

enum eKWHudTextColor
{
    KWHTC_NearBlack,
    KWHTC_Black,
    KWHTC_NearWhite,
    KWHTC_White
};
var globalconfig bool bDisableHUD;
var float fBaseResX;
var float fBaseResY;
var float fScaleX;
var float fScaleY;
var Font KWBigFont;
var Font KWMedFont;
var Font KWSmallFont;
var Font KWTinyFont;
var KWCutTextController CutTextController;
var array<KWHudItem> HudItems;
var KWHud.eKWHudTextColor HudTextColor;
var KWHud.eKWHudTextColor HudTextShadow;
var array<KWOverlayPage> OverlayPages;
var string PlayerObjectiveDialogTag;
var bool bShowClientMessages;
var bool bHUDInitialized;

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

function SetManager(KWMiniGame newManager, int i)
{
}

function KWMiniGame GetManager(int i)
{
}

function DrawHUD(Canvas Canvas)
{
}

function SetupLanguage(Canvas Canvas)
{
}

function SetHideHUD(bool B)
{
}

exec function TM()
{
}

exec function ToggleMarkers()
{
}

exec function StopTimer()
{
}

exec function MaxActorLights(int number)
{
}

exec function ShowCM()
{
}

exec function ToggleCutLog()
{
}

exec function BypassCutscene()
{
}

exec function UseOldCutscenes(bool Value)
{
}

function SetObjective(string DialogTag)
{
}

function bool ShouldDisplayMessages()
{
}

function RenderToScale(Canvas C, Texture t)
{
}

function RenderToScale800x600(Canvas C, Texture t)
{
}

function float CalculateScaleX(Canvas C)
{
}

function float CalculateScaleY(Canvas C)
{
}

function float GetScaleX(Canvas C)
{
}

function float GetScaleY(Canvas C)
{
}

function StartCutScene(optional bool bMiniDialogue)
{
}

function EndCutScene()
{
}

function ShowCutBorders(bool bShow)
{
}

function SetSubtitleText(string Text, float Duration)
{
}

function ClearSubtitleText()
{
}

function KWHudItem AddHudItem(class<KWHudItem> classHudItem, KWHud parentHUD)
{
}

function FadeHudItem(int i)
{
}

function FadeHudItemIn(int i)
{
}

function FadeHudItemOut(int i)
{
}

function SetHudTimer(Actor aOther, float NewTimerRate, bool bLoop)
{
}

function ClearHudTimer()
{
}

function Font GetHudTextFont(Canvas Canvas)
{
}

function Font GetSmallHudTextFont(Canvas Canvas)
{
}

function Color GetHudTextColor(optional bool bShadow)
{
}

function AddOverlayPage(class<KWOverlayPage> classOverlayPage, KWHud parentHUD)
{
}

function ShowOverlayPage(int i)
{
}

function HideOverlayPage(int i)
{
}

function ShowHUDItem(string Tag)
{
}

function HideHUDItem(string Tag)
{
}

defaultproperties
{
     fBaseResX=800.000000
     fBaseResY=600.000000
}
