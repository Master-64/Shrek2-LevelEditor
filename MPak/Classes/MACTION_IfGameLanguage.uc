// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfGameLanguage extends MScriptedAction
	Config(MPak);


var(Action) array<string> ExpectedGameLanguages;


function ProceedToNextAction(ScriptedController C)
{
	local int i;
	local string sCurrentLanguage;
	
	C.ActionNum++;
	
	GetUtils(C);
	
	sCurrentLanguage = Caps(U.GetLanguage());
	
	for(i = 0; i < ExpectedGameLanguages.Length; i++)
	{
		if(sCurrentLanguage == Caps(ExpectedGameLanguages[i]))
		{
			break;
		}
		
		if(i >= (ExpectedGameLanguages.Length - 1))
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
	return ActionString @ "-- Checking if the current music track is expected";
}


defaultproperties
{
	ExpectedGameLanguages(0)="int"
	ActionString="If Game Language"
}