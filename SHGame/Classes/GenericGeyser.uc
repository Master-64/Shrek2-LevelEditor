//================================================================================
// GenericGeyser.
//================================================================================

class GenericGeyser extends ShProps
  Config(User);

var() int DamageAmount;
var() bool bTriggerStart;
var bool bSpawned;
var() Class<Emitter> fxGeyserClass;
var Emitter geyserFX;
var() float ReactDistance;
var() name BoneName;
var Coords BoneCoords;
var() float Interval[6];
var int numIntervals;
var int intervalCounter;
var shpawn OwnerPawn;
var bool bAttachedToBone;
var bool bHit;
var() bool bGiveDamage;
var Vector savedLoc;
var bool bCollisionOn;
var() float particleLife;
var float particleLifeCounter;
var bool bTouched;
var(sounds) array<Sound> sfxGeyserFire;
var() Vector emitterEffectOffset;
var() Rotator emitterEffectRotation;
var() Vector collisionEffectOffset;
var() Rotator collisionEffectRotation;

function TriggerFX()
{
}

function bool GiveDamageToBase(Actor Base)
{
}

function OnEvent(name EventName)
{
}

function DoUnTrigger()
{
}

function DoTrigger()
{
}

function SetFXLocation(Vector V)
{
}

function SetFXRotation(Rotator R)
{
}

function bool GetCollideState()
{
}

defaultproperties
{
     DamageAmount=5
     ReactDistance=250.000000
     numIntervals=6
     bGiveDamage=True
     sfxGeyserFire(0)=None
     sfxGeyserFire(1)=None
     sfxGeyserFire(2)=None
     bCanBeBaseForPawns=True
     CollisionRadius=20.000000
     CollisionHeight=20.000000
     bBlockActors=False
     bBlockPlayers=False
	 DrawType=DT_Sprite
}
