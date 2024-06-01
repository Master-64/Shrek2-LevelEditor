// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_PlayCredits extends MScriptedAction
	Config(MPak);


var(Action) string sCreditsFileName;
var(Action) array<string> CustomCreditLines;


function bool InitActionFor(ScriptedController C)
{
	GetUtils(C);
	PC = U.GetPC();
	
	class'MCreditsPage'.default.sCreditsFileName = sCreditsFileName;
	class'MCreditsPage'.default.CustomCreditLines = CustomCreditLines;
	
	PC.ClientOpenMenu("MPak.MCreditsPage");
	
	return false;
}

function string GetActionString()
{
	if(CustomCreditLines.Length == 0)
	{
		return ActionString @ "-- Playing credits from file:" @ sCreditsFileName;
	}
	else
	{
		return ActionString @ "-- Playing custom credits";
	}
}


defaultproperties
{
	sCreditsFileName="Credits.txt"
	ActionString="Play Credits"
}