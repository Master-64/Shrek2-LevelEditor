//================================================================================
// ShEnemyCreature.
//================================================================================

class ShEnemyCreature extends ShCreature
  Config(User);

var() float BeginAttackDistance;
var() float BeginApproachDistance;
var() Class<Emitter> fxDieClass;
var() Class<KWPickup> Prizeclass;
var() bool bDisablePrizeVelocity;
var Vector HomeLocation;
var() Class<Emitter> fxShrinkClass;
var() Class<Emitter> fxLoveClass;
var() Class<Emitter> fxSleepClass;
var() Class<Emitter> fxStinkClass;
var() Class<Emitter> fxFrogClass;
var() Class<Emitter> fxFreezeClass;
var Emitter eShrink;
var Emitter eLove;
var Emitter eSleep;
var Emitter eStink;
var Emitter eFrog;
var Emitter eFreeze1;
var Emitter eFreeze2;

function AddAnimNotifys()
{
}

function SpawnDieParticles()
{
}

event FellOutOfWorld(Actor.eKillZType KillType)
{
}

function HitWall(Vector HitNormal, Actor HitWall)
{
}

defaultproperties
{
     BeginAttackDistance=1024.000000
     BeginApproachDistance=2048.000000
     fxDieClass=Class'SHGame.Creature_Explode'
     Prizeclass=Class'SHGame.Coin'
     fxShrinkClass=Class'SHGame.Potion_Shrinkall'
     fxLoveClass=Class'SHGame.Potion_Love'
     fxSleepClass=Class'SHGame.Potion_Sleep'
     fxStinkClass=Class'SHGame.Potion_Stink'
     fxFrogClass=Class'SHGame.Potion_Froggy'
     fxFreezeClass=Class'SHGame.Potion_Misty'
     ControllerClass=Class'SHGame.ShEnemyCreatureController'
}
