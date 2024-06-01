//================================================================================
// BreakableLock.
//================================================================================

class BreakableLock extends BreakableObject
  Placeable
  Config(User);

defaultproperties
{
     HitFXClass=Class'SHGame.celldoor_explode'
     HitSound=Sound'items.SteedSwitch'
     bSHPropsStaticBreakAnyway=True
     StaticMesh=StaticMesh'7_Prison_Donkey_SM.door_cell_static'
     CollisionRadius=250.000000
	 CollisionWidth=30.00
     CollisionHeight=250.000000
	 CollideType=CT_Box
	 DrawType=DT_StaticMesh
	 bAlignBottom=False
}
