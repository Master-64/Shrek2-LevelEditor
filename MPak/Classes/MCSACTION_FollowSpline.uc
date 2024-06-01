// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCSACTION_FollowSpline extends MCSAction
	EditInLineNew
	CollapseCategories
	HideCategories(Object)
	Config(MPak);


var() name nSplineName, nStartPointTag, nDestinationTag;
var() float fDuration, fSpeedFactor, fAccelRate;
var() MCSAction.EEaseType EaseType;
var() bool bAlignAlongSpline;
var() rotator rEndRotation;


defaultproperties
{
	ActionString="FollowSpline"
	EaseType=ET_Linear
}