//================================================================================
// ThrownPotion.
//================================================================================

class ThrownPotion extends shpawn
  Config(User);

var() array<Material> RandSkins;

function BlowUp()
{
}

function Landed(Vector HitNormal)
{
}

function HitWall(Vector HitNormal, Actor HitWall)
{
}

defaultproperties
{
     RandSkins(0)=Texture'4_FGM_PIB_Tex.bottle_1'
     RandSkins(1)=Texture'4_FGM_PIB_Tex.bottle_2'
     RandSkins(2)=Texture'4_FGM_PIB_Tex.bottle_3'
     bCanBePickedUp=True
     StaticMesh=StaticMesh'4_FGM_PIB_SM.bottle_1'
     DrawScale=0.660000
     CollisionRadius=10.000000
     CollisionHeight=15.000000
     bCollideActors=False
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
	 DrawType=DT_StaticMesh
	 Physics=PHYS_None
}
