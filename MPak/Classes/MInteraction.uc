// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// A general fork of an Interaction


class MInteraction extends Interaction
	Config(MPak);


var MUtils U;
var private string sLevelName;


event Initialized()
{
	U = GetUtils();
	
	sLevelName = Left(string(ViewportOwner.Actor.PlayerReplicationInfo), InStr(string(ViewportOwner.Actor.PlayerReplicationInfo), "."));
}

function MUtils GetUtils()
{
	local MUtils Ut;
	
	foreach ViewportOwner.Actor.DynamicActors(class'MUtils', Ut)
	{
		return Ut;
	}
	
	return ViewportOwner.Actor.Spawn(class'MUtils');
}

event Tick(float DeltaTime)
{
	// Deletes itself if the map changed, since this interaction will always persist otherwise
	if(Left(string(ViewportOwner.Actor.PlayerReplicationInfo), InStr(string(ViewportOwner.Actor.PlayerReplicationInfo), ".")) != sLevelName)
	{
		ViewportOwner.InteractionMaster.RemoveInteraction(self);
	}
}


defaultproperties
{
	bRequiresTick=true
}