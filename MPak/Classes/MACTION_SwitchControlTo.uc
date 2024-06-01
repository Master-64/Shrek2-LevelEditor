// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_SwitchControlTo extends MScriptedAction
	Config(MPak);


var(Action) array<string> NewPlayerLabels;
var(Action) float fTimeToSwitch;
var(Action) bool bSwapLocations, bPickRandom;


function bool InitActionFor(ScriptedController C)
{
	local string sTempLabel;
	
	GetUtils(C);
	HP = U.GetHP();
	
	if(HP == none)
	{
		Warn(ActionString @ "-- Hero pawn could not be found; aborting process");
		
		return false;
	}
	
	if(!bPickRandom)
	{
		sTempLabel = NewPlayerLabels[0];
	}
	else
	{
		sTempLabel = NewPlayerLabels[Rand(NewPlayerLabels.Length)];
	}
	
	if(!(HP.IsA('KWPawn')))
	{
		Warn(ActionString @ "-- Using fallback switching method; no additional features can be used aside from the SCTP itself");
		
		U.CC("SCTP" @ sTempLabel);
		
		return false;
	}
	else
	{
		KWPawn(HP).SwitchControlToPawn(sTempLabel,, fTimeToSwitch, bSwapLocations);
	}
	
	return false;
}

function string GetActionString()
{
	if(!bPickRandom)
	{
		return ActionString @ "-- Switching control to player" @ NewPlayerLabels[0] @ "in" @ string(fTimeToSwitch) @ "seconds. bSwapLocations:" @ U.BoolToString(bSwapLocations);
	}
	else
	{
		return ActionString @ "-- Switching control to a random player in" @ string(fTimeToSwitch) @ "seconds. bSwapLocations:" @ U.BoolToString(bSwapLocations);
	}
}


defaultproperties
{
	fTimeToSwitch=1.0
	ActionString="Switch Control To"
}