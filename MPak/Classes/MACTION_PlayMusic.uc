// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_PlayMusic extends MScriptedAction
	Config(MPak);


var(Action) array<string> Songs;
var(Action) float fFadeInTime, fFadeOutTime;
var(Action) bool bDoNotLoop, bPickRandom, bStopMusic;


function bool InitActionFor(ScriptedController C)
{
	GetUtils(C);
	
	if(!bStopMusic)
	{
		if(!bPickRandom)
		{
			U.PlayAMusic(Songs[0], fFadeInTime, bDoNotLoop);
		}
		else
		{
			U.PlayAMusic(Songs[Rand(Songs.Length)], fFadeInTime, bDoNotLoop);
		}
	}
	else
	{
		U.StopAMusic(fFadeOutTime);
	}
	
	return false;
}

function string GetActionString()
{
	if(bStopMusic)
	{
		return ActionString @ "-- Stopping all music";
	}
	else if(!bPickRandom)
	{
		return ActionString @ "-- Playing song" @ Songs[0];
	}
	else
	{
		return ActionString @ "-- Playing a random song";
	}
}


defaultproperties
{
	fFadeInTime=1.0
	fFadeOutTime=4.0
	ActionString="Play Music"
}