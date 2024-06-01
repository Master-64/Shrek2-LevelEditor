//================================================================================
// HalberdKnightCombatController.
//================================================================================

class HalberdKnightCombatController extends CombatController;

var(Enemy) float AttackInterval;
var Vector hubcapLocation;
var Vector testLoc;
var Vector testNormal;
var bool bJustDamaged;

function DoUnTrigger()
{
}

function DoTrigger()
{
}

function HitSomebody(int hitdamage, array<Sound> SoundArray, name animseq, float AnimFrame)
{
}

defaultproperties
{
     AttackInterval=1.000000
}
