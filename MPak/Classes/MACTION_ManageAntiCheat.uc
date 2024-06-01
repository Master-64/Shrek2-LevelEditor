// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_ManageAntiCheat extends MScriptedAction
	Config(MPak);


var(Action) bool bAntiCheatOn;
var MAntiCheat ACRef;


function bool InitActionFor(ScriptedController C)
{
	local MAntiCheat AC;
	
	if(ACRef == none)
	{
		foreach C.DynamicActors(class'MAntiCheat', AC)
		{
			ACRef = AC;
			
			break;
		}
		
		if(ACRef == none)
		{
			ACRef = C.Spawn(class'MAntiCheat');
		}
		
		if(ACRef == none)
		{
			Warn(ActionString @ "-- No anti-cheat actor was found in the current level; aborting process");
			
			return false;
		}
	}
	
	if(bAntiCheatOn)
	{
		ACRef.TickEnabled(true);
	}
	else
	{
		ACRef.TickEnabled(false);
	}
	
	return false;
}

function string GetActionString()
{
	if(bAntiCheatOn)
	{
		return ActionString @ "-- Turning on M.A.C.";
	}
	else
	{
		return ActionString @ "-- Turning off M.A.C.";
	}
}


defaultproperties
{
	ActionString="Manage Anti-Cheat"
}