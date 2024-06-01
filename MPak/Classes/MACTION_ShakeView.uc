// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_ShakeView extends MScriptedAction
	Config(MPak);


var(Action) float fViewRollTime, fRollMag, fRollRate, fOffsetMagVertical, fOffsetRateVertical, fOffsetMagHorizontal, fOffsetRateHorizontal, fOffsetIterations;


function bool InitActionFor(ScriptedController C)
{
	local vector vOffsetMag, vOffsetRate;
	
	GetUtils(C);
	PC = U.GetPC();
	
	vOffsetMag = (fOffsetMagHorizontal * Vect(1.0, 1.0, 0.0)) + (fOffsetMagVertical * Vect(0.0, 0.0, 1.0));
	vOffsetRate = (fOffsetRateHorizontal * Vect(1.0, 1.0, 0.0)) + (fOffsetRateVertical * Vect(0.0, 0.0, 1.0));
	
	PC.ShakeView(fViewRollTime, fRollMag, vOffsetMag, fRollRate, vOffsetRate, fOffsetIterations);
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Shaking the view of the current player";
}


defaultproperties
{
	fViewRollTime=5.0
	fOffsetMagVertical=10.0
	fOffsetRateVertical=400.0
	fOffsetRateHorizontal=353.0
	fOffsetIterations=500.0
	ActionString="Shake View"
}