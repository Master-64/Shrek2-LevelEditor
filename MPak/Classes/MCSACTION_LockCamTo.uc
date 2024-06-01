// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCSACTION_LockCamTo extends MCSAction
	EditInLineNew
	CollapseCategories
	HideCategories(Object)
	Config(MPak);


var() name nActorTag;
var() rotator rCameraLockCone;
var() float fSpeed, fTightness;


defaultproperties
{
	ActionString="LockCamTo"
	rCameraLockCone=(Pitch=2000,Yaw=2000,Roll=0)
	fSpeed=7.0
	fTightness=10.0
}