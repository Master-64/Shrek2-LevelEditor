//================================================================================
// ExplodeMushroomNew.
//================================================================================

class ExplodeMushroomNew extends ShProps
  Config(User);

var() float DamageRadius;
var() int DamageAmount;
var() Class<Emitter> fxExplosionClass;
var Emitter fxExplosion;
var(sounds) array<Sound> sfxExplode;
var() float blowUpDelay;
var() name WakeUpAnimName;
var() Material PreExplodeFlash;

function Touch(Actor Other)
{
}

function Bump(Actor Other)
{
}

defaultproperties
{
     DamageRadius=150.000000
     DamageAmount=7
     fxExplosionClass=Class'SHGame.Mush_Bang'
     sfxExplode(0)=Sound'Items.mushroom_explode1'
     sfxExplode(1)=Sound'Items.mushroom_explode2'
     blowUpDelay=0.500000
     WakeUpAnimName="Idle2"
     PreExplodeFlash=MaterialSequence'EnvAnimsTx.redmushroom_glow'
     IdleAnimName="Idle1"
     ControllerClass=Class'SHGame.ExplodeMushroomNewController'
     MovementAnims(0)="Idle1"
     MovementAnims(1)="Idle1"
     MovementAnims(2)="Idle1"
     MovementAnims(3)="Idle1"
     TurnLeftAnim="Idle1"
     TurnRightAnim="Idle1"
     Mesh=SkeletalMesh'EnvAnims.Mushroom_exploding'
     DrawScale=3.000000
     CollisionRadius=23.000000
     CollisionHeight=30.000000
}
