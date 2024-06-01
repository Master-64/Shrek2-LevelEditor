//================================================================================
// Potion.
//================================================================================

class Potion extends ShProps
  Config(User);

var() array<Material> RandSkins;

defaultproperties
{
     RandSkins(0)=Texture'4_FGM_PIB_Tex.bottle_1'
     RandSkins(1)=Texture'4_FGM_PIB_Tex.bottle_2'
     RandSkins(2)=Texture'4_FGM_PIB_Tex.bottle_3'
     StaticMesh=StaticMesh'4_FGM_PIB_SM.bottle_1'
     DrawScale=0.660000
     CollisionRadius=10.000000
     CollisionHeight=20.000000
	 DrawType=DT_StaticMesh
}
