// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// Manages inputs received from MInterationUtility, which is
// used from within MUtils. This is essential for custom binds


class MInputManager extends MInfo
	Notplaceable
	Config(MPak);


var transient byte IK_Action[256], IK_KeyTicked[256];	// The state of each key and whether a key event tied to the key has been updated in this tick


event PostLoadGame(bool bLoadFromSaveGame)
{
	local int i;
	
	// All keys should start (or load) at IST_Release, not IST_None
	for(i = 0; i < 256; i++)
	{
		IK_Action[i] = 3;
	}
}

function SetIKAction(byte Key, byte Action)
{
	IK_Action[Key] = Action;
	IK_KeyTicked[Key] = 2;
}

function byte GetIKAction(byte Key)
{
	return IK_Action[Key];
}

function bool IsKeyInAction(byte Key, byte Action)
{
	if(IK_Action[Key] == Action && IK_KeyTicked[Key] == 1)
	{
		return true;
	}
	
	return false;
}

event Tick(float DeltaTime)
{
	local int i;
	
	for(i = 0; i < 256; i++)
	{
		// This essentially says that if a key is being pressed but hasn't been ticked, we can assume the key is being held but hasn't started actuating, and we set the state of the key to be released while it's being held. This helps with input management
		if(IK_Action[i] == 1 && IK_KeyTicked[i] == 0)
		{
			IK_Action[i] = 3;
		}
		
		if(IK_KeyTicked[i] > 0)
		{
			IK_KeyTicked[i] = Max(IK_KeyTicked[i] - 1, 0);
		}
	}
	
	// If the game is paused, all keys that are being registered as held should now be registered as released
	if(Level.Pauser != none)
	{
		for(i = 0; i < 256; i++)
		{
			if(IK_Action[i] == 1)
			{
				IK_Action[i] = 3;
			}
		}
	}
}


defaultproperties
{
	bNoDelete=false
	bAlwaysTick=true
}