// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// A parent class for all CSActions used for MCutsceneCreator


class MCSAction extends Object
	EditInLineNew
	CollapseCategories
	HideCategories(Object)
	Config(MPak);


enum EEaseType
{
	ET_Linear,
	ET_EaseFrom,
	ET_EaseTo,
	ET_EaseBetween
};

var localized string ActionString;