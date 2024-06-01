// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MScriptedTrigger extends MTriggers
	Placeable
	Config(MPak);


var(AIScript) export editinline array<export editinline ScriptedAction> Actions;
var ScriptedTrigger ST;


event PostBeginPlay()
{
	local Actor A;
	
	super.PostBeginPlay();
	
	if(Event == 'None')
	{
		Event = Name;
	}
	
	if(!U.MFancySpawn(class'ScriptedTrigger', Location,, A))
	{
		return;
	}
	
	ST = ScriptedTrigger(A);
	ST.Event = Event;
	ST.Actions = Actions;
}

function Activate(Actor Other, Pawn Instigator)
{
	super.Activate(Other, Instigator);
}


defaultproperties
{
	Begin Object Class=MACTION_WaitForEventSimple Name=MACTION_WaitForEventSimple0
	End Object
	Actions(0)=MACTION_WaitForEventSimple0
	bTriggerOnceOnly=true
}