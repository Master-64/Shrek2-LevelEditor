//================================================================================
// MilkKnight.
//================================================================================

class MilkKnight extends ShEnemy
  Config(User);

var() float panicRadius;
var() float panicSpeed;
var Vector savedNormal;
var MilkKnightMilk milk;
var(Enemy) float shootTime;
var(Enemy) float Distance;
var(Enemy) float waitTimeMin;
var(Enemy) float waitTimeMax;
var(Enemy) float minimumDistance;
var(Enemy) float maximumDistance;
var(sounds) array<Sound> sfxScream;
var(sounds) array<Sound> sfxHitWall;
var(sounds) array<Sound> sfxShoot;

function AddAnimNotifys()
{
}

function AnimNotifyMilkShoot()
{
}

function Bump(Actor Other)
{
}

function HitWall(Vector HitNormal, Actor Wall)
{
}

function GetBumpSets()
{
}

defaultproperties
{
     panicRadius=250.000000
     panicSpeed=250.000000
     shootTime=0.400000
     Distance=600.000000
     waitTimeMin=2.000000
     waitTimeMax=5.000000
     minimumDistance=500.000000
     maximumDistance=800.000000
     sfxShoot(0)=Sound'The_Seige.milkknight_shot_01'
     sfxShoot(1)=Sound'The_Seige.milkknight_shot_02'
     CombatSpeed=450.000000
     AttackDistance=200.000000
     LoadString="ShrekCharacters.MilkKnight"
     CombatIdleAnimName="Idle"
     CombatWalkAnimName="run"
     AttackAnimName(0)="milkshoot"
     AttackAnimName(1)="milkshoot"
     bUsePotions=False
     WalkAnims(0)="walkbackward"
     WalkAnims(1)="walkbackward"
     WalkAnims(2)="walkbackward"
     WalkAnims(3)="walkbackward"
     WalkAnimName="walkbackward"
     Health=1
     ControllerClass=Class'SHGame.MilkKnightController'
     MovementAnims(0)="run"
     MovementAnims(1)="run"
     MovementAnims(2)="run"
     MovementAnims(3)="run"
     Mesh=SkeletalMesh'ShrekCharacters.MilkKnight'
     CollisionHeight=33.000000
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
     RotationRate=(Yaw=100000)
}
