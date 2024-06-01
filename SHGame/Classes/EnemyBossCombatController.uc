//================================================================================
// EnemyBossCombatController.
//================================================================================

class EnemyBossCombatController extends ShEnemyController;

var int knightType;
var int currentDamage;
var Vector vDir;
var bool bRunAway;
var bool bJustDamaged;

function DamageEnemy(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function bool TooManyCombatants()
{
}

function DoUnTrigger()
{
}

function DoTrigger()
{
}

function HitSHPawn(Actor HitActor, int hitdamage, array<Sound> SoundArray, class<DamageType> DamageType)
{
}

function HitSomebody(int hitdamage, array<Sound> SoundArray, name animseq, float AnimFrame)
{
}

defaultproperties
{
}
