//================================================================================
// BreakableCrate.
//================================================================================

class BreakableCrate extends BreakableObject
  Placeable
  Config(User);

function SayBumpLine()
{
}

defaultproperties
{
     HitFXClass=Class'SHGame.Crate_Burst'
     HitSound=Sound'items.crate_break'
     GoodieToSpawn=Class'SHGame.Coin'
	 Limits=(Max=5,Min=2)
     StaticMesh=StaticMesh'Shrek2_Univ_SM.Crate_BurstShape'
     CollisionRadius=40.000000
     CollisionHeight=40.000000
	 DrawType=DT_StaticMesh
	 bBlocksCamera=True
}
