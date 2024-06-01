// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCSACTION_PlayAnim extends MCSAction
	EditInLineNew
	CollapseCategories
	HideCategories(Object)
	Config(MPak);


var() name nAnimName;
var() float fTweenTime, fAnimRate, fStartFrame;
var() bool bLoopAnim, bHoldLastFrame;
var() int iChannel;


defaultproperties
{
	ActionString="PlayAnim"
	fTweenTime=0.2
	fAnimRate=1.0
}