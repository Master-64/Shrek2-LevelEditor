// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MShrinkPassthroughVolume extends MVolume
	Config(MPak);


var Actor Player;
var int bOldbCollideActors, bOldbBlockActors, bOldbBlockPlayers;


event PostLoadGame(bool bLoadFromSaveGame)
{
	if(!bLoadFromSaveGame)
	{
		PC = U.GetPC();
	}
}

event Touch(Actor Other)
{
	if(KWHeroController(Pawn(Other).Controller) == PC && Other.IsA('SHHeroPawn') && bOldbCollideActors == -1)
	{
		if(SHHeroPawn(Other).bShrink)
		{
			Player = Other;
			
			PassingThroughVolume(Player, true);
		}
	}
}

event Tick(float DeltaTime)
{
	local MShrinkPassthroughVolume SPV;
	local bool B;
	
	if(Player == none)
	{
		return;
	}
	
	foreach Player.TouchingActors(class'MShrinkPassthroughVolume', SPV)
	{
		if(SPV == self)
		{
			B = true;
			
			break;
		}
	}
	
	if(!B)
	{
		PassingThroughVolume(Player, false);
		
		Player = none;
	}
}

function PassingThroughVolume(Actor A, bool B)
{
	local StaySmallTrigger SST;
	
	if(B)
	{
		bOldbCollideActors = int(A.bCollideActors);
		bOldbBlockActors = int(A.bBlockActors);
		bOldbBlockPlayers = int(A.bBlockPlayers);
		
		A.SetCollision(true, false, false);
		
		foreach A.TouchingActors(class'StaySmallTrigger', SST)
		{
			break;
		}
		
		if(SST == none)
		{
			SHHeroController(PC).PausePotion();
		}
	}
	else
	{
		A.SetCollision(bool(bOldbCollideActors), bool(bOldbBlockActors), bool(bOldbBlockPlayers));
		
		bOldbCollideActors = -1;
		bOldbBlockActors = -1;
		bOldbBlockPlayers = -1;
		
		foreach A.TouchingActors(class'StaySmallTrigger', SST)
		{
			break;
		}
		
		if(SST == none)
		{
			SHHeroController(PC).UnPausePotion();
		}
		
		U.MFancySetLocation(A, A.Location);
	}
}


defaultproperties
{
	bOldbCollideActors=-1
	bOldbBlockActors=-1
	bOldbBlockPlayers=-1
}