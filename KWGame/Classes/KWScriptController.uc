//================================================================================
// KWScriptController.
//================================================================================

class KWScriptController extends KWCutController;

var bool bUseScriptFacing;
var bool bFakeShot;
var PlayerController MyPlayerController;

function Destroyed()
{
}

function TakeControlOf(optional Pawn aPawn)
{
}

function SetNewScript(AIScript NewScript)
{
}

function CompleteAction()
{
}

function bool WeaponFireAgain(float RefireRate, bool bFinishedFire)
{
}

event NotifyJumpApex()
{
}

function SetEnemyReaction(int AlertnessLevel)
{
}

function DestroyPawn()
{
}

function Pawn GetMyPlayer()
{
}

function Pawn GetInstigator()
{
}

function Actor GetSoundSource()
{
}

function bool CheckIfNearPlayer(float Distance)
{
}

function ClearScript()
{
}

function int SetFireYaw(int FireYaw)
{
}

function Rotator AdjustAim(Ammunition FiredAmmunition, Vector projStart, int aimerror)
{
}

function LeaveScripting()
{
}

defaultproperties
{
     bUseScriptFacing=True
     bDebug=True
}
