//================================================================================
// CSPreCombatController.
//================================================================================

class CSPreCombatController extends ShEnemyController;

var Actor nextStopOnRoute;
var Actor LastGoalReached;
var WorkMarker CurrentWorkMarker;
var int StopCounter;
var float FidgetCounter;
var WorkMarker wm;
var bool bFidgeting;

function Init()
{
}

function ReInit()
{
}

function PotionFinished()
{
}

defaultproperties
{
}
