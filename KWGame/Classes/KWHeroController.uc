//================================================================================
// KWHeroController.
//================================================================================

class KWHeroController extends PlayerController
  Config(User);

var KWPawn KWPawn;
var transient name TempName;
var bool bTempBool;
var transient bool bViewUpdated;
var transient Rotator savedViewRotation;
var transient Vector savedViewLocation;
var Class<SelectCursor> DefaultSelectCursorType;
var SelectCursor Cursor;
var bool bUseBaseCam;
var bool bCameraFollowPlayer;
var bool bMovePawn;
var BaseCam Camera;
var Class<BaseCam> CameraClass;
var config bool bUseCameraAxesForPawnMove;
var bool bShouldRotate;
var config bool bArrowKeysYaw;
var config bool bArrowKeysPitch;
var bool bDoingCutScene;
var Pawn nextPawn;
var float fTimeSinceStart;
var float fTimeForTransfer;
var Vector vTransferStart;
var input float aArrowUp;
var input float aArrowRight;
var float savedATurn;
var float savedALookUp;
var float savedAStrafe;
var float savedAForward;
var float savedAUp;
var bool bLastPressedFire;
var bool bLastPressedAltFire;
var name LastState;
var private bool bLockRotation;
var private Rotator RotationToLock;
var private Rotator RotationLockRange;
var private float fRotLockSpeed;
var private float fRotLockTightness;
var private bool bNowLocked;
var bool bTurnToAlternatePawnRot;
var int AlternatePawnRot;
var Actor ActorToMoveAround;
var float ActorToMoveAroundRadius;
var Vector ActorToMoveAroundTangent;
var bool bAllowFreeTurningInStateMoveInCircle;
var Rotator rSnapRotation;
var Rotator rSnapRotationSpeed;
var Vector vSlidingLastLoc[4];
var KWSlideJump aSlideJump;
var bool bUseFallingSpeedAsGroundSpeedOnLand;
var float fSlideSmallCylTimer;
var bool bBlockSlideSpeedInput;
var Vector vLastVel;
var Vector vThisVel;
var bool bFlewOffTrack;
var TelePit aActiveTelepit;
var KWCursor KCursor;
var bool bDoOpacityForCamera;
var Ladder TopOfLadder;
var string strGameMenu;
var string strGameMenuSave;
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

function string StripSpaces(string S);

static final function vector Vec(float X, float Y, float Z);

function bool SaveToSlot0OnMapLoad()
{
}

function SaveGame()
{
}

function ServerUTrace()
{
}

function NotifyTouch(Actor Other)
{
}

function NotifySetNewSlideDirection(Rotator NewRotation)
{
}

function bool ArrowKeysTurn()
{
}

function bool ArrowKeysPitch()
{
}

function bool InvertMouse()
{
}

function UpdateRotation(float DeltaTime, float maxPitch)
{
}

function makeCamera()
{
}

function CheckForCameraBlocking(float DeltaTime)
{
}

function makeCursor()
{
}

function SwitchToPawn(KWPawn P, optional float fTime)
{
}

event SetCameraActive(bool bActivate)
{
}

event PlayerCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
}

event transferedTo(Pawn NewTarget)
{
}

function Possess(Pawn NewPawn)
{
}

function UnPossess()
{
}

function Vector vCameraStart()
{
}

function Rotator GetRotationForPawnMove()
{
}

function Rotator rCameraRot()
{
}

function bool bShouldSnapRotation()
{
}

function int RotationClamp(int Input, int Low, int High)
{
}

function Rotator GetSnapRotation(Rotator DesiredRotation, float DeltaTime, optional bool bForce)
{
}

function SetRotationLockCone(bool bShouldLock, Rotator LockDirection, Rotator LockRange, optional float Speed, optional float tightness)
{
}

function ShakeView(float shaketime, float RollMag, Vector OffsetMag, float RollRate, Vector OffsetRate, float OffsetTime)
{
}

function SimpleShakeView(float shaketime, float mag, optional float DecayTime)
{
}

function bool bInCutScene(optional bool bCheckNonPlayerControlScenes)
{
}

function DoSmartStartSave()
{
}

function PlayerMove(float DeltaTime)
{
}

function bool AllowShowMenu()
{
}

function WasKilledBy(Controller Other)
{
}

event NotifyJumpApex()
{
}

function bool IsBeingTelepitted()
{
}

function SetActiveTelePit(TelePit t)
{
}

function ForceTelepitRestart()
{
}

function OnPostTelepitMove(TelePit tp)
{
}

function CheckForLeaveTrack(float dtime)
{
}

function Vector GetNormalBelowFeet(out Vector vLineTrace)
{
}

function ForceLoadPotionSelectMenu()
{
}

function ForceInGameMenu()
{
}

function EnemyKilled(Pawn Killer)
{
}

exec function ReportShadows()
{
}

exec function ReportActor(string S)
{
}

exec function DestroyActor(string S)
{
}

exec function DisableTick(string S)
{
}

exec function EnableTick(string S)
{
}

exec function GameState()
{
}

exec function SaveSlottedGame(int slot, optional bool bCopyToSlotZero)
{
}

exec function LoadGame(int GameSlot)
{
}

exec function LoadSlottedGame(int GameSlot)
{
}

exec function KillPawn()
{
}

exec function ToggleKWaiControllerDebug(name type)
{
}

exec function UTrace()
{
}

exec function UTraceNat()
{
}

exec function showvars()
{
}

exec function PrintFile(string S)
{
}

exec function WriteFile(string S)
{
}

exec function GameSpeedUp()
{
}

exec function GameSpeedDown()
{
}

exec function SetActorFade(string S)
{
}

exec function ToggleHud()
{
}

exec function ShowPaths(string S)
{
}

exec function ShowCorral(string S)
{
}

exec function SetCamFans(int Num)
{
}

exec function GetState(name t)
{
}

exec function RunTo(string S)
{
}

exec function SoarTo(string S)
{
}

exec function FlyTo(string S)
{
}

exec function set3DFade(string S)
{
}

exec function setFade(string S)
{
}

exec function doFlash(string S)
{
}

exec function MovePawn(string S, optional bool bInstant, optional bool bUseTagInsteadOfLabel)
{
}

exec function MovePawnWithoutRotation(string S, optional bool bInstant, optional bool bUseTagInsteadOfLabel)
{
}

exec function CameraGoBack()
{
}

exec function SwapPawn(string S)
{
}

exec function SCTP(name pawntag)
{
}

exec function SwitchControlToPawn(name pawntag)
{
}

exec function SetMouseSpeed(string S)
{
}

exec function DeleteCam(int ShowPlayer)
{
}

exec function DeleteCamShowPlayer()
{
}

exec function FreeCam()
{
}

exec function MenuCam()
{
}

exec function record(coerce string S)
{
}

exec function PlayBack(coerce string S)
{
}

exec function Fire(optional float f)
{
}

exec function AltFire(optional float f)
{
}

exec function ToggleCamera(string S)
{
}

exec function ShowMenu()
{
}

exec function ShowDevMenu()
{
}

exec function KillPlayer(name N)
{
}

exec function HurtPlayer(name N)
{
}

exec function FraserIsGod()
{
}

exec function StopMoviePlayback()
{
}

exec function EscHandler()
{
}

defaultproperties
{
     DefaultSelectCursorType=Class'KWGame.SelectCursor'
     bUseBaseCam=True
     bMovePawn=True
     CameraClass=Class'KWGame.BaseCam'
     bUseCameraAxesForPawnMove=True
     bShouldRotate=True
     bArrowKeysYaw=True
     strGameMenu="KWGame.MainMenuPage"
     strGameMenuSave="KWGame.MainMenuPage"
     bBehindView=True
     CheatClass=Class'KWGame.KWCheatManager'
     InputClass=Class'KWGame.KWPlayerInput'
     bNotifyApex=True
     RotationRate=(Pitch=4096,Yaw=45000,Roll=3072)
}
