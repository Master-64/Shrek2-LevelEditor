// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// A HUD item that comes with some additional functions, and persists
// when a load occurs, even if the game's HUD isn't modified


class MHUDItem extends KWHudItem
	EditInLineNew
	Config(MPak);


var bool bReInitialize;
var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var BaseCam Cam;
var MUtils U;


event PostBeginPlay()
{
	super.PostBeginPlay();
	
	U = GetUtils();
}

function MUtils GetUtils()
{
	local MUtils Ut;
	
	foreach DynamicActors(class'MUtils', Ut)
	{
		return Ut;
	}
	
	return Spawn(class'MUtils');
}

event PostLoadGame(bool bLoadFromSaveGame)
{
	local KWHud HUD;
	
	if(!bLoadFromSaveGame || !bReInitialize)
	{
		return;
	}
	
	// Makes this HUDItem attach to the current HUD across loads if it does not properly transfer
	HUD = U.GetHUD();
	
	if(parentHUD == none)
	{
		SetParentHud(HUD);
		HUD.HudItems.Insert(HUD.HudItems.Length, 1);
		HUD.HudItems[HUD.HudItems.Length - 1] = self;
	}
}


state Invisible // Makes the HUD item invisible
{
	function RenderHud(Canvas Canvas)
	{
		return;
	}
}

auto state Visible // Makes the HUD item visible
{
}


defaultproperties
{
	bReInitialize=true
}