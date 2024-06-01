// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCSACTION_FlyTo extends MCSAction
	EditInLineNew
	CollapseCategories
	HideCategories(Object)
	Config(MPak);


var() name nDestinationTag;
var() MCSAction.EEaseType EaseType;
var() float fMoveTime, fSpeedFactor;
var() vector vDestOffset;
var() bool bTurnWithChar, bRelativeToChar, bStayLockedToActor, bCalcTimeFromSpeed, bNonBlocking;
var() name nSplinePointTag;
var() rotator rRotStep;


defaultproperties
{
	ActionString="FlyTo"
	EaseType=ET_EaseBetween
	bTurnWithChar=true
	bRelativeToChar=true
	bStayLockedToActor=true
}