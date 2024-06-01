//================================================================================
// BreakableArch.
//================================================================================

class BreakableArch extends BreakableObject
  Placeable
  Config(User);

function SayBumpLine()
{
}

defaultproperties
{
     HitFXClass=Class'SHGame.Arch_Explo'
     HitSound=Sound'items.crate_break'
     StaticMesh=StaticMesh'10_Castle_Siege_SM.Karma.gate_Shape2'
     CollisionRadius=100.000000
     CollisionHeight=450.000000
	 DrawType=DT_StaticMesh
	 bAlignBottom=False
}
