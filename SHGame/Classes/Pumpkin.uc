//================================================================================
// Pumpkin.
//================================================================================

class Pumpkin extends ExplodingObject
  Config(User);

defaultproperties
{
     ReactAnimName="undulate"
     IdleAnimName="Idle"
     sfxExplode(0)=Sound'Items.pumpkin_explode1'
     sfxExplode(1)=Sound'Items.pumpkin_explode2'
     sfxExplode(2)=Sound'Items.pumpkin_explode3'
     sfxExplode(3)=Sound'Items.pumpkin_explode4'
     sfxExplode(4)=Sound'Items.pumpkin_explode5'
     sfxReactSlow(0)=Sound'Items.pumpkin_undulate_slow'
     sfxReactSlow(1)=Sound'Items.pumpkin_undulate_slow'
     sfxReactMed(0)=Sound'Items.pumpkin_undulate_medium'
     sfxReactMed(1)=Sound'Items.pumpkin_undulate_medium'
     sfxReactFast(0)=Sound'Items.pumpkin_undulate_fast'
     sfxReactFast(1)=Sound'Items.pumpkin_undulate_fast'
     colorStart=(B=255,G=120,R=13,A=255)
     colorEnd=(B=255,G=72,R=61,A=255)
     objectIncrement=7
     PitchMin=0.800000
     PitchMax=1.200000
     ControllerClass=Class'SHGame.PumpkinController'
     MovementAnims(0)="Idle"
     MovementAnims(1)="Idle"
     MovementAnims(2)="Idle"
     MovementAnims(3)="Idle"
     TurnLeftAnim="Idle"
     TurnRightAnim="Idle"
     Mesh=SkeletalMesh'EnvAnims.pumpkin_exploding'
     CollisionRadius=20.000000
     CollisionHeight=20.000000
	 bAlignBottom=False
}
