//================================================================================
// KWAIController.
//================================================================================

class KWAIController extends KWAIControllerNative;

enum ETurnBeforeMoving {
  TBM_FALSE,
  TBM_TRUE,
  TBM_JUSTONCE
};

var KWPawn KWPawn;
var bool bDebug;
var BaseCam cam;
var name DefaultMovementState;
var name DefaultAirMovingState;
var name DefaultGroundMovingState;
var float fTimeBetweenNavigations;
var float fTimeToGetUnstuck;
var transient int iLastRandomBumpLine;
var transient int iCurBumpLine;
var transient name SavedPreBumpControllerState;
var transient name SavedPreBumpPawnState;
var transient float fLastBumpTime;
var transient KWPawn BumpingPawn;
var transient string CorralSavedBumpLineSet;
var transient bool CorralSavedbUseBumpLine;
var Route myRoute;
var Actor GoalTarget;
var Vector GoalPoint;
var Vector movePoint;
var Actor oldMoveTarget;
var Actor oldGoalTarget;
var Vector oldGoalPoint;
var Vector OldLocation;
var Actor lastFailedMoveTarget;
var name NavigateStateToGoToWhenDone;
var bool bInsideDecideMoveTarget;
var bool bUseSearchAlternative;
var Actor LeadingActor;
var Actor LeadingActorLastGoalTarget;
var bool bLeadingActorFirstEntry;
var name dLastStateName;
var KWPawn LeadChar;
var KWPawn OtherTrailingChar;
var Vector vTargetLoc;
var int iWhichTarget;
var int iWhichTrailingChar;
var(HeroFollow) bool bUseDistFromLeadCharForMovement;
var bool bJumpAfterLand;
var name SavedTrailingState;
var(HeroFollow) float TrailCharFollowRadius;
var(HeroFollow) float Target2dTolerance;
var float Target2dToleranceOriginal;
var(HeroFollow) float Target2dToleranceDelta;
var float Target2dToleranceDeltaOriginal;
var(HeroFollow) float LeadCharToleranceTowards;
var bool bOutsideOfTolerance;
var(HeroFight) float Target2dToleranceFight;
var(HeroFight) float Target2dToleranceDeltaFight;
var float TCMoveToTargetLocTimer;
var float TCWaitToMoveTimer;
var float TCWaitToMoveTimeOut;
var(HeroFollow) float TCWaitToMoveTimeOutMin;
var(HeroFollow) float TCWaitToMoveTimeOutMax;
var float TCWaitToMoveTimeOutMinOriginal;
var float TCWaitToMoveTimeOutMaxOriginal;
var bool bTCWantsToMove;
var(HeroFollow) float MoveToLeadCharsSideTimer;
var float DontFaceMoveDirTimer;
var ETurnBeforeMoving TCTurnBeforeMoving;
var bool bTCTurningToTarget;
var float fCharDodgeDistInner;
var float fCharDodgeDistOuter;
var Vector vRandom;
var float fRandomDistance;
var Vector vLeadCharSaveLoc1;
var Vector vLeadCharSaveLoc2;
var Vector vLeadCharMountDir;
var bool bReadyToJump;
var float fJumpTimer;
var bool bWallFollowDirNormal;
var float fTimeDoingObjDodge;
var float fTimeCantSeeTargetLoc;
var float fTimeToSpendFollowingWall;
var int iLastIdleAnim;
var float TimeOfLastIdleDialogAnim;
var int iLastIdleDialogAnim;
var float fRelocateTimer;
var float fBlindRunningTime;
var float fTimeLeftTrailingState;
var float fTimeFollowing;
var float fTimeNotFollowing;
var int iIdleAnimCounter;
var Actor aCorral;
var Vector vPosInCorral;
var KWPawn aOtherCorralChar;
var float IdleMonitorTime;
var CompanionTrigger CheerTrigger;
var Actor CurrentInterestActor;
var Class<Actor> CompanionGoodiePickupType;
var float GoodieCheckTimer;
var Actor aTargetGoodie;
var() float fPickupGoodieDistance;
var() float fPickupGoodieDistanceMult;

function SetDebug(bool bSet)
{
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
}

function Possess(Pawn aPawn)
{
}

function UnPossess()
{
}

function Init()
{
}

function BaseCam GetBaseCam()
{
}

function bool NotifyEventDoJumpUp(Vector vJumpDir)
{
}

event bool NotifyBump(Actor Other)
{
}

function NotifyTouch(Actor Other)
{
}

function NotifyOnFlyToDone()
{
}

function NotifyTrigger(Actor Other, Pawn EventInstigator)
{
}

function NotifyFalling()
{
}

function DoBumpLine(optional bool bJustTalk, optional string AlternateBumpLineSet)
{
}

function NavigateToward(Actor DestActor, optional bool bFlying, optional bool bRun, optional float Speed, optional name OptionalState, optional string StartPointName)
{
}

function NavigateTo(Vector EndPointVect, optional Actor DestActor, optional bool bFlying, optional bool bRun, optional float Speed, optional name OptionalState, optional string StartPointName, optional name StateToGoToWhenDone)
{
}

function SetGoalTarget(Actor inGoalTarget)
{
}

function SetGoalPoint(Vector inGoalPoint)
{
}

event FindPathFailed()
{
}

event MoveToFailed()
{
}

function DecideGoalTarget()
{
}

function DecideMoveTarget()
{
}

function RestartSearchToGoal(optional bool bOnlySearch)
{
}

function RestartSearchToGoalDelay()
{
}

function StartMoving()
{
}

function StopMoving()
{
}

function bool StateMoving_MoveStraightToGoalIfReachable()
{
}

function NavigationPoint FindClosestNavPoint()
{
}

function FollowRoute(Route aRoute, optional name AlternateState)
{
}

function SetupRoute()
{
}

function LeadActor(Actor ActorToLead, Route aRoute)
{
}

function bool LeadActor_ShouldMoveToNextPatrolPoint(Actor Other)
{
}

function DoMoveTo(Actor A, optional Vector V, optional Actor FocusActor)
{
}

function bool MoveToDone()
{
}

function DoTurnTo(Actor A, optional Vector V)
{
}

function bool TurnToDone()
{
}

function WasKilledBy(Controller Other)
{
}

function NotifyOnEvent(name EventName)
{
}

function NotifyOnStoppedAccelerating()
{
}

function NotifyOnStartedAccelerating()
{
}

function NotifyOnLeadCharStoppedAccelerating()
{
}

function bool IsTrailingChar()
{
}

function CompanionInit()
{
}

function SetVarsForCompanionFighting()
{
}

function SetVarsForCompanionNormal()
{
}

function bool IsACombatController()
{
}

function SetNewTCWaitToMoveTimeOut()
{
}

function StopTrailingLeadChar(optional bool bFinal)
{
}

function OnStopTrailingLeadChar()
{
}

function NotifyOnStartTrailingLeadChar()
{
}

function StartFightingWithLeadChar(KWPawn aBossFocus, optional CompanionCombatManager enemyManager)
{
}

function GoBackToNormalTrailingChar()
{
}

function Vector GetTargetLoc(int WhichTarget)
{
}

function Vector ModifyTCTarget(Vector v1, Vector v2, out int bPerformTraces)
{
}

function Actor Trace2(out Vector HitLocation, out Vector HitNormal, Vector TraceEnd, Vector TraceStart, optional bool bTraceActors, optional Vector Extent)
{
}

function JumpToLeadCharLoc(bool bLeadCharIsClimbing, Vector MountDelta)
{
}

function bool CheckBlockingPlayer()
{
}

function HandleNonTrailingIdleAnim(float dtime)
{
}

function ResetCompanionMovementVars()
{
}

function bool RelocateLostTC(optional bool bDoTraceRelocateBehindPlayer)
{
}

function bool RLTC_ReverseSearch(out Actor aSolution, out Vector vSolution)
{
}

function bool RLTC_MovementHistory(out Actor aSolution, out Vector vSolution)
{
}

function bool RLTC_ReverseTrace(out Actor aSolution, out Vector vSolution)
{
}

function bool RLTC_Pathnodes(out Actor aSolution, out Vector vSolution)
{
}

function bool RLTC_CameraCanSeePawn(optional Vector AlternateLoc)
{
}

function NavToOtherSideOfActor(Actor Other)
{
}

function bool InsideTCFollowRadius()
{
}

function bool OutsideTCFollowRadius()
{
}

function bool CharMovingTowardsMe(Pawn Char)
{
}

function WaitInCorral(name CorralTag)
{
}

function WaitInCorralActor(CompanionCorral cc)
{
}

function PickNewCorralLoc(bool bFirstPick)
{
}

function Rotator FindCorralSideLocRot(Pawn P)
{
}

function bool IsWaitingInCorral()
{
}

function bool WaitInCorralNotifyBump(Actor Other)
{
}

function TickAvoidLeadChar(float dt, optional Actor aAnchorActor, optional float RadiusFromAnchor)
{
}

function Vector GetIdleWanderCenterLoc()
{
}

function float GetIdleWanderRadius()
{
}

function GotoStateIdleWander()
{
}

function GotoStateRandomIdleAnim()
{
}

function bool CanIRespondToInterestManager()
{
}

function HandlePickupGoodies(float dtime)
{
}

function Actor FindNextGoodieToGrab()
{
}

defaultproperties
{
     DefaultMovementState="StateMoving"
     DefaultAirMovingState="StateAirMoving"
     DefaultGroundMovingState="StateGroundMoving"
     fTimeBetweenNavigations=0.100000
     bUseDistFromLeadCharForMovement=True
     TrailCharFollowRadius=450.000000
     Target2dTolerance=175.000000
     Target2dToleranceDelta=30.000000
     LeadCharToleranceTowards=80.000000
     Target2dToleranceFight=150.000000
     Target2dToleranceDeltaFight=5.000000
     TCWaitToMoveTimeOutMin=0.100000
     TCWaitToMoveTimeOutMax=0.600000
     MoveToLeadCharsSideTimer=1.000000
     fPickupGoodieDistance=150.000000
     fPickupGoodieDistanceMult=2.000000
     bNotifyApex=True
}
