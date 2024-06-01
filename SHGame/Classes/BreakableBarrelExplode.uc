//================================================================================
// BreakableBarrelExplode.
//================================================================================

class BreakableBarrelExplode extends BreakableObject
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
     StaticMesh=StaticMesh'Shrek2_Univ_SM.barrel_explode'
     CollisionRadius=25.000000
     CollisionHeight=20.000000
	 DrawType=DT_StaticMesh
}
