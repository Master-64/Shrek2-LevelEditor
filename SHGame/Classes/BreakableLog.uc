//================================================================================
// BreakableLog.
//================================================================================

class BreakableLog extends BreakableObject
  Placeable
  Config(User);

defaultproperties
{
     HitFXClass=Class'SHGame.Tree_Explo'
     HitSound=Sound'items.crate_break'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.log_break'
     CollisionRadius=35.000000
     CollisionHeight=30.000000
	 DrawType=DT_StaticMesh
}
