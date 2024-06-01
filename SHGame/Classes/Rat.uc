//================================================================================
// Rat.
//================================================================================

class Rat extends ShEnemyCreature
  Config(User);

var bool bHasAttacked;
var() int RetreatDistanceMin;
var() int RetreatDistanceMax;
var() float RetreatTimeMin;
var() float RetreatTimeMax;
var() float PusuitCheckTime;
var bool bAmShrunken;
var Material SkinOriginal;
var() array<Sound> sfxOuch;
var() array<Sound> sfxRandSqueek;

function AddAnimNotifys()
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function HaveTouchedHero(Actor Other)
{
}

event Touch(Actor Other)
{
}

event Bump(Actor Other)
{
}

event Landed(Vector HitNormal)
{
}

function HitWall(Vector HitNormal, Actor HitWall)
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

function InvisiblePotionStart()
{
}

function InvisiblePotionEnd()
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

function ShrinkPotionStart()
{
}

function ShrinkPotionEnd(class<Controller> clsType)
{
}

function FreezePotionStart()
{
}

function FreezePotionEnd(class<Controller> clsType, string newskin)
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
     RetreatDistanceMin=64
     RetreatDistanceMax=256
     RetreatTimeMin=0.300000
     RetreatTimeMax=2.000000
     PusuitCheckTime=0.300000
     sfxOuch(0)=Sound'Rats.rat_hit_01'
     sfxOuch(1)=Sound'Rats.rat_hit_02'
     sfxRandSqueek(0)=Sound'Rats.squeek_01'
     sfxRandSqueek(1)=Sound'Rats.squeek_02'
     sfxRandSqueek(2)=Sound'Rats.squeek_03'
     BeginAttackDistance=800.000000
     BeginApproachDistance=1500.000000
     sfxDie(0)=Sound'Rats.rat_fall'
     sfxAttack(0)=Sound'Rats.attack_01'
     sfxAttack(1)=Sound'Rats.attack_02'
     sfxAttack(2)=Sound'Rats.attack_03'
     DamageAmount=7
     AttackCollisionRadius=90.000000
     LoadString="ShrekCharacters.Rat"
     SkinFreeze=FinalBlend'ShCharacters.rat_ice'
     bCouldBeAttacked=True
     bRequireFightIdle=True
     bUseBlobShadow=True
     BlobShadowLightDistance=65.000000
     WalkAnims(0)="run"
     WalkAnims(1)="run"
     WalkAnims(2)="run"
     WalkAnims(3)="run"
     AirAnims(0)="Static"
     AirAnims(1)="Static"
     AirAnims(2)="Static"
     AirAnims(3)="Static"
     TakeoffAnims(0)="Static"
     TakeoffAnims(1)="Static"
     TakeoffAnims(2)="Static"
     TakeoffAnims(3)="Static"
     LandAnims(0)="Static"
     LandAnims(1)="Static"
     AirStillAnim="Static"
     TakeoffStillAnim="Static"
     IdleAnimName="casualidle"
     GroundRunSpeed=100.000000
     GroundWalkSpeed=100.000000
     GroundSpeed=100.000000
     ControllerClass=Class'SHGame.Ratcontroller'
     BaseMovementRate=100.000000
     MovementAnims(1)="run"
     MovementAnims(2)="run"
     MovementAnims(3)="run"
     TurnLeftAnim="casualidle"
     TurnRightAnim="casualidle"
     bActorShadows=True
     Mesh=SkeletalMesh'ShrekCharacters.Rat'
     bUnlit=True
     SoundRadius=200.000000
     CollisionRadius=42.000000
     CollisionHeight=34.000000
     RotationRate=(Pitch=0,Yaw=50000,Roll=0)
	 Physics=PHYS_Falling
}
