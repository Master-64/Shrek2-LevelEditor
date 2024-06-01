//================================================================================
// ExplodingRock.
//================================================================================

class ExplodingRock extends ExplodingObject
  Config(User);

defaultproperties
{
     fxExplosionClass=Class'SHGame.Rock_Bang'
     DamageRadius=200.000000
     ReactAnimName="undulate"
     IdleAnimName="Idle"
     bWaitForThrow=True
     sfxExplode(0)=Sound'Items.pumpkin_explode1'
     sfxExplode(1)=Sound'Items.pumpkin_explode1'
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
     bTakeNoDamage=True
     ControllerClass=Class'SHGame.ExplodingObjectController'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.rock_throwing'
     CollisionRadius=25.000000
     CollisionHeight=23.000000
	 DrawType=DT_StaticMesh
	 bAlignBottom=False
}
