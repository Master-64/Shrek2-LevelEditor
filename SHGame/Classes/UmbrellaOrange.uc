//================================================================================
// UmbrellaOrange.
//================================================================================

class UmbrellaOrange extends BreakableObject
  Placeable
  Config(User);

defaultproperties
{
     HitFXClass=Class'SHGame.Crate_Burst'
     HitSound=Sound'items.crate_break'
     CrushedTexture=Texture'10_Castle_Siege_Tex.umbrella_2_orange_squish'
     StaticMesh=StaticMesh'10_Castle_Siege_SM.umbrella_2_orange'
     CollisionRadius=72.000000
     CollisionHeight=68.000000
	 DrawType=DT_StaticMesh
	 bAlignBottom=False
}
