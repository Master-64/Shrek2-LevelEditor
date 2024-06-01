//================================================================================
// UmbrellaPurple.
//================================================================================

class UmbrellaPurple extends BreakableObject
  Placeable
  Config(User);

defaultproperties
{
     HitFXClass=Class'SHGame.Crate_Burst'
     HitSound=Sound'items.crate_break'
     CrushedTexture=Texture'10_Castle_Siege_Tex.umbrella_1_purp_squish'
     StaticMesh=StaticMesh'10_Castle_Siege_SM.umbrella_1_purp'
     CollisionRadius=43.000000
     CollisionHeight=69.000000
	 DrawType=DT_StaticMesh
	 bAlignBottom=False
}
