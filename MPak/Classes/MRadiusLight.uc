// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MRadiusLight extends MTriggerLight
	HideCategories(MTriggerLight)
	Config(MPak);


var() float fTransitionTime;
var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var array<KWHudItem> HudItems;
var BaseCam Cam;
var MUtils U;


event PostBeginPlay()
{
	super.PostBeginPlay();
	
	U = GetUtils();
	
	ChangeTime = fTransitionTime;
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
	if(!bLoadFromSaveGame)
	{
		PC = KWGame(Level.Game).GetHeroController();
	}
}

event Touch(Actor Other)
{
	if(KWHeroController(Pawn(Other).Controller) == PC)
	{
		Trigger(Other, Pawn(Other));
	}
}

event UnTouch(Actor Other)
{
	if(KWHeroController(Pawn(Other).Controller) == PC)
	{
		Trigger(Other, Pawn(Other));
	}
}


defaultproperties
{
	bCollideActors=true
}