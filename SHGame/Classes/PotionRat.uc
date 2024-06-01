//================================================================================
// PotionRat.
//================================================================================

class PotionRat extends RandomRunningPotionObject
  Config(User);

defaultproperties
{
     SpawnAnim="casualidle"
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
     TurnLeftAnim="Attack"
     TurnRightAnim="Attack"
     Mesh=SkeletalMesh'ShrekCharacters.Rat'
     bUnlit=True
}
