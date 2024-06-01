// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MSimpleRandomTrigger extends MTriggers
	Placeable
	Config(MPak);


var() float Probability;
var() name EventTrue, EventFalse;


function Activate(Actor Other, Pawn Instigator)
{
	if(FRand() > Probability)
	{
		Event = EventTrue;
	}
	else
	{
		Event = EventFalse;
	}
	
	super.Activate(Other, Instigator);
}