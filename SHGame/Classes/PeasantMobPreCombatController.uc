//================================================================================
// PeasantMobPreCombatController.
//================================================================================

class PeasantMobPreCombatController extends ShEnemyController;

var bool bWaiting;
var array<Vector> locationArray;
var BaseCam cam;
var(Enemy) int activateDistance;
var(Enemy) int followDistance;
var(Enemy) float mobDialogFrequency;

function Init()
{
}

function Trigger(Actor Other, Pawn EventInstigator)
{
}

function DoUnTrigger()
{
}

defaultproperties
{
     activateDistance=200
     followDistance=300
     mobDialogFrequency=5.000000
}
