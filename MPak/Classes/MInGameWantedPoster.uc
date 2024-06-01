// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// Disables stopping the player from moving
// after collecting 3 posters


class MInGameWantedPoster extends SHInGameWantedPoster
	Config(MPak);


var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var array<KWHudItem> HudItems;
var BaseCam Cam;
var MUtils U;


function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	U = GetUtils(MyController);
	
	super.InitComponent(MyController, MyOwner);
}

function MUtils GetUtils(GUIController C)
{
	local MUtils Ut;
	
	foreach C.ViewportOwner.Actor.DynamicActors(class'MUtils', Ut)
	{
		return Ut;
	}
	
	return C.ViewportOwner.Actor.Spawn(class'MUtils');
}

function AttempToEnterBonus()
{
	super.AttempToEnterBonus();
	
	HP = U.GetHP();
	
	if(HP.IsInState('NoMovement'))
	{
		HP.GotoState('StateIdle');
	}
}