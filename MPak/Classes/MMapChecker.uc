// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MMapChecker extends MInfo
	Config(MPak);


var array<string> sLogs;


event PostBeginPlay()
{
	local MMapChecker MC;
	local int i, i1, i2;
	
	super.PostBeginPlay();
	
	foreach DynamicActors(class'MMapChecker', MC)
	{
		i++;
		
		if(i > 1)
		{
			Warn("MMapChecker -- Deleting a duplicate MMapChecker");
			
			Destroy();
			
			return;
		}
	}
	
	TempLog("----------------------------------------------------------------------------------------------------");
	TempLog("");
	
	i1 = WarnCheck();
	i2 = ErrorCheck();
	
	TempLog("");
	TempLog("----------------------------------------------------------------------------------------------------");
	TempLog("");
	
	if(i1 > 0)
	{
		TempLog(string(i1) @ "warnings were discovered. See above");
	}
	else
	{
		TempLog("No warnings were detected! :D");
	}
	
	if(i2 > 0)
	{
		TempLog(string(i2) @ "errors were discovered. See above");
	}
	else
	{
		TempLog("No major errors were detected! :D");
	}
	
	TempLog("");
	TempLog("");
	TempLog("Logs with a ? mean Warning and logs with a * mean Error");
	TempLog("");
	TempLog("MMapChecker -- Level" @ GetRawMapName() @ "has been diagnosed with MMapChecker, made by Master_64");
	TempLog("");
	TempLog("----------------------------------------------------------------------------------------------------");
	
	U.CLog(sLogs, "MMapCheckerLogs.log");
	
	Destroy();
}

function int WarnCheck() // Checks the entire map for warnings, then returns with how many warnings it detected
{
	local int i, i1;
	local Actor A, A1;
	local Trigger T;
	local KWLight KWL;
	local BounceSheet BS;
	local BouncePad BP;
	local StaticMeshActor SMA1, SMA2;
	local vector vTemp;
	
	foreach AllActors(class'Trigger', T)
	{
		if(T.Event == 'None' && T.GetPropertyText("MultiEvents") == "()")
		{
			TempLog("? Trigger" @ string(T) @ "is missing an event");
			
			i++;
		}
		
		vTemp = T.Location;
		vTemp.Z -= (T.CollisionHeight * 2.0) + (T.CollisionHeight / 2.0);
		
		if(T.bCollideActors && FastTrace(T.Location, vTemp))
		{
			TempLog("? Trigger" @ string(T) @ "might be a floating trigger with collision enabled");
			
			i++;
		}
	}
	
	foreach AllActors(class'Actor', A)
	{
		if(A.Event != 'None' && A.default.Event == 'None' && Left(Caps(string(A.Event)), 4) != "CUT_" && !A.IsA('ScriptedTrigger'))
		{
			i1 = 0;
			
			foreach AllActors(class'Actor', A1, A.Event)
			{
				i1++;
			}
			
			if(i1 == 0)
			{
				TempLog("? Actor" @ string(A) @ "has an event initially linked to nothing");
				
				i++;
			}
		}
	}
	
	i1 = 0;
	
	foreach DynamicActors(class'KWLight', KWL)
	{
		if(KWL.bDynamicLight)
		{
			i1++;
		}
	}
	
	if(i1 > 0)
	{
		TempLog("? There are" @ string(i1) @ "dynamic lights in the map. This will cause major performance issues if too many are visible at once");
		
		i++;
	}
	
	i1 = 0;
	
	foreach AllActors(class'BounceSheet', BS)
	{
		foreach AllActors(class'BouncePad', BP)
		{
			if(BP.Tag == BS.Event)
			{
				BP = none;
				
				break;
			}
		}
		
		if(BP != none)
		{
			TempLog("? BounceSheet" @ string(BS) @ "is not initially linked to any BouncePad");
			
			i++;
		}
	}
	
	foreach AllActors(class'StaticMeshActor', SMA1)
	{
		i1 = 0;
		
		foreach RadiusActors(class'StaticMeshActor', SMA2, 256.0)
		{
			i1++;
		}
		
		if(i1 >= 15)
		{
			TempLog("? StaticMeshActor" @ string(SMA1) @ "has" @ string(i1) @ "other StaticMeshActors very close to it");
			
			i++;
		}
	}
	
	i1 = 0;
	
	return i;
}

function int ErrorCheck() // Checks the entire map for errors, then returns with how many errors it detected
{
	local int i, i1;
	local Actor A;
	local Brush B;
	local Shrek S;
	local PhysicsVolume PV;
	
	foreach AllActors(class'Actor', A)
	{
		if(!A.IsA('PathBlockingVolume') && A.default.bCollideActors && !A.bCollideActors)
		{
			TempLog("* Actor" @ string(A) @ "needs bCollideActors=true");
			
			i++;
		}
	}
	
	foreach AllActors(class'Brush', B)
	{
		if(B.IsA('Volume'))
		{
			continue;
		}
		
		if(IsVectorBad(B.Location))
		{
			TempLog("* Brush" @ string(B) @ "needs its Location rounded");
			
			i++;
		}
		
		if(IsVectorBad(B.PrePivot))
		{
			TempLog("* Brush" @ string(B) @ "needs its PrePivot rounded");
			
			i++;
		}
	}
	
	foreach DynamicActors(class'Shrek', S)
	{
		i1++;
	}
	
	if(i1 == 0)
	{
		TempLog("* Shrek is missing from the map, which will cause major issues");
		
		i++;
	}
	
	i1 = 0;
	
	foreach AllActors(class'PhysicsVolume', PV)
	{
		if(PV.bDestructive)
		{
			TempLog("* PhysicsVolume" @ string(PV) @ "needs bDestructive=false");
			
			i++;
		}
	}
	
	return i;
}

function TempLog(string sLog)
{
	sLogs.Insert(sLogs.Length, 1);
	sLogs[sLogs.Length - 1] = sLog;
}

function bool IsVectorBad(vector V) // Returns true if a vector has an offset that is not a whole number
{
	if((V.X - float(int(V.X)) != 0.0) || (V.Y - float(int(V.Y)) != 0.0) || (V.Z - float(int(V.Z)) != 0.0))
	{
		return true;
	}
}

function string GetRawMapName() // Gets the raw map name, excluding ".unr"
{
	local array<string> TokenArray;
	
	TokenArray = KWGame(Level.Game).Split(Level.GetLocalURL(), "?");
	
	if(Caps(Right(TokenArray[0], 4)) == Caps(".unr"))
	{
		TokenArray[0] = Left(TokenArray[0], Len(TokenArray[0]) - 4);
	}
	
	return TokenArray[0];
}