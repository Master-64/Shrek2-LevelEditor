//================================================================================
// PotionSpider.
//================================================================================

class PotionSpider extends RandomRunningPotionObject
  Config(User);

defaultproperties
{
     SpawnAnim="Attack"
     WalkAnims(0)="Walk"
     WalkAnims(1)="Walk"
     WalkAnims(2)="Walk"
     WalkAnims(3)="Walk"
     AirAnims(0)="Attack"
     AirAnims(1)="Attack"
     AirAnims(2)="Attack"
     AirAnims(3)="Attack"
     TakeoffAnims(0)="Attack"
     TakeoffAnims(1)="Attack"
     TakeoffAnims(2)="Attack"
     TakeoffAnims(3)="Attack"
     LandAnims(0)="Attack"
     LandAnims(1)="Attack"
     AirStillAnim="Attack"
     TakeoffStillAnim="Attack"
     IdleAnimName="Attack"
     MovementAnims(0)="Walk"
     MovementAnims(1)="Walk"
     MovementAnims(2)="Walk"
     MovementAnims(3)="Walk"
     TurnLeftAnim="Attack"
     TurnRightAnim="Attack"
     Mesh=SkeletalMesh'ShrekCharacters.Spider'
     bUnlit=True
}
