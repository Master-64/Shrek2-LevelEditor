// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_ManageTimer extends MScriptedAction
	Config(MPak);


var(Action) float fTimerSeconds;
var(Action) bool bLoopTimer, bTurnOffTimerInstead;


function bool InitActionFor(ScriptedController C)
{
	GetUtils(C);
	HUD = U.GetHUD();
	
	if(!bTurnOffTimerInstead)
	{
		SHHud(HUD).SetPotionTimer(none, fTimerSeconds, bLoopTimer);
	}
	else
	{
		SHHud(HUD).ClearHudTimer();
	}
	
	return false;
}

function string GetActionString()
{
	if(!bTurnOffTimerInstead)
	{
		return ActionString @ "-- Setting timer to" @ string(fTimerSeconds) @ "seconds";
	}
	else
	{
		return ActionString @ "-- Turning off timer";
	}
}


defaultproperties
{
	fTimerSeconds=30.0
	ActionString="Manage Timer"
}