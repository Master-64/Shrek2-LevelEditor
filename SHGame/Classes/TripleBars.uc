//================================================================================
// TripleBars.
//================================================================================

class TripleBars extends BreakableObject
  Placeable
  Config(User);

defaultproperties
{
     HitFXClass=Class'SHGame.bars_explode'
     HitSound=Sound'items.SteedSwitch'
     StaticMesh=StaticMesh'7_Prison_Donkey_SM.bars_broken'
     CollisionRadius=80.000000
	 CollisionWidth=10.00
     CollisionHeight=150.000000
	 CollideType=CT_Box
	 DrawType=DT_StaticMesh
	 bAlignBottom=False
}
