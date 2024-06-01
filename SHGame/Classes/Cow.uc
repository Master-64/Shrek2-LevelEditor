//================================================================================
// Cow.
//================================================================================

class Cow extends SHCharacter
  Config(User);

defaultproperties
{
     WalkAnims(0)="Idle"
     WalkAnims(1)="Idle"
     WalkAnims(2)="Idle"
     WalkAnims(3)="Idle"
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
     MovementAnims(0)="Idle"
     MovementAnims(1)="Idle"
     MovementAnims(2)="Idle"
     MovementAnims(3)="Idle"
     Mesh=SkeletalMesh'ShrekCharacters.Cow'
     CollisionRadius=5.000000
     CollisionHeight=3.000000
     bCollideActors=False
     bBlockPlayers=False
}
