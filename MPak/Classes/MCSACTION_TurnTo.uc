// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCSACTION_TurnTo extends MCSAction
	EditInLineNew
	CollapseCategories
	HideCategories(Object)
	Config(MPak);


var() name nDestinationTag;
var() bool bFollow;
var() float fTimeToTake, fRateMag;


defaultproperties
{
	ActionString="TurnTo"
	fRateMag=1.0
}