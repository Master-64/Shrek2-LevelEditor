//================================================================================
// WheelStealerController.
//================================================================================

class WheelStealerController extends Sh_NPCController;

var WheelStealerSpawnDirector Dir;
var WheelStealerSpawnDirector myDirector;
var Actor pathDest;
var Vector catchLocation;
var Rotator ThrowRotation;
var bool bGoingToCatchWheel;
var Vector vDir;
var PickupWheel pWheel;
var Vector pWheelLocation;
var int randReaction;
var bool bAttachedToBone;
var int randDialogNum;
var float DialogLength;

function DamageEnemy(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function SpawnCoins()
{
}

function SpawnPrize(Vector vDir)
{
}

function CatchTheWheel(Vector Loc)
{
}

function StartOver()
{
}

function PlaySfx(array<Sound> sfxArray)
{
}

defaultproperties
{
}
