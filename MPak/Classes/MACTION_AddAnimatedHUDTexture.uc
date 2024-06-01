// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_AddAnimatedHUDTexture extends MScriptedAction
	Config(MPak);


enum EManageType
{
	MT_Start_Animations,
	MT_Finish_Animations
};

var(Action) EManageType ManageType;
var(Action) array<MHUDItem_AnimatedTextureOverlay.AnimateStruct> AnimationActions;
var(Action) bool bHideDuringCutscene;


function bool InitActionFor(ScriptedController C)
{
	local MHUDItem_AnimatedTextureOverlay HUDItem;
	local int iHUDItemIndex;
	
	GetUtils(C);
	PC = U.GetPC();
	HUD = U.GetHUD();
	
	iHUDItemIndex = U.LoadHUDItem(class'MHUDItem_AnimatedTextureOverlay');
	
	if(iHUDItemIndex == -1)
	{
		Warn(ActionString @ "-- HUD item could not be found (likely failed to load); aborting process");
		
		return false;
	}
	
	HUDItem = MHUDItem_AnimatedTextureOverlay(HUD.HudItems[iHUDItemIndex]);
	HUDItem.bHideDuringCutscene = bHideDuringCutscene;
	
	switch(ManageType)
	{
		case MT_Start_Animations:
			HUDItem.StartAnimations(AnimationActions);
			
			break;
		case MT_Finish_Animations:
			HUDItem.DeleteAnimations();
			
			break;
	}
	
	return false;
}

function string GetActionString()
{
	switch(ManageType)
	{
		case MT_Start_Animations:
			return ActionString @ "-- Starting animations on HUD";
			
			break;
		case MT_Finish_Animations:
			return ActionString @ "-- Removing animations from HUD";
			
			break;
	}
}


defaultproperties
{
	ActionString="Add Animated HUD Texture"
}