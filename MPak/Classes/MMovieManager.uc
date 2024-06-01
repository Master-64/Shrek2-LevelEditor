// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MMovieManager extends MInfo
	Config(MPak);


var() array<string> MovieList;
var() vector vFallbackResolution;
var() name nEventToFireWhenFinished;
var() bool bStopMusicDuringMovies, bPickRandom, bKeepHUDHiddenAfterMovies;
var() float fMusicFadeTime;
var int iCurrentMovieIndex;
var string sOldMusic;
var bool bCanBeTriggered, bFallback;
var float fMovieTime;


function Trigger(Actor Other, Pawn EventInstigator)
{
	if(!bCanBeTriggered)
	{
		return;
	}
	
	bCanBeTriggered = false;
	
	BeginNextMovie();
}

function BeginNextMovie() // Begins playing the upcoming movie(s)
{
	local vector vRes;
	local string sResVars;
	
	GotoState('');
	
	PC = U.GetPC();
	HUD = U.GetHUD();
	HUD.bHideHUD = true;
	
	if(bStopMusicDuringMovies && iCurrentMovieIndex == 0)
	{
		U.StopAMusic(fMusicFadeTime);
		
		sOldMusic = U.GetCurrentMusic();
	}
	
	if(bPickRandom)
	{
		iCurrentMovieIndex = Rand(MovieList.Length);
	}
	
	if(iCurrentMovieIndex > MovieList.Length - 1)
	{
		StopPlayingMovies();
		
		return;
	}
	
	vRes = U.GetResolution();
	
	if(!bFallback)
	{
		sResVars = "$" $ U.FloatToString(vRes.X) $ "x" $ U.FloatToString(vRes.Y);
	}
	else
	{
		// If this fallback doesn't work, a non-critical infinite loop will occur
		sResVars = "$" $ U.FloatToString(vFallbackResolution.X) $ "x" $ U.FloatToString(vFallbackResolution.Y);
		
		bFallback = false;
	}
	
	U.PlayMovie(MovieList[iCurrentMovieIndex] $ sResVars, true);
	
	GotoState('PlayMovie');
}

function StopPlayingMovies() // Stops playing movie(s)
{
	HUD = U.GetHUD();
	HUD.bHideHUD = bKeepHUDHiddenAfterMovies;
	
	GotoState('');
	
	if(bStopMusicDuringMovies)
	{
		U.PlayAMusic(sOldMusic, fMusicFadeTime);
	}
	
	if(nEventToFireWhenFinished != 'None')
	{
		TriggerEvent(nEventToFireWhenFinished, none, none);
	}
	
	bCanBeTriggered = true;
}

state PlayMovie // Constantly checks whether a movie has stopped playing and responds accordingly
{
	event Tick(float DeltaTime)
	{
		if(!U.IsMoviePlaying())
		{
			// If this is true then it is very likely the movie failed to be located and played
			if(fMovieTime <= 0.0)
			{
				bFallback = true;
				
				fMovieTime = 0.0;
				
				BeginNextMovie();
				
				return;
			}
			
			fMovieTime = 0.0;
			
			if(!bPickRandom)
			{
				iCurrentMovieIndex++;
				
				BeginNextMovie();
			}
			else
			{
				StopPlayingMovies();
			}
			
			return;
		}
		
		fMovieTime += DeltaTime;
	}
}


defaultproperties
{
	vFallbackResolution=(X=640.0,Y=480.0)
	bCanBeTriggered=true
	fMusicFadeTime=1.0
	Tag=MMovieManager
}