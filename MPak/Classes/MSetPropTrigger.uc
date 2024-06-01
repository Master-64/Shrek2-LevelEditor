// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MSetPropTrigger extends MTriggers
	Placeable
	Config(MPak);


var() class<Actor> ActorClass;
var() name ActorTag;
var() string Variable, Value;


function Activate(Actor Other, Pawn Instigator)
{
	local Actor TargetActor;
	
	super.Activate(Other, Instigator);
	
	if(ActorTag != 'None')
	{
		if(ActorClass == none)
		{
			Warn("MSetPropTrigger -- An actor class assignment is missing; aborting process");
			
			return;
		}
		
		foreach AllActors(ActorClass, TargetActor, ActorTag)
		{
			TargetActor.SetPropertyText(Variable, Value);
		}
	}
}


defaultproperties
{
	ActorClass=class'Actor'
}