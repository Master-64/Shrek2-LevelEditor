// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MOnSaveLoadGame extends MInfo
	Config(MPak);


var() name OnPreSaveGameEvent, OnPostSaveGameEvent, OnPostLoadGameEvent;


event PreSaveGame()
{
	if(OnPreSaveGameEvent != '')
	{
		TriggerEvent(OnPreSaveGameEvent, none, none);
	}
}

event PostSaveGame()
{
	if(OnPostSaveGameEvent != '')
	{
		TriggerEvent(OnPostSaveGameEvent, none, none);
	}
}

event PostLoadGame(bool bLoadFromSaveGame)
{
	if(bLoadFromSaveGame && OnPostLoadGameEvent != '')
	{
		TriggerEvent(OnPostLoadGameEvent, none, none);
	}
}