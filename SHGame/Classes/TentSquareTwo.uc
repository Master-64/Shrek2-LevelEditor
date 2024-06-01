//================================================================================
// TentSquareTwo.
//================================================================================

class TentSquareTwo extends BreakableObject
  Placeable
  Config(User);

defaultproperties
{
     HitFXClass=Class'SHGame.Crate_Burst'
     HitSound=Sound'The_Seige.tent_rip02'
     CrushedTexture=Texture'10_Castle_Siege_Tex.tent_sq_2_squish'
     StaticMesh=StaticMesh'10_Castle_Siege_SM.tent_sq_2'
     bMovable=False
     CollisionRadius=120.000000
	 CollisionWidth=80.00
     CollisionHeight=70.000000
	 CollideType=CT_Box
	 DrawType=DT_StaticMesh
	 bAlignBottom=False
}
