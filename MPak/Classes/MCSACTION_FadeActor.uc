// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCSACTION_FadeActor extends MCSAction
	EditInLineNew
	CollapseCategories
	HideCategories(Object)
	Config(MPak);


var() Color cNewColor;
var() float fDuration;
var() bool bDestroy;
var() name nActorTag;
var() MCSAction.EEaseType EaseType;


defaultproperties
{
	ActionString="FadeActor"
	fDuration=1.0
	cNewColor=(R=128,G=128,B=128,A=0)
	EaseType=ET_EaseBetween
}