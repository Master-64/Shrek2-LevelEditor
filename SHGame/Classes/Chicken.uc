//================================================================================
// Chicken.
//================================================================================

class Chicken extends ShCreature
  Config(User);

var() float movementRadius;
var Vector vHome;
var Vector savedNormal;
var(sounds) array<Sound> sfxCluck;

function Bump(Actor Other)
{
}

function HitWall(Vector HitNormal, Actor Wall)
{
}

defaultproperties
{
     movementRadius=200.000000
     sfxCluck(0)=Sound'Items.chicken_cluck1'
     sfxCluck(1)=Sound'Items.chicken_cluck2'
     sfxCluck(2)=Sound'Items.chicken_cluck3'
     sfxCluck(3)=Sound'Items.chicken_cluck4'
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
     GroundRunSpeed=55.000000
     GroundWalkSpeed=35.000000
     bCanJump=False
     GroundSpeed=55.000000
     ControllerClass=Class'SHGame.ChickenController'
     BaseMovementRate=55.000000
     MovementAnims(1)="run"
     MovementAnims(2)="run"
     MovementAnims(3)="run"
     TurnLeftAnim="run"
     TurnRightAnim="run"
	 StepHeight=10.00
     Mesh=SkeletalMesh'ShrekCharacters.Chicken'
     DrawScale=0.350000
     bUnlit=True
     CollisionRadius=12.000000
     CollisionHeight=13.000000
}
