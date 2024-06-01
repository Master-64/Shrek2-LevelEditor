// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_SetFOV extends MScriptedAction
	Config(MPak);


var(Action) float fNewFOV, fChangeTime;
var(Action) KWGame.enumMoveType EaseType;
var(Action) bool bAddFOV, bMultiplyInstead, bUseRandValues;
var(Action) MinMaxFStruct Rand_MinMaxValues;


function bool InitActionFor(ScriptedController C)
{
	local FOVController FC;
	
	GetUtils(C);
	PC = U.GetPC();
	
	FC = C.Spawn(class'FOVController');
	
	if(fNewFOV <= -1.0)
	{
		fNewFOV = PC.default.DefaultFOV;
	}
	
	if(bUseRandValues)
	{
		fNewFOV = RandRange(Rand_MinMaxValues.Min, Rand_MinMaxValues.Max);
	}
	
	if(bAddFOV && !bMultiplyInstead)
	{
		FC.Init(PC.FovAngle + fNewFOV, fChangeTime, EaseType);
	}
	else if(!bAddFOV && bMultiplyInstead)
	{
		FC.Init(PC.FovAngle * fNewFOV, fChangeTime, EaseType);
	}
	else
	{
		FC.Init(fNewFOV, fChangeTime, EaseType);
	}
	
	return false;
}

function string GetActionString()
{
	if(!bAddFOV && !bUseRandValues)
	{
		return ActionString @ "-- Setting FOV to" @ string(fNewFOV) @ "over the course of" @ string(fChangeTime) @ "seconds with the ease type of" @ string(EaseType);
	}
	else
	{
		return ActionString @ "-- Setting FOV to either a random value and/or adding/multiplying to FOV over the course of" @ string(fChangeTime) @ "seconds with the ease type of" @ string(EaseType);
	}
}


defaultproperties
{
	fNewFOV=85.0
	EaseType=MOVE_TYPE_EASE_FROM_AND_TO
	ActionString="Set FOV"
}