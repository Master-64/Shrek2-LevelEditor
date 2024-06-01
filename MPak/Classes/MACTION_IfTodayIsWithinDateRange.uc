// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfTodayIsWithinDateRange extends MScriptedAction
	Config(MPak);


var(Action) string sStartingDate, sEndingDate;
var(Action) bool bIgnoreDay, bIgnoreMonth, bIgnoreYear;


function ProceedToNextAction(ScriptedController C)
{
	C.ActionNum++;
	
	GetUtils(C);
	
	if(bIgnoreDay)
	{
		if(bIgnoreMonth && bIgnoreYear)
		{
			return;
		}
		
		MakeDateVarCurrent(C, 0, sStartingDate);
		MakeDateVarCurrent(C, 0, sEndingDate);
	}
	
	if(bIgnoreMonth)
	{
		MakeDateVarCurrent(C, 1, sStartingDate);
		MakeDateVarCurrent(C, 1, sEndingDate);
	}
	
	if(bIgnoreYear)
	{
		MakeDateVarCurrent(C, 2, sStartingDate);
		MakeDateVarCurrent(C, 2, sEndingDate);
	}
	
	if(U.IsStringDate(sStartingDate) && U.IsStringDate(sEndingDate))
	{
		if(!U.IsCurrentDateInRange(sStartingDate, sEndingDate))
		{
			ProceedToSectionEnd(C);
		}
	}
	else
	{
		ProceedToSectionEnd(C);
	}
}

function MakeDateVarCurrent(ScriptedController C, int iIndex, out string sDate) // Makes a certain data variable the current one, therefore ignoring it
{
	local array<string> TokenArray;
	
	TokenArray = U.Split(sDate, "/");
	
	switch(iIndex)
	{
		case 0:
			TokenArray[1] = string(Abs(C.Level.Day));
			
			break;
		case 1:
			TokenArray[0] = string(Abs(C.Level.Month));
			
			break;
		case 2:
			TokenArray[2] = string(Abs(C.Level.Year));
			
			break;
	}
	
	sDate = TokenArray[0] $ "/" $ TokenArray[1] $ "/" $ TokenArray[2];
}

function bool StartsSection()
{
	return true;
}

function string GetActionString()
{
	return ActionString @ "-- Checking if the current date is within the range of dates '" $ sStartingDate $ "' and '" $ sEndingDate $ "'";
}


defaultproperties
{
	sStartingDate="1/1/2000"
	sEndingDate="12/31/2001"
	ActionString="If Today Is Within Date Range"
}