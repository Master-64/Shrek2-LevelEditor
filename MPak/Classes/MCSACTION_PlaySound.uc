// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCSACTION_PlaySound extends MCSAction
	EditInLineNew
	CollapseCategories
	HideCategories(Object)
	Config(MPak);


var() name nSound;
var() float fVolume, fPitch;
var() bool bAttenuate, bNo3D;


defaultproperties
{
	ActionString="PlaySound"
	fVolume=1.0
	fPitch=1.0
	bAttenuate=true
}