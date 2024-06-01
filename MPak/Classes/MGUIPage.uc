// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// A general fork of a GUI page


class MGUIPage extends SHGUIPage
	Config(MPak);


var float fGUIScale;
var bool bEscapeClosesPage;
var string sOldResolution;
var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var array<KWHudItem> HudItems;
var BaseCam Cam;
var MUtils U;


function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	U = GetUtils(MyController);
	
	fGUIScale = U.GetGUIScale();
	
	sOldResolution = U.CC("GetCurrentRes");
	
	__OnDraw__Delegate = InternalOnDraw;
	
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

event bool InternalOnDraw(Canvas Canvas)
{
	local string sRes;
	
	sRes = U.CC("GetCurrentRes");
	
	if(sRes != sOldResolution)
	{
		ResolutionChanged();
	}
	
	sOldResolution = sRes;
	
	return true;
}

event bool InternalOnClick(GUIComponent Sender)
{
	super.InternalOnClick(Sender);
	
	return true;
}

event bool InternalOnKeyEvent(out byte Key, out byte State, float Delta)
{
	if(bEscapeClosesPage)
	{
		if(Key == 27 && State == 1)
		{
			ClosePage();
		}
	}
	
	return false;
}

function GUIComponent CenterComponent(GUIComponent GUIC)
{
	GUIC.WinTop -= GUIC.WinHeight / 2.0;
	GUIC.WinLeft -= GUIC.WinWidth / 2.0;
	
	return GUIC;
}

function GUIComponent ScaleComponent(GUIComponent GUIC)
{
	GUIC.WinHeight *= fGUIScale;
	GUIC.WinWidth *= fGUIScale;
	
	return GUIC;
}

function GUIComponent OrientComponent(GUIComponent GUIC)
{
	ScaleComponent(GUIC);
	CenterComponent(GUIC);
	
	return GUIC;
}

event ResolutionChanged();

function ClosePage()
{
	UnPause();
	Controller.CloseAll(false);
}


defaultproperties
{
	bEscapeClosesPage=true
	WinHeight=1.0
}