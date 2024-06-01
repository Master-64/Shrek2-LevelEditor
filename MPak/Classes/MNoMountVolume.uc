// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MNoMountVolume extends MVolume
	Config(MPak);


var() float fDefaultMaxMountHeight;


event PostLoadGame(bool bLoadFromSaveGame)
{
	if(!bLoadFromSaveGame)
	{
		PC = U.GetPC();
	}
}

event Touch(Actor Other)
{
	if(KWHeroController(Pawn(Other).Controller) == PC)
	{
		Other.SetPropertyText("MaxMountHeight", "0.0");
	}
}

event Untouch(Actor Other)
{
	if(KWHeroController(Pawn(Other).Controller) == PC)
	{
		Other.SetPropertyText("MaxMountHeight", string(fDefaultMaxMountHeight));
	}
}


defaultproperties
{
	fDefaultMaxMountHeight=256.0
}