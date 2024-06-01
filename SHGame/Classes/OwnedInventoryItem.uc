//================================================================================
// OwnedInventoryItem.
//================================================================================

class OwnedInventoryItem extends Actor;

enum E_OwnedInventoryItem {
  INV_None,
  INV_StrengthPotion,
  INV_SmallPixiePotion,
  INV_LargePixiePotion,
  INV_SmallMicePotion,
  INV_LargeMicePotion
};

var() array<Material> NewSkins;
var() array<Material> NewSkins1;
var Vector ShrekOffset;
var Rotator NewRotation;
var Vector PibShrekOffset;
var Rotator PibNewRotation;
var Rotator RotationSpeed;
var Rotator WorldRotation;
var Rotator ShrekRotSpeed;
var Rotator PibRotSpeed;
var float fBobAmountHoriz;
var float fBobAmountVert;
var() float fCycleTimeHoriz;
var() float fCycleTimeVert;
var() E_OwnedInventoryItem ItemType;

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

defaultproperties
{
     NewSkins(0)=Texture'Shrek2_Univ_Tex.PickUps.strengthpotion_tx'
     NewSkins(1)=Texture'Shrek2_Univ_Tex.PickUps.pixiepotion_tx'
     NewSkins(2)=Texture'Shrek2_Univ_Tex.PickUps.pixiepotion_tx'
     NewSkins(3)=Texture'Shrek2_Univ_Tex.PickUps.mousepotion_tx'
     NewSkins(4)=Texture'Shrek2_Univ_Tex.PickUps.mousepotion_tx'
     NewSkins1(0)=Texture'Shrek2_Univ_Tex.PickUps.strength_tx'
     NewSkins1(1)=Texture'Shrek2_Univ_Tex.PickUps.pixie_tx'
     NewSkins1(2)=Texture'Shrek2_Univ_Tex.PickUps.pixie_tx'
     NewSkins1(3)=Texture'Shrek2_Univ_Tex.PickUps.mouse_tx'
     NewSkins1(4)=Texture'Shrek2_Univ_Tex.PickUps.mouse_tx'
     ShrekOffset=(X=50.000000)
     NewRotation=(Pitch=49152)
     PibShrekOffset=(Y=-38.000000)
     PibNewRotation=(Roll=49152)
     ShrekRotSpeed=(Yaw=-300)
     PibRotSpeed=(Pitch=-300)
     fBobAmountHoriz=2.000000
     fBobAmountVert=10.000000
     fCycleTimeHoriz=1.500000
     fCycleTimeVert=3.000000
     StaticMesh=StaticMesh'Shrek2_Univ_SM.Spec_MoveShape'
     DrawScale=0.670000
     bUnlit=True
}
