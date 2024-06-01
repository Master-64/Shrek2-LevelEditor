// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MFakeShadow extends KWMover
	Config(MPak);


event PreBeginPlay()
{
	super.PreBeginPlay();
	
	Destroy();
}


defaultproperties
{
	Group=FakeShadow
	bEdShouldSnap=true
	bNoDelete=false
	bUnlit=true
	Skins(0)=FinalBlend'1_Shreks_Swamp_Tex.swampwater_final'
}