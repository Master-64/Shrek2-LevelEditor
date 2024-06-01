//================================================================================
// FrogEnemy.
//================================================================================

class FrogEnemy extends shpawn
  Placeable
  Config(User);

var Vector SpawnLocation;
var() float moveDistance;
var Vector frogLocation;

function Touch(Actor Other)
{
}

function Bump(Actor Other)
{
}

function Vector GetDestination()
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function Vector FindTheGround()
{
}

defaultproperties
{
     moveDistance=65.000000
     WalkAnims(0)="run"
     WalkAnims(1)="run"
     WalkAnims(2)="run"
     WalkAnims(3)="run"
     TakeoffAnims(0)="run"
     TakeoffAnims(1)="run"
     TakeoffAnims(2)="run"
     TakeoffAnims(3)="run"
     LandAnims(0)="run"
     LandAnims(1)="run"
     AirStillAnim="run"
     TakeoffStillAnim="run"
     IdleWeaponAnim="run"
     WalkAnimName="run"
     GroundRunSpeed=75.000000
     GroundWalkSpeed=75.000000
     GroundSpeed=75.000000
     ControllerClass=Class'SHGame.FrogEnemyController'
     bPhysicsAnimUpdate=True
     BaseMovementRate=85.000000
     MovementAnims(1)="run"
     MovementAnims(2)="run"
     MovementAnims(3)="run"
     TurnLeftAnim="run"
     TurnRightAnim="run"
     Mesh=SkeletalMesh'ShrekCharacters.frog'
     bUnlit=True
     CollisionRadius=15.000000
     CollisionHeight=15.000000
}
