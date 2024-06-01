// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MPathBlockingPlane extends MStaticMeshActor
	Config(MPak);


event PreBeginPlay()
{
	super.PreBeginPlay();
	
	SetCollision(false, false, false);
	SetDrawType(DT_None);
}


defaultproperties
{
	Group=PathBlockingPlane
	StaticMesh=StaticMesh'3_The_Hunt_SM.huntplane'
	bHidden=true
	DrawScale=5.0
	Skins(0)=Texture'6_Hamlet_Tex.pig_brick'
	bUnlit=true
	bShadowCast=false
	bStaticLighting=false
}