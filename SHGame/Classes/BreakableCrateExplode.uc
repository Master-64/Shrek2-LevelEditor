//================================================================================
// BreakableCrateExplode.
//================================================================================

class BreakableCrateExplode extends BreakableObject
  Placeable
  Config(User);

function SayBumpLine()
{
}

defaultproperties
{
     HitFXClass=Class'SHGame.Crate_Explod'
     HitSound=Sound'items.barrel_explode'
     bExploding=True
     StaticMesh=StaticMesh'Shrek2_Univ_SM.Crate_ExplodeShape'
     CollisionRadius=40.000000
     CollisionHeight=40.000000
	 DrawType=DT_StaticMesh
	 bBlocksCamera=True
}
