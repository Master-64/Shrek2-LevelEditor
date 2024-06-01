// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MSMCollisionManager extends MInfo
	Config(MPak);


struct CollisionStruct
{
	var() StaticMesh StaticMeshTypeToUse;
	var() bool bCollideActors, bCollideWorld, bBlockActors, bBlockPlayers, bBlockZeroExtentTraces, bBlockNonZeroExtentTraces, bBlocksCamera;
	var() name nTagException;
};

var() array<CollisionStruct> CollisionsToChange;


event PostBeginPlay()
{
	local MSMCollisionManager SMCM;
	local StaticMeshActor SMA;
	local int i;
	
	super.PostBeginPlay();
	
	foreach DynamicActors(class'MSMCollisionManager', SMCM)
	{
		i++;
		
		if(i > 1)
		{
			Warn("MSMCollisionManager -- Deleting a duplicate MSMCollisionManager");
			
			Destroy();
			
			return;
		}
	}
	
	if(CollisionsToChange.Length == 0)
	{
		Warn("MSMCollisionManager -- No collision changes given; aborting");
		
		Destroy();
		
		return;
	}
	
	for(i = 0; i < CollisionsToChange.Length; i++)
	{
		if(CollisionsToChange[i].StaticMeshTypeToUse == none)
		{
			continue;
		}
		
		foreach AllActors(class'StaticMeshActor', SMA)
		{
			if(SMA.StaticMesh == CollisionsToChange[i].StaticMeshTypeToUse)
			{
				if(SMA.Tag == CollisionsToChange[i].nTagException)
				{
					continue;
				}
				
				SMA.SetCollision(CollisionsToChange[i].bCollideActors, CollisionsToChange[i].bBlockActors, CollisionsToChange[i].bBlockPlayers);
				SMA.bCollideWorld = CollisionsToChange[i].bCollideWorld;
				SMA.bBlockZeroExtentTraces = CollisionsToChange[i].bBlockZeroExtentTraces;
				SMA.bBlockNonZeroExtentTraces = CollisionsToChange[i].bBlockNonZeroExtentTraces;
				SMA.SetPropertyText("bBlocksCamera", U.BoolToString(CollisionsToChange[i].bBlocksCamera));
			}
		}
	}
	
	Destroy();
}