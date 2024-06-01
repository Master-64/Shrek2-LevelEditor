// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// Used in the WaitForCutscene action, and tracks when
// a cutscene has stopped playing for the player


class MCutsceneDelegate extends MInfo
	Notplaceable
	Config(MPak);


var name nEventName;					// The event to fire to in order to tell the latent action that called this info into existence
var bool bIncludeNonCinematicCutscenes;	// If true, also checks for non-cinematic cutscenes
var KWHeroController PC;


event PostLoadGame(bool bLoadFromSaveGame)
{
	if(!bLoadFromSaveGame)
	{
		PC = KWGame(Level.Game).GetHeroController();
	}
}

event Tick(float DeltaTime)
{
	if(!PC.bInCutscene(bIncludeNonCinematicCutscenes))
	{
		TriggerEvent(nEventName, none, none);
		
		Destroy();
	}
}