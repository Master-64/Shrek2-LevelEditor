//================================================================================
// Trap.
//================================================================================

class Trap extends ShPropsStatic
  NotPlaceable
  Config(User);

var() int TrapDamage;
var() Sound TrapSound;
var() Class<Emitter> TrapLeavesEmitter;
var() Class<TrapLeaves> TrapLeavesClass;
var() TrapLeaves TrapLeavesSample;
var() name TrapStaticAnimName;
var() name TrapSnapAnimName;
var() bool bChangeOpacityForFadeOut;
var() float CurrentOpacityForFadeOut;
var() float DesiredOpacityForFadeOut;
var() float SpeedOpacityForFadeOut;

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

defaultproperties
{
     bSHPropsStaticGetDamageByExplode=True
}
