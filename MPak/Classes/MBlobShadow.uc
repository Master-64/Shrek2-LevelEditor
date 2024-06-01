// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MBlobShadow extends RegressionPlane
	HideCategories(RegressionPlane)
	Config(MPak);


#exec TEXTURE IMPORT NAME=BlobShadow FILE=Textures\BlobShadow.dds FLAGS=3


var() bool bMadeShadowTwoSided;


event PostBeginPlay()
{
	super.PostBeginPlay();
	
	Texture'BlobShadow'.bAlphaTexture = true;
	Texture'BlobShadow'.bTwoSided = bMadeShadowTwoSided;
}

auto state Idle
{}


defaultproperties
{
	Group=BlobShadow
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'3_The_Hunt_SM.canopy_1'
	Mesh=none
	DrawScale=0.5
	Skins(0)=Texture'BlobShadow'
	bUnlit=true
	bCollideActors=true
	bCollideWorld=false
	bBlockNonZeroExtentTraces=false
	bDirectional=false
	bEdShouldSnap=true
}