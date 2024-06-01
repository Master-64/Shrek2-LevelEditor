//================================================================================
// Spider.
//================================================================================

class Spider extends ShCreature
  Config(User);

var(sounds) array<Sound> sfxDie;
var(sounds) array<Sound> sfxAttack;
var BouncePad HomePad;
var Vector HomeLocation;
var() Rotator IdleRotationSpeed;
var() Rotator AgitatedRotationSpeed;
var() float WaitTimeBase;
var() float WaitTimeDelta;
var() float TimeBetweenAttacksBase;
var() float TimeBetweenAttacksDelta;
var() float AttackDistance;
var() float ApproachDistance;
var() float MoveToAttackDistance;
var() float MaxWanderFromHomeDistance;
var() bool RandomizeDrawScale;
var() float RandomizedDrawScaleBase;
var() Class<Emitter> fxDieClass;
var() int HeroActivateDistance;
var bool bAmShrunken;
var Material SkinOriginal;
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

function AddAnimNotifys()
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function SpawnDieParticles()
{
}

function bool PotionBegin(int Potion)
{
}

function PotionFinished(int Potion)
{
}

function TransformToFrog()
{
}

function TransformFromFrog(class<Controller> clsType, string Mesh)
{
}

function SleepPotionStart()
{
}

function SleepPotionEnd(class<Controller> clsType)
{
}

function StinkPotionStart()
{
}

function StinkPotionEnd(class<Controller> clsType)
{
}

function InvisiblePotionStart()
{
}

function InvisiblePotionEnd()
{
}

function FreezePotionStart()
{
}

function FreezePotionEnd(class<Controller> clsType, string newskin)
{
}

function ShrinkPotionStart()
{
}

function ShrinkPotionEnd(class<Controller> clsType)
{
}

function LovePotionStart()
{
}

function LovePotionEnd()
{
}

defaultproperties
{
     sfxDie(0)=Sound'Peasants.action_swoosh01'
     sfxDie(1)=Sound'Peasants.action_swoosh02'
     sfxDie(2)=Sound'Peasants.action_swoosh03'
     sfxAttack(0)=Sound'Peasants.action_swoosh01'
     sfxAttack(1)=Sound'Peasants.action_swoosh02'
     sfxAttack(2)=Sound'Peasants.action_swoosh03'
     sfxAttack(3)=Sound'Peasants.action_swoosh04'
     sfxAttack(4)=Sound'Peasants.action_swoosh05'
     sfxAttack(5)=Sound'Peasants.action_swoosh06'
     sfxAttack(6)=Sound'Peasants.action_swoosh07'
     IdleRotationSpeed=(Yaw=4000)
     AgitatedRotationSpeed=(Yaw=8000)
     WaitTimeBase=3.000000
     WaitTimeDelta=4.000000
     TimeBetweenAttacksBase=0.600000
     TimeBetweenAttacksDelta=2.000000
     AttackDistance=256.000000
     ApproachDistance=700.000000
     MoveToAttackDistance=100.000000
     MaxWanderFromHomeDistance=120.000000
     RandomizedDrawScaleBase=1.000000
     fxDieClass=Class'SHGame.Creature_Explode'
     HeroActivateDistance=3000
     fxShrinkClass=Class'SHGame.Potion_Shrinkall'
     fxLoveClass=Class'SHGame.Potion_Love'
     fxSleepClass=Class'SHGame.Potion_Sleep'
     fxStinkClass=Class'SHGame.Potion_Stink'
     fxFrogClass=Class'SHGame.Potion_Froggy'
     fxFreezeClass=Class'SHGame.Potion_Misty'
     DamageAmount=7
     LoadString="ShrekCharacters.Spider"
     SkinFreeze=FinalBlend'ShCharacters.spider_ice'
     bCouldBeAttacked=True
     bRequireFightIdle=True
     bUseBlobShadow=True
     WalkAnims(1)="Walk"
     WalkAnims(2)="Walk"
     WalkAnims(3)="Walk"
     AirAnims(0)="None"
     AirAnims(1)="None"
     AirAnims(2)="None"
     AirAnims(3)="None"
     TakeoffAnims(0)="None"
     TakeoffAnims(1)="None"
     TakeoffAnims(2)="None"
     TakeoffAnims(3)="None"
     LandAnims(0)="None"
     LandAnims(1)="None"
     AirStillAnim="None"
     TakeoffStillAnim="None"
     GroundRunSpeed=50.000000
     GroundWalkSpeed=50.000000
     GroundSpeed=50.000000
     ControllerClass=Class'SHGame.Spidercontroller'
     BaseMovementRate=50.000000
     MovementAnims(0)="Walk"
     MovementAnims(1)="Walk"
     MovementAnims(2)="Walk"
     MovementAnims(3)="Walk"
     TurnLeftAnim="Walk"
     TurnRightAnim="Walk"
     bActorShadows=True
     Mesh=SkeletalMesh'ShrekCharacters.Spider'
     bUnlit=True
     CollisionRadius=58.000000
     CollisionHeight=22.000000
}
