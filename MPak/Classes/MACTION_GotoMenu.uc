// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_GotoMenu extends MScriptedAction
	Config(MPak);


enum EActionType
{
	AT_OpenMenu,
	AT_CloseMenu,
	AT_CloseAllMenus
};

struct OpenMenuStruct
{
	var() string MenuName;
	var() bool bDisconnect;
	var() string Msg1;
	var() string Msg2;
};

var(Action) MACTION_GotoMenu.EActionType ActionType;
var(Action)	OpenMenuStruct OpenMenuVars;


function bool InitActionFor(ScriptedController C)
{
	GetUtils(C);
	PC = U.GetPC();
	
	switch(ActionType)
	{
		case AT_OpenMenu:
			PC.ClientOpenMenu(OpenMenuVars.MenuName, OpenMenuVars.bDisconnect, OpenMenuVars.Msg1, OpenMenuVars.Msg2);
			
			break;
		case AT_CloseMenu:
			PC.ClientCloseMenu(false);
			
			break;
		case AT_CloseAllMenus:
			PC.ClientCloseMenu(true);
			
			break;
	}
	
	return false;
}

function string GetActionString()
{
	switch(ActionType)
	{
		case AT_OpenMenu:
			return ActionString @ "-- Opening menu" @ OpenMenuVars.MenuName;
			
			break;
		case AT_CloseMenu:
			return ActionString @ "-- Closing menu";
			
			break;
		case AT_CloseAllMenus:
			return ActionString @ "-- Closing all menus";
			
			break;
	}
}


defaultproperties
{
	ActionString="Goto Menu"
	OpenMenuVars=(MenuName="KWGame.KWPageFrontEnd")
}