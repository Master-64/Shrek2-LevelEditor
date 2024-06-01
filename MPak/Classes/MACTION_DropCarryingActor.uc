// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_DropCarryingActor extends MScriptedAction
	Config(MPak);


var(Action) name PawnTag;
var(Action) bool bDestroy;


function bool InitActionFor(ScriptedController C)
{
	local KWPawn KWP;
	
	GetUtils(C);
	HP = U.GetHP();
	
	if(PawnTag == 'CurrentPlayer')
	{
		KWP = KWPawn(HP);
	}
	else
	{
		foreach C.DynamicActors(class'KWPawn', KWP, PawnTag)
		{
			break;
		}
	}
	
	if(KWP == none)
	{
		Warn(ActionString @ "-- Pawn could not be found for dropping an actor; aborting process");
		
		return false;
	}
	
	if(!KWP.IsA('KWPawn'))
	{
		Warn(ActionString @ "-- Targeted pawn is not a KWPawn, meaning dropping an actor isn't possible; aborting process");
		
		return false;
	}
	
	if(bDestroy && KWP.aHolding != none)
	{
		U.FancyDestroy(KWP.aHolding);
	}
	
	KWP.DropCarryingActor();
	
	return false;
}

function string GetActionString()
{
	if(!bDestroy)
	{
		return ActionString @ "-- Dropping" @ string(PawnTag) $ "'s currently held actor";
	}
	else
	{
		return ActionString @ "-- Destroying" @ string(PawnTag) $ "'s currently held actor";
	}
}


defaultproperties
{
	PawnTag=CurrentPlayer
	ActionString="Drop Carrying Actor"
}