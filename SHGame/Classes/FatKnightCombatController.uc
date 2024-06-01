//================================================================================
// FatKnightCombatController.
//================================================================================

class FatKnightCombatController extends EnemyBossCombatController;

var int knightType;
var int currentDamage;
var Vector vDir;
var bool bRunAway;
var bool bJustDamaged;

function Init()
{
}

function DamageEnemy(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function HitSHPawn(Actor HitActor, int hitdamage, array<Sound> SoundArray, class<DamageType> DamageType)
{
}

defaultproperties
{
}
