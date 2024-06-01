//================================================================================
// TransientAmbientPawn.
//================================================================================

class TransientAmbientPawn extends AmbientPawn
  Abstract
  Config(User);

var bool bFlyer;
var() bool bSwimmer;
var bool bDestroySoon;
var() bool bPermanent;
var() TransientAmbientPawn NextSlave;
var() float SleepTime;

function MakePermanent()
{
}

function Destroyed()
{
}

function DestroyAll()
{
}

function VerifyLastRenderTime()
{
}

event FellOutOfWorld(Actor.eKillZType KillType)
{
}

function bool EncroachingOn(Actor Other)
{
}

function EncroachedBy(Actor Other)
{
}

function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
}

function float MoveTimeTo(Vector Destination)
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function Died(Controller Killer, class<DamageType> DamageType, Vector HitLocation)
{
}

function float GetSleepTime()
{
}

defaultproperties
{
    SleepTime=2
    bLOSHearing=false
    RemoteRole=ROLE_None
    bUnlit=true
    CollisionRadius=0
    CollisionHeight=0
    bCollideActors=false
    bBlockActors=false
    bBlockPlayers=false
    bProjTarget=false
}