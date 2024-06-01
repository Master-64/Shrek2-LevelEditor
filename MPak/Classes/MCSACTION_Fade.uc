// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCSACTION_Fade extends MCSAction
	EditInLineNew
	CollapseCategories
	HideCategories(Object)
	Config(MPak);


var() Color cNewColor;
var() float fDuration;
var() bool bFlash;
var() MCSAction.EEaseType EaseType;


defaultproperties
{
	ActionString="Fade"
	fDuration=1.0
	cNewColor=(R=0,G=0,B=0,A=255)
	EaseType=ET_EaseFrom
}