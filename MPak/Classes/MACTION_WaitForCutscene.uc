// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_WaitForCutscene extends MLatentScriptedAction
	Config(MPak);


var(Action) bool bIncludeNonCinematicCutscenes;


function bool InitActionFor(ScriptedController C)
{
	local MCutsceneDelegate MCD;
	
	GetUtils(C);
	PC = U.GetPC();
	
	IfNonBlocking(C);
	
	if(!PC.bInCutscene())
	{
		return false;
	}
	
	MCD = C.Spawn(class'MCutsceneDelegate');
	MCD.nEventName = C.SequenceScript.Name;
	MCD.bIncludeNonCinematicCutscenes = bIncludeNonCinematicCutscenes;
	
	C.CurrentAction = self;
	C.Tag = C.SequenceScript.Name;
	
	return true;
}

function bool CompleteWhenTriggered()
{
	return true;
}

function string GetActionString()
{
	if(!bIncludeNonCinematicCutscenes)
	{
		return ActionString @ "-- Waiting for all cinematic cutscenes to end";
	}
	else
	{
		return ActionString @ "-- Waiting for all cutscenes to end";
	}
}


defaultproperties
{
	ActionString="Wait For Cutscene"
}