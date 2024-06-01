//================================================================================
// ShEnemyController.
//================================================================================

class ShEnemyController extends Sh_NPCController;

var ShEnemy ShEnemy;
var Actor pathDest;
var bool bPlayFlyBack;
var float allCollisionRadius;
var EnemySpawnDirector E;
var int alreadyDeadRealityCheck;
var bool bBehindHero;
var bool bHitFromBehind;
var bool bCurrentlyBehind;
var Vector dir1;
var Vector dir2;
var Rotator rot1;
var Rotator rot2;
var float cosYaw;
var float cosAngle;
var bool bJustDamaged;
var Class<DamageType> MyDamage;
var Vector holeLocation;
var Rotator CurrentRotation;
var Vector vDir;
var FrogEnemy myFrog;
var bool vEmitterOn;
var Sound sfxIceBreak;
var int randDialogNum;

function Possess(Pawn aPawn)
{
}

function DamageEnemy(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function AttackDone()
{
}

function HitSHPawn(Actor HitActor, int hitdamage, array<Sound> SoundArray, class<DamageType> DamageType)
{
}

function HitSHPawnNoBone(Actor HitActor, int hitdamage, array<Sound> SoundArray, class<DamageType> DamageType)
{
}

function HitSomebody(int hitdamage, array<Sound> SoundArray, name animseq, float AnimFrame)
{
}

function SpawnAPrize(class<Actor> aClass, Vector vDir)
{
}

function SpawnPrize(Vector vDir)
{
}

function float EvaluatePathDistanceFromHero()
{
}

function float EvaluatePathDistanceFromHome()
{
}

function PlayerUpEnded()
{
}

function bool StateIsInterruptible()
{
}

function bool CanEnemySeePlayer()
{
}

function StopTorchFire()
{
}

function RemoveWeapon()
{
}

function DestroyWeapon()
{
}

function DestroyEmitters()
{
}

function NotifySpawnDirector()
{
}

function bool PlayFlyBack()
{
}

function Vector FindTheGround()
{
}

function FindTheWall(out Vector HitLocation, out Vector HitNormal)
{
}

function DoUnTrigger()
{
}

function DoTrigger()
{
}

function PotionFinished()
{
}

defaultproperties
{
     sfxIceBreak=Sound'Potions.ice_potion_break'
}
