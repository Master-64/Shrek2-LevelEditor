//================================================================================
// BreakableDoorBlock.
//================================================================================

class BreakableDoorBlock extends BreakableObject
  Placeable
  Config(User);

defaultproperties
{
     HitFXClass=Class'SHGame.Crate_Burst'
     HitSound=Sound'items.crate_break'
     StaticMesh=StaticMesh'10_Castle_Siege_SM.Karma.Block_Door'
     CollisionRadius=180.000000
	 CollisionWidth=7.00
     CollisionHeight=35.000000
	 DrawType=DT_StaticMesh
	 CollideType=CT_Box
}
