// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCSACTION_FadeIn extends MCSACTION_Fade
	EditInLineNew
	CollapseCategories
	HideCategories(Object)
	Config(MPak);


defaultproperties
{
	ActionString="FadeIn"
	cNewColor=(R=0,G=0,B=0,A=0)
	EaseType=ET_EaseTo
}