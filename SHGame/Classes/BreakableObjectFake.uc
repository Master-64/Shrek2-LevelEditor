//================================================================================
// BreakableObjectFake.
//================================================================================

class BreakableObjectFake extends BreakableObject
  Placeable
  Config(User);

defaultproperties
{
     HitFXClass=Class'SHGame.Dust_Cloud'
     HitSound=Sound'items.crate_break'
     bSHPropsStaticCouldBeAttacked=False
     CollisionRadius=45.000000
     CollisionHeight=40.000000
	 DrawType=DT_Sprite
}
