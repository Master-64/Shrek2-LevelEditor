//================================================================================
// Citizen.
//================================================================================

class Citizen extends ShEnemy
  Config(User);

var array<Material> RandSkins;
var array<Material> RandHats;
var() float panicRadius;
var() float panicSpeed;
var Vector savedNormal;
var(sounds) array<Sound> sfxScream;
var(sounds) array<Sound> sfxHitWall;

function Bump(Actor Other)
{
}

function HitWall(Vector HitNormal, Actor Wall)
{
}

function StartToPanic(Actor Other)
{
}

defaultproperties
{
     panicRadius=250.000000
     panicSpeed=250.000000
     CombatSpeed=450.000000
     FlyBackAnimName="run"
     WalkAnims(0)="Walk"
     WalkAnims(1)="Walk"
     WalkAnims(2)="Walk"
     WalkAnims(3)="Walk"
     Health=1
     ControllerClass=Class'SHGame.CitizenController'
     MovementAnims(0)="run"
     MovementAnims(1)="run"
     MovementAnims(2)="run"
     MovementAnims(3)="run"
     CollisionHeight=33.000000
     bBlockActors=False
     RotationRate=(Yaw=100000)
}
