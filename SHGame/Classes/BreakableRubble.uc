//================================================================================
// BreakableRubble.
//================================================================================

class BreakableRubble extends ShProps
  NotPlaceable
  Config(User);

defaultproperties
{
     Physics=PHYS_Falling
     bUseCylinderCollision=False
	 DrawType=DT_StaticMesh
	 bAlignBottom=False
}
