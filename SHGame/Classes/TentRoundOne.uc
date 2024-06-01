//================================================================================
// TentRoundOne.
//================================================================================

class TentRoundOne extends BreakableObject
  Placeable
  Config(User);

defaultproperties
{
     HitFXClass=Class'SHGame.Crate_Burst'
     HitSound=Sound'The_Seige.tent_rip01'
     CrushedTexture=Texture'10_Castle_Siege_Tex.tent_round_1_squish'
     StaticMesh=StaticMesh'10_Castle_Siege_SM.tent_round_1'
     bMovable=False
     CollisionRadius=95.000000
     CollisionHeight=132.000000
	 DrawType=DT_StaticMesh
	 bAlignBottom=False
}
