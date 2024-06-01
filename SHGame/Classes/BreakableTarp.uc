//================================================================================
// BreakableTarp.
//================================================================================

class BreakableTarp extends BreakableObject
  Placeable
  Config(User);

defaultproperties
{
     HitFXClass=Class'SHGame.Cloth_Tear'
     HitSound=Sound'items.crate_break'
     bBreakableJustOnEvent=True
     bSHPropsStaticCouldBeAttacked=False
     StaticMesh=StaticMesh'3_The_Hunt_SM.Fake_BackdropShape'
     CollisionRadius=1.000000
     CollisionHeight=1.000000
	 DrawType=DT_StaticMesh
}
