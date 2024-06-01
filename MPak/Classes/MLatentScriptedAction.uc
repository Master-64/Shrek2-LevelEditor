// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// A fork of a LatentScriptedAction that adds in common functionality
// that I use in all of my latent scripted actions


class MLatentScriptedAction extends LatentScriptedAction
	Config(MPak);


struct MinMaxStruct
{
	var() int Min, Max;
};

struct MinMaxFStruct
{
	var() float Min, Max;
};

struct MinMaxSStruct
{
	var() string Min, Max;
};

var(Action) bool bNonBlocking;
var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var BaseCam Cam;
var MUtils U;


function GetUtils(ScriptedController C)
{
	local MUtils Ut;
	
	foreach C.DynamicActors(class'MUtils', Ut)
	{
		U = Ut;
	}
	
	U = C.Spawn(class'MUtils');
}

function IfNonBlocking(ScriptedController C)
{
	if(bNonBlocking)
	{
		ForceFinishAction(C);
	}
}

function ForceFinishAction(ScriptedController C)
{
	C.ActionNum++;
	C.GotoState('Scripting', 'Begin');
}