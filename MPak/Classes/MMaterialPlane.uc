// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MMaterialPlane extends RegressionPlane
	HideCategories(RegressionPlane)
	Config(MPak);


auto state Idle
{}


defaultproperties
{
	Group=MaterialPlane
	CollisionRadius=210.0
	CollisionHeight=1.0
	CollisionWidth=210.0
	CollideType=CT_Box
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'3_The_Hunt_SM.canopy_1'
	bHidden=true
	Mesh=none
	DrawScale=0.5
	Skins(0)=Texture'4_FGM_PIB_Tex.gas_rise'
	bUnlit=true
	bCollideActors=true
	bCollideWorld=false
	bBlockNonZeroExtentTraces=false
	bDirectional=false
	bEdShouldSnap=true
}