// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_SetPawnGroundFriction extends MScriptedAction
	Config(MPak);


var(Action) class<Pawn> PawnClass;
var(Action) name PawnTag;
var(Action) bool bOverrideGroundFriction;
var(Action) float fNewFriction;


function bool InitActionFor(ScriptedController C)
{
	local Pawn TargetPawn;
	
	GetUtils(C);
	HP = U.GetHP();
	
	if(PawnTag == 'CurrentPlayer')
	{
		TargetPawn = HP;
	}
	else
	{
		if(PawnClass == none)
		{
			Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
			
			return false;
		}
		
		foreach C.DynamicActors(PawnClass, TargetPawn, PawnTag)
		{
			break;
		}
	}
	
	if(TargetPawn == none)
	{
		Warn(ActionString @ "-- Failed to find pawn for overriding the friction value of; aborting process");
		
		return false;
	}
	
	TargetPawn.SetPropertyText("bOverrideGroundFriction", U.BoolToString(bOverrideGroundFriction));
	TargetPawn.SetPropertyText("GroundFrictionOverride", string(fNewFriction));
	
	return false;
}

function string GetActionString()
{
	if(bOverrideGroundFriction)
	{
		return ActionString @ "-- Setting the ground friction value for all pawns with the tag '" $ string(PawnTag) $ "' to a value of" @ string(fNewFriction);
	}
	else
	{
		return ActionString @ "-- Setting the ground friction value for all pawns with the tag '" $ string(PawnTag) $ "' to the default value";
	}
}


defaultproperties
{
	bOverrideGroundFriction=true
	fNewFriction=8.0
	ActionString="Set Pawn Ground Friction"
}