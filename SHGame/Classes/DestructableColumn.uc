//================================================================================
// DestructableColumn.
//================================================================================

class DestructableColumn extends ShPropsStatic
  Config(User);

var() array<Material> ColumnMaterials;
var() StaticMesh BrokenStaticMesh;
var() Class<Emitter> BrokenEmitterName;

defaultproperties
{
     ColumnMaterials(0)=Texture'11_FGM_Battle_Tex.column_1'
     ColumnMaterials(1)=Texture'11_FGM_Battle_Tex.column_2'
     ColumnMaterials(2)=Texture'11_FGM_Battle_Tex.column_3'
     ColumnMaterials(3)=Texture'11_FGM_Battle_Tex.column_4'
	 BrokenStaticMesh=StaticMesh'11_FGM_Battle_SM.column_broke'
     BrokenEmitterName=Class'SHGame.Dust_Cloud'
     StaticMesh=StaticMesh'11_FGM_Battle_SM.column'
     CollisionRadius=1.000000
     CollisionHeight=1.000000
	 DrawType=DT_StaticMesh
	 bAlignBottom=False
	 bBlocksCamera=True
}
