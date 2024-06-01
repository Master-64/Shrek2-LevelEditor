// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfMPakVersion extends MScriptedAction
	Config(MPak);


var(Action) array<string> ExpectedMPakVersions;


function ProceedToNextAction(ScriptedController C)
{
	local string sMPakVersion;
	local int i;
	
	C.ActionNum++;
	
	GetUtils(C);
	
	sMPakVersion = Caps(U.GetMPakVersion());
	
	for(i = 0; i < ExpectedMPakVersions.Length; i++)
	{
		if(sMPakVersion == Caps(ExpectedMPakVersions[i]))
		{
			break;
		}
		
		if(i >= (ExpectedMPakVersions.Length - 1))
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
	return ActionString @ "-- Checking if the current MPak version is expected";
}


defaultproperties
{
	ExpectedMPakVersions(0)="v7.1"
	ActionString="If MPak Version"
}