// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MMoviePlane extends MPawn
	Config(MPak);


struct MovieStruct
{
	var() string sMovieName, sMovieName512, sMovieName640, sMovieName1024;
};

var() MovieStruct MovieToPlay;
var() float fFrameRate, fMovieDuration;
var() bool bInitiallyPlayMovie, bDoNotLoop, bTriggerOnceOnly;
var() Material TextureWhileMovieIsNotPlaying;
var bool bTriggered;
var MovieTexture MovieTex;


event PreBeginPlay()
{
	super.PreBeginPlay();
	
	fMovieDuration = FMax(fMovieDuration, 0.01);
}

event PreSaveGame()
{
	StopMovie();
}

event PostSaveGame()
{
	InitMovie(bInitiallyPlayMovie);
}

event PostLoadGame(bool bLoadFromSaveGame)
{
	InitMovie(bInitiallyPlayMovie);
}

event Destroyed()
{
	StopMovie();
	
	super.Destroyed();
}

event Timer()
{
	bInitiallyPlayMovie = !bInitiallyPlayMovie;
	
	InitMovie(bInitiallyPlayMovie);
}

function InitMovie(bool bPlayMovie)
{
	if(bPlayMovie)
	{
		MovieTex = MovieTexture(Level.ObjectPool.AllocateObject(class'MovieTexture'));
		MovieTex.MovieFilename = GetMovieToPlay();
		MovieTex.FrameRate = fFrameRate;
		MovieTex.InitializeMovie();
		
		Skins[0] = MovieTex;
		
		if(bDoNotLoop)
		{
			SetTimer(fMovieDuration, false);
		}
	}
	else
	{
		StopMovie();
	}
}

function StopMovie()
{
	Skins[0] = TextureWhileMovieIsNotPlaying;
	
	if(MovieTex != none)
	{
		Level.ObjectPool.FreeObject(MovieTex);
		
		MovieTex = none;
	}
	
	if(bDoNotLoop)
	{
		bInitiallyPlayMovie = false;
	}
}

function string GetMovieToPlay()
{
	switch(U.GetResolution().X)
	{
		case 512:
			return U.FormatMovieString(MovieToPlay.sMovieName512);
			
			break;
		case 640:
			return U.FormatMovieString(MovieToPlay.sMovieName640);
			
			break;
		case 1024:
			return U.FormatMovieString(MovieToPlay.sMovieName1024);
			
			break;
		default:
			return U.FormatMovieString(MovieToPlay.sMovieName);
			
			break;
	}
}


function Trigger(Actor Other, Pawn EventInstigator)
{
	if(bTriggerOnceOnly && bTriggered)
	{
		return;
	}
	
	bTriggered = true;
	
	bInitiallyPlayMovie = !bInitiallyPlayMovie;
	
	InitMovie(bInitiallyPlayMovie);
}


defaultproperties
{
	fFrameRate=30.0
	bInitiallyPlayMovie=true
	Skins(0)=Texture'KWGame.m'
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'4_FGM_PIB_SM.Map_FloorShape'
	bDirectional=true
	bShadowCast=true
	bStaticLighting=true
	Physics=PHYS_None
	bStasis=true
	bCanBeBaseForPawns=true
	bUseCylinderCollision=false
	bEdShouldSnap=true
}