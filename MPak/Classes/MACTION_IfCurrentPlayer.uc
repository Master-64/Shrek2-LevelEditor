// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfCurrentPlayer extends MScriptedAction
	Config(MPak);


var(Action) array<name> PlayerTags;


function ProceedToNextAction(ScriptedController C)
{
	local int i;
	
	C.ActionNum++;
	
	GetUtils(C);
	HP = U.GetHP();
	
	if(HP == none)
	{
		Warn(ActionString @ "-- Hero pawn could not be found; aborting process");
		
		ProceedToSectionEnd(C);
	}
	
	for(i = 0; i < PlayerTags.Length; i++)
	{
		if(HP.Tag == PlayerTags[i])
		{
			break;
		}
		
		if(i >= (PlayerTags.Length - 1))
		{
			ProceedToSectionEnd(C);
		}
	}
}

function bool StartsSection()
{
	return true;
}

function string GetActionString()
{
	return ActionString @ "-- Checking if the current player is expected";
}


defaultproperties
{
	PlayerTags(0)=Shrek
	ActionString="If Current Player"
}