//================================================================================
// Bat.
//================================================================================

class Bat extends ShEnemyCreature
  Config(User);

var bool bHasAttacked;
var() int HoverRandomizer;
var() Vector HoverHeight;
var() float IdleTimer;
var() float ApproachTimer;
var() float PusuitCheckTime;
var() float TightPusuitDistance;
var() bool bAmShrunken;
var bool bIgnoreHero;
var Material SkinOriginal;
var() array<Sound> flapSfx;
var() array<Sound> squeekSfx;
var() Sound flappingSfx;

function AddAnimNotifys()
{
}

function NotifyPlayFlapSfx()
{
}

function PlayRandomSqueek()
{
}

function NotifyPlayFlappingSfx()
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function JumpOffPawn()
{
}

function bool HaveTouchedHero(Actor Other)
{
}

function ObjectContacted(Actor Other, optional Vector HitNormal)
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

function ShrinkPotionStart()
{
}

function ShrinkPotionEnd(class<Controller> clsType)
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

function LovePotionStart()
{
}

function LovePotionEnd()
{
}

function SleepPotionStart()
{
}

function SleepPotionEnd(class<Controller> clsType)
{
}

function FreezePotionStart()
{
}

function FreezePotionEnd(class<Controller> clsType, string newskin)
{
}

defaultproperties
{
     HoverRandomizer=128
     HoverHeight=(Z=178.000000)
     IdleTimer=3.000000
     ApproachTimer=1.000000
     PusuitCheckTime=0.300000
     TightPusuitDistance=256.000000
     flapSfx(0)=Sound'Enviroment.bat_flap01'
     flapSfx(1)=Sound'Enviroment.bat_flap02'
     squeekSfx(0)=Sound'Enviroment.bat_squeek01'
     squeekSfx(1)=Sound'Enviroment.bat_squeek02'
     squeekSfx(2)=Sound'Enviroment.bat_squeek03'
     flappingSfx=Sound'Enviroment.bat_flaps'
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
     AttackCollisionRadius=90.000000
     LoadString="ShrekCharacters.bat"
     SkinFreeze=FinalBlend'ShCharacters.bat_ice'
     bCouldBeAttacked=True
     bRequireFightIdle=True
     bUseBlobShadow=True
     BlobShadowLightDistance=25.000000
     WalkAnims(0)="None"
     WalkAnims(1)="None"
     WalkAnims(2)="None"
     WalkAnims(3)="None"
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
     IdleAnimName="hangidle"
     GroundRunSpeed=50.000000
     GroundWalkSpeed=50.000000
     GroundSpeed=50.000000
     AirSpeed=450.000000
     AccelRate=8000.000000
     ControllerClass=Class'SHGame.Batcontroller'
     BaseMovementRate=50.000000
     MovementAnims(0)="None"
     MovementAnims(1)="None"
     MovementAnims(2)="None"
     MovementAnims(3)="None"
     TurnLeftAnim="None"
     TurnRightAnim="None"
	 Physics=PHYS_None
     bActorShadows=True
     Mesh=SkeletalMesh'ShrekCharacters.Bat'
     bUnlit=True
     CollisionRadius=46.000000
     CollisionHeight=30.000000
     RotationRate=(Pitch=0,Yaw=50000,Roll=200)
}
