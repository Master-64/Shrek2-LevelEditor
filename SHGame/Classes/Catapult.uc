//================================================================================
// Catapult.
//================================================================================

class Catapult extends shpawn
  Config(User);

struct MaxMin
{
    var() int Max;
    var() int Min;
};

var() Rotator SpeedOfRotation;
var() float TimeOfThrow;
var() int DamageAmount;
var() float SleepTimeBase;
var() float SleepTimeDelta;
var() float CatapultThrowAnimSpeed;
var() float CatapultRecoilAnimSpeed;
var() int CatapultYawNeededToTurn;
var() Rotator AmmoInAirSpinBase;
var() Rotator AmmoInAirSpinDelta;
var(sounds) array<Sound> sfxLaunch;
var(sounds) array<Sound> sfxWind;
var(sounds) array<Sound> sfxLoad;
var(sounds) array<Sound> sfxAim;
var(sounds) array<Sound> sfxLanded;
var(sounds) array<Sound> sfxHitPlayer;
var CatapultAmmo Ammo;
var name LastState;
var name AmmoLastState;
var(BreakableCatapult) Class<Emitter> HitFXClass;
var(BreakableCatapult) Sound HitSound;
var(BreakableCatapult) Class<KWPickup> Prizeclass;
var(BreakableCatapult) float PrizeProbablility;
var(BreakableCatapult) float PrizeDrawScale;
var(BreakableCatapult) float StartVelMultiplier;
var() bool bStartEnabled;

function SpawnCatapultAmmo()
{
}

function PreCutPossess()
{
}

function PostCutUnPossess()
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function SpawnGoodie()
{
}

function Vector StartVelocity()
{
}

function OnEvent(name EventName)
{
}

function DisableCatapult()
{
}

defaultproperties
{
     SpeedOfRotation=(Yaw=5000)
     TimeOfThrow=2.000000
     DamageAmount=10
     SleepTimeBase=1.000000
     SleepTimeDelta=5.000000
     CatapultThrowAnimSpeed=2.600000
     CatapultRecoilAnimSpeed=0.400000
     CatapultYawNeededToTurn=1000
     AmmoInAirSpinBase=(Roll=100)
     AmmoInAirSpinDelta=(Pitch=40,Yaw=40,Roll=600)
     sfxLaunch(0)=Sound'The_Seige.catapult_launch1'
     sfxWind(0)=None
     sfxLoad(0)=Sound'The_Seige.cow_moo1'
     sfxLoad(1)=Sound'The_Seige.cow_moo2'
     sfxLoad(2)=Sound'The_Seige.cow_moo3'
     sfxLoad(3)=Sound'The_Seige.cow_moo4'
     sfxLoad(4)=Sound'The_Seige.cow_moo5'
     sfxAim(0)=None
     sfxHitPlayer(0)=Sound'The_Seige.cow_impact01'
     sfxHitPlayer(1)=Sound'The_Seige.cow_impact02'
     sfxHitPlayer(2)=Sound'The_Seige.cow_impact03'
     sfxHitPlayer(3)=Sound'The_Seige.cow_impact04'
     sfxHitPlayer(4)=Sound'The_Seige.cow_impact05'
     sfxHitPlayer(5)=Sound'The_Seige.cow_impact06'
     sfxHitPlayer(6)=Sound'The_Seige.cow_impact06'
     HitFXClass=Class'SHGame.Catapult_Explode'
     HitSound=Sound'items.crate_break'
     Prizeclass=Class'SHGame.BoxOfEnergyBars'
     PrizeProbablility=0.250000
     PrizeDrawScale=1.000000
     StartVelMultiplier=100.000000
     bStartEnabled=True
     bCouldBeAttacked=True
     WalkAnims(0)="None"
     WalkAnims(1)="None"
     WalkAnims(2)="None"
     WalkAnims(3)="None"
     ControllerClass=Class'SHGame.CatapultController'
     MovementAnims(0)="None"
     MovementAnims(1)="None"
     MovementAnims(2)="None"
     MovementAnims(3)="None"
     TurnLeftAnim="None"
     TurnRightAnim="None"
     Mesh=SkeletalMesh'EnvAnims.Catapult'
     CollisionRadius=160.000000
	 CollisionWidth=140.00
     CollisionHeight=80.000000
	 CollideType=CT_Box
     bCollideWorld=False
     bBlockActors=False
	 Physics=PHYS_None
}
