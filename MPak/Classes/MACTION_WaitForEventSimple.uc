// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_WaitForEventSimple extends ACTION_WaitForEvent
	Config(MPak);


function bool InitActionFor(ScriptedController C)
{
	ExternalEvent = C.SequenceScript.Event;
	
	super.InitActionFor(C);
	
	return true;
}

function string GetActionString()
{
	return ActionString @ "-- Waiting for event tied to ScriptedTrigger that contains this script";
}


defaultproperties
{
	ActionString="Wait For Event (Simple)"
}