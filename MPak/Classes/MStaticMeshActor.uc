// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MStaticMeshActor extends ShimmyStatActor
	Placeable
	HideCategories(ShimmyStatActor)
	Config(MPak);


event PostBeginPlay()
{
	return;
}

function StartShimmyShimmy()
{
	return;
}

function StartShimmyBounce()
{
	return;
}

function StartShimmyIdle()
{
	return;
}


defaultproperties
{
	StaticMesh=StaticMesh'1_Shreks_Swamp_SM.briar_patch'
	MountAction=MA_AutoFinishMount
	bHidden=false
	bIsMountable=false
}