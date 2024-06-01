// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfPlayingAtXFPS extends MScriptedAction
	Config(MPak);


var(Action) float fExpectedMaxFPS;


function ProceedToNextAction(ScriptedController C)
{
	C.ActionNum++;
	
	GetUtils(C);
	
	if(U.GetFPSCap() != fExpectedMaxFPS)
	{
		ProceedToSectionEnd(C);
	}
}

function bool StartsSection()
{
	return true;
}

function string GetActionString()
{
	return ActionString @ "-- Checking if the game is playing at" @ string(fExpectedMaxFPS) @ "FPS";
}


defaultproperties
{
	fExpectedMaxFPS=60.0
	ActionString="If Playing At X FPS"
}