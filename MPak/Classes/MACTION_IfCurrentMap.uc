// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfCurrentMap extends MScriptedAction
	Config(MPak);


var(Action) array<string> ExpectedMapNames;


function ProceedToNextAction(ScriptedController C)
{
	local string sCurrentMap;
	local int i;
	
	C.ActionNum++;
	
	GetUtils(C);
	
	FormatMapNames(ExpectedMapNames);
	
	sCurrentMap = Caps(U.GetCurrentMap());
	
	for(i = 0; i < ExpectedMapNames.Length; i++)
	{
		if(sCurrentMap == ExpectedMapNames[i])
		{
			break;
		}
		
		if(i >= (ExpectedMapNames.Length - 1))
		{
			ProceedToSectionEnd(C);
		}
	}
}

function FormatMapNames(out array<string> MNs) // Takes all expected map names and outputs them all after being formatted (Caps + ".unr" removal)
{
	local int i;
	
	for(i = 0; i < MNs.Length; i++)
	{
		MNs[i] = Caps(MNs[i]);
		
		if(Right(MNs[i], 4) == Caps(".unr"))
		{
			MNs[i] = Left(MNs[i], Len(MNs[i]) - 4);
		}
	}
}

function bool StartsSection()
{
	return true;
}

function string GetActionString()
{
	return ActionString @ "-- Checking if the current map is any of the expected maps";
}


defaultproperties
{
	ExpectedMapNames(0)="1_Shreks_Swamp"
	ActionString="If Current Map"
}