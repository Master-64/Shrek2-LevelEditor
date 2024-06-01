// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MUseVolume extends MVolume
	Config(MPak);


event UsedBy(Pawn User)
{
	TriggerEvent(Event, User, User);
}


defaultproperties
{
	bStatic=true
}