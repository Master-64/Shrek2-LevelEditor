// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MRandomTrigger extends MTriggers
	Placeable
	Config(MPak);


var() array<name> Events;


function Activate(Actor Other, Pawn Instigator)
{
	Event = Events[Rand(Events.Length)];
	
	super.Activate(Other, Instigator);
}