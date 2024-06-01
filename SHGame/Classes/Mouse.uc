//================================================================================
// Mouse.
//================================================================================

class Mouse extends ShCreature
  Config(User);

defaultproperties
{
     bCouldBeAttacked=True
     WalkAnims(1)="Walk"
     WalkAnims(2)="Walk"
     WalkAnims(3)="Walk"
     AirAnims(0)="Idle"
     AirAnims(1)="Idle"
     AirAnims(2)="Idle"
     AirAnims(3)="Idle"
     TakeoffAnims(0)="Idle"
     TakeoffAnims(1)="Idle"
     TakeoffAnims(2)="Idle"
     TakeoffAnims(3)="Idle"
     LandAnims(0)="Idle"
     LandAnims(1)="Idle"
     AirStillAnim="Idle"
     TakeoffStillAnim="Idle"
     GroundRunSpeed=50.000000
     GroundWalkSpeed=50.000000
     GroundSpeed=50.000000
     ControllerClass=Class'SHGame.Mousecontroller'
     BaseMovementRate=50.000000
     MovementAnims(0)="Walk"
     MovementAnims(1)="Walk"
     MovementAnims(2)="Walk"
     MovementAnims(3)="Walk"
     TurnLeftAnim="Walk"
     TurnRightAnim="Walk"
     Mesh=SkeletalMesh'ShrekCharacters.Spider'
     bUnlit=True
     CollisionRadius=20.000000
     CollisionHeight=20.000000
}
