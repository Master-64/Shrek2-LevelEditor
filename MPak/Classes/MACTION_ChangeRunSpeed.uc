// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_ChangeRunSpeed extends MScriptedAction
	Config(MPak);


struct ChangeRunSpeedStruct
{
	var() class<KWPawn> PawnClass;
	var() name PawnTag;
	var() float fNewRunSpeed;
	var() bool bAddRunSpeedInstead, bDefaultRunSpeedInstead;
};

var(Action) array<ChangeRunSpeedStruct> ChangeRunSpeedActions;


function bool InitActionFor(ScriptedController C)
{
	local KWPawn TargetPawn;
	local int i;
	
	GetUtils(C);
	HP = U.GetHP();
	
	for(i = 0; i < ChangeRunSpeedActions.Length; i++)
	{
		if(ChangeRunSpeedActions[i].PawnTag == 'CurrentPlayer')
		{
			TargetPawn = KWPawn(HP);
		}
		else
		{
			if(ChangeRunSpeedActions[i].PawnClass == none)
			{
				Warn(ActionString @ "-- A pawn class assignment is missing; skipping action" @ string(i));
				
				continue;
			}
			
			foreach C.DynamicActors(ChangeRunSpeedActions[i].PawnClass, TargetPawn, ChangeRunSpeedActions[i].PawnTag)
			{
				break;
			}
		}
		
		if(TargetPawn == none)
		{
			Warn(ActionString @ "-- Failed to find a pawn to change the run speed of; skipping action" @ string(i));
			
			continue;
		}
		
		if(ChangeRunSpeedActions[i].bDefaultRunSpeedInstead)
		{
			TargetPawn.GroundSpeed = TargetPawn.default.GroundSpeed;
			TargetPawn.GroundRunSpeed = TargetPawn.default.GroundRunSpeed;
		}
		else if(ChangeRunSpeedActions[i].bAddRunSpeedInstead)
		{
			TargetPawn.GroundSpeed += ChangeRunSpeedActions[i].fNewRunSpeed;
			TargetPawn.GroundRunSpeed += ChangeRunSpeedActions[i].fNewRunSpeed;
		}
		else
		{
			TargetPawn.GroundSpeed = ChangeRunSpeedActions[i].fNewRunSpeed;
			TargetPawn.GroundRunSpeed = ChangeRunSpeedActions[i].fNewRunSpeed;
		}
	}
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Changing the run speed of" @ string(ChangeRunSpeedActions.Length) @ "pawns";
}


defaultproperties
{
	ActionString="Change Run Speed"
}