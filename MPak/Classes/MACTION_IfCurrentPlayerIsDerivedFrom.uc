// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfCurrentPlayerIsDerivedFrom extends MScriptedAction
	Config(MPak);


var(Action) name ConditionClassName;


function ProceedToNextAction(ScriptedController C)
{	
	C.ActionNum++;
	
	GetUtils(C);
	HP = U.GetHP();
	
	if(HP == none)
	{
		Warn(ActionString @ "-- Hero pawn could not be found; returning false");
		
		ProceedToSectionEnd(C);
	}
	
	if(HP.IsA(ConditionClassName))
	{
		return;
	}
	else
	{
		ProceedToSectionEnd(C);
	}
}

function bool StartsSection()
{
	return true;
}

function string GetActionString()
{
	return ActionString @ "-- Checking if current player's class is derived from" @ string(ConditionClassName);
}


defaultproperties
{
	ActionString="If Current Player Is Derived From"
}