//================================================================================
// BreakableBridgeRope.
//================================================================================

class BreakableBridgeRope extends BreakableObject
  Placeable
  Config(User);

defaultproperties
{
     HitFXClass=Class'SHGame.Bridge_Rope'
     HitSound=Sound'items.crate_break'
     StaticMesh=StaticMesh'3_The_Hunt_SM.Bridge_RopeShape'
     CollisionRadius=12.000000
     CollisionHeight=25.000000
     bUseCylinderCollision=True
	 DrawType=DT_StaticMesh
}
