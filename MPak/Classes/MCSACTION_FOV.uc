// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCSACTION_FOV extends MCSAction
	EditInLineNew
	CollapseCategories
	HideCategories(Object)
	Config(MPak);


var() float fNewFOV, fChangeTime;
var() MCSAction.EEaseType EaseType;


defaultproperties
{
	ActionString="FOV"
	fNewFOV=85.0
	EaseType=ET_EaseBetween
}