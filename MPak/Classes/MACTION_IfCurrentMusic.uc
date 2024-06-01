// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfCurrentMusic extends MScriptedAction
	Config(MPak);


var(Action) array<string> ExpectedMusicTracks;


function ProceedToNextAction(ScriptedController C)
{
	local int i;
	local string sCurrentMusic;
	
	C.ActionNum++;
	
	GetUtils(C);
	
	FormatMusicTracks(ExpectedMusicTracks);
	
	sCurrentMusic = Caps(U.GetCurrentMusic());
	
	for(i = 0; i < ExpectedMusicTracks.Length; i++)
	{
		if(sCurrentMusic == ExpectedMusicTracks[i])
		{
			break;
		}
		
		if(i >= (ExpectedMusicTracks.Length - 1))
		{
			ProceedToSectionEnd(C);
		}
	}
}

function FormatMusicTracks(out array<string> MTs) // Takes all expected music tracks and outputs them all after being formatted (Caps + ".ogg" removal)
{
	local int i;
	
	for(i = 0; i < MTs.Length; i++)
	{
		MTs[i] = Caps(MTs[i]);
		
		if(Right(MTs[i], 4) == Caps(".ogg"))
		{
			MTs[i] = Left(MTs[i], Len(MTs[i]) - 4);
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
	ExpectedMusicTracks(0)="1_Swamp"
	ActionString="If Current Music"
}