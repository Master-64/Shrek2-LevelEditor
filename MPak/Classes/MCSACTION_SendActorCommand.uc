// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCSACTION_SendActorCommand extends MCSAction
	EditInLineNew
	CollapseCategories
	HideCategories(Object)
	Config(MPak);


enum EOnExitType
{
	OET_Follow,
	OET_StopFollowing,
	OET_WaitInCorral,
	OET_SwitchControlToMe,
	OET_OnEvent,
	OET_GoHome,
	OET_FightWithLeadChar,
	OET_Trigger,
	OET_TriggerActor,
	OET_LeadActor,
	OET_CompanionStates
};

var() MCutsceneCreator.EOnExitType OnExitType;
var() name nPawnTag, nOptionalTagOrEvent[2];


defaultproperties
{
	ActionString="SendActorCommand"
}