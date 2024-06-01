// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCSACTION_Shake extends MCSAction
	EditInLineNew
	CollapseCategories
	HideCategories(Object)
	Config(MPak);


var() float fMagnitude, fTime, fDecay;


defaultproperties
{
	ActionString="Shake"
	fMagnitude=100.0
	fTime=0.5
}