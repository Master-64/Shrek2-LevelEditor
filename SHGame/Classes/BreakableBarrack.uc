//================================================================================
// BreakableBarrack.
//================================================================================

class BreakableBarrack extends BreakableObject
  Placeable
  Config(User);

defaultproperties
{
     HitFXClass=Class'SHGame.Crate_Burst'
     HitSound=Sound'items.crate_break'
     CrushedRubbleClass=Class'SHGame.BreakableBarrackRubble'
     StaticMesh=StaticMesh'10_Castle_Siege_SM.tower_doorway'
     CollisionRadius=50.000000
     CollisionHeight=50.000000
	 DrawType=DT_StaticMesh
	 bAlignBottom=False
}
