// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_AddHUDTexture extends MScriptedAction
	Config(MPak);


enum EManageType
{
	MT_Add_Textures,
	MT_Remove_Textures,
	MT_Remove_All_Textures
};

var(Action) EManageType ManageType;
var(Action) array<MHUDItem_TextureOverlay.TextureStruct> TextureActions;
var(Action) bool bHideDuringCutscene;


function bool InitActionFor(ScriptedController C)
{
	local MHUDItem_TextureOverlay HUDItem;
	local int i, iHUDItemIndex;
	
	GetUtils(C);
	PC = U.GetPC();
	HUD = U.GetHUD();
	
	iHUDItemIndex = U.LoadHUDItem(class'MHUDItem_TextureOverlay');
	
	if(iHUDItemIndex == -1)
	{
		Warn(ActionString @ "-- HUD item could not be found (likely failed to load); aborting process");
		
		return false;
	}
	
	HUDItem = MHUDItem_TextureOverlay(HUD.HudItems[iHUDItemIndex]);
	HUDItem.bHideDuringCutscene = bHideDuringCutscene;
	
	switch(ManageType)
	{
		case MT_Add_Textures:
			for(i = 0; i < TextureActions.Length; i++)
			{
				HUDItem.AddTexture(TextureActions[i]);
			}
			
			break;
		case MT_Remove_Textures:
			for(i = 0; i < TextureActions.Length; i++)
			{
				HUDItem.RemoveTexture(TextureActions[i].Texture);
			}
			
			break;
		case MT_Remove_All_Textures:
			HUDItem.RemoveAllTextures();
			
			break;
	}
	
	return false;
}

function string GetActionString()
{
	switch(ManageType)
	{
		case MT_Add_Textures:
			return ActionString @ "-- Adding textures to HUD";
			
			break;
		case MT_Remove_Textures:
			return ActionString @ "-- Removing textures from HUD";
			
			break;
		case MT_Remove_All_Textures:
			return ActionString @ "-- Removing all textures from HUD";
			
			break;
	}
}


defaultproperties
{
	ActionString="Add HUD Texture"
}