//================================================================================
// ExplodingObject.
//================================================================================

class ExplodingObject extends ShProps
  Config(User);

var() float startFidgetDistance;
var() float ExplosionDelay;
var Emitter fxExplosion;
var() Class<Emitter> fxExplosionClass;
var() float DamageRadius;
var() int DamageAmount;
var() name ReactAnimName;
var() name IdleAnimName;
var() bool bWaitForThrow;
var() Class<DamageType> MyDamageType;
var(sounds) array<Sound> sfxExplode;
var(sounds) array<Sound> sfxReactSlow;
var(sounds) array<Sound> sfxReactMed;
var(sounds) array<Sound> sfxReactFast;
var() Color colorStart;
var() Color colorEnd;
var() int objectIncrement;
var Color NewColor;
var int incrementRed;
var int incrementGreen;
var int incrementBlue;
var bool colorChangeComplete;

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function Landed(Vector HitNormal)
{
}

function Bump(Actor Other)
{
}

function PlayIdle()
{
}

function OnEvent(name EventName)
{
}

function PlayReactAnim(float rate)
{
}

function ShowExplosion()
{
}

function DestroyPawn()
{
}

function ChangeColor()
{
}

function initColorChange()
{
}

function InitIncrement()
{
}

function bool colorDone(out int NewC, int End, int Start, int inc)
{
}

function IncrementRedColor()
{
}

function IncrementGreenColor()
{
}

function IncrementBlueColor()
{
}

function SetColorChange()
{
}

defaultproperties
{
     startFidgetDistance=350.000000
     ExplosionDelay=6.000000
     fxExplosionClass=Class'SHGame.Pumk_Bang'
     DamageRadius=400.000000
     DamageAmount=2
     MyDamageType=Class'SHGame.ExplodingObjectDamage'
     HitsToKill=1
     bCanBePickedUp=True
}
