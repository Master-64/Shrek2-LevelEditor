// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_ManageHUDItems extends MScriptedAction
	Config(MPak);


struct SetPropStruct
{
	var() string sVariable, sValue;
};

struct ManageHUDItemsStruct
{
	var() class<KWHUDItem> HUDItemToAdd;
	var() bool bRemoveInstead;
	var() array<SetPropStruct> SetProps;
};

var(Action) array<ManageHUDItemsStruct> ManageHUDItemsActions;


function bool InitActionFor(ScriptedController C)
{
	local int i;
	
	GetUtils(C);
	
	for(i = 0; i < ManageHUDItemsActions.Length; i++)
	{
		ManageHUDItems(C, i);
	}
	
	return false;
}

function ManageHUDItems(ScriptedController C, int iIndex) // Manages HUD items with the given index that accesses the appropriate action
{
	local int i, iHUDItemIndex;
	local array<KWHudItem> HudItems;
	
	HudItems = U.GetHudItems();
	
	iHUDItemIndex = U.IsHUDItemLoaded(ManageHUDItemsActions[iIndex].HUDItemToAdd);
	
	if(!ManageHUDItemsActions[iIndex].bRemoveInstead)
	{
		iHUDItemIndex = U.LoadHUDItem(ManageHUDItemsActions[iIndex].HUDItemToAdd);
		
		if(iHUDItemIndex == -1)
		{
			return;
		}
		
		HudItems = U.GetHudItems();
		HudItems[iHUDItemIndex].GotoState('Visible');
		
		for(i = 0; i < ManageHUDItemsActions[iIndex].SetProps.Length; i++)
		{
			HudItems[iHUDItemIndex].SetPropertyText(ManageHUDItemsActions[iIndex].SetProps[i].sVariable, ManageHUDItemsActions[iIndex].SetProps[i].sValue);
		}
	}
	else if(iHUDItemIndex != -1)
	{
		HudItems[iHUDItemIndex].GotoState('Invisible');
	}
}

function string GetActionString()
{
	return ActionString @ "-- Managing" @ string(ManageHUDItemsActions.Length) @ "HUD items";
}


defaultproperties
{
	ActionString="Manage HUD Items"
}