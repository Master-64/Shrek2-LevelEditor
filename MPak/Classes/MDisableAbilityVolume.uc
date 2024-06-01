// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MDisableAbilityVolume extends MVolume
	Config(MPak);


var() bool bAppliesToAnyApplicablePawns;


event PostLoadGame(bool bLoadFromSaveGame)
{
	if(!bLoadFromSaveGame)
	{
		PC = U.GetPC();
	}
}

event Touch(Actor Other)
{
	UpdateFrontEnd(Other, true);
}

event Untouch(Actor Other)
{
	UpdateFrontEnd(Other, false);
}

function UpdateFrontEnd(Actor Other, bool bFrontEnd)
{
	if(bAppliesToAnyApplicablePawns || ((KWHeroController(Pawn(Other).Controller) == PC) && Other.IsA('SHHeroPawn')))
	{
		SHHeroPawn(Other).bFrontEndPlayer = bFrontEnd;
	}
}


defaultproperties
{
	bStatic=true
}