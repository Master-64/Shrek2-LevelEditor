// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MLipSyncDelegate extends MInfo
	Config(MPak);


const LipSyncAnimChannel = 64;
const RefreshRate = 60;

struct LipSyncData
{
	var() KWPawn LipSyncOwner;
	var() Sound DialogSound;
	var() string sDialogLine;
	var float fDialogLength, fLipAnimRate, fTimePassed;
	var name nOldAnim;
	var int iDialogLineLength, iTickCount, iCurrentTick, iSameAnimCount;
	var array<name> LipAnims;
};

var LipSyncData LSData;
var bool bCanBeTriggered;


event Trigger(Actor Other, Pawn EventInstigator)
{
	if(!bCanBeTriggered)
	{
		return;
	}
	
	bCanBeTriggered = ProcessLSData();
	
	if(ShouldRunLipSyncLogic())
	{
		GotoState('DoLipSync');
	}
}

function bool ShouldRunLipSyncLogic() // Returns true if lipsync logic can be ran
{
	return !bCanBeTriggered && LSData.LipSyncOwner != none;
}

function bool ProcessLSData() // Process any given LS data, returns false if no issues arose
{
	local int i;
	
	if(LSData.LipSyncOwner == none)
	{
		return true;
	}
	
	LSData.fDialogLength = GetSoundDuration(LSData.DialogSound);
	LSData.fLipAnimRate = (1000.0 / RefreshRate) / 200.0;
	
	// Remove redundant data before adding spacing
	while(InStr(LSData.sDialogLine, "  ") > -1)
	{
		U.RemoveText(LSData.sDialogLine, Mid(LSData.sDialogLine, InStr(LSData.sDialogLine, "  "), InStr(LSData.sDialogLine, "  ")));
	}
	
	while(InStr(LSData.sDialogLine, "..") > -1)
	{
		U.RemoveText(LSData.sDialogLine, Mid(LSData.sDialogLine, InStr(LSData.sDialogLine, ".."), InStr(LSData.sDialogLine, "..")));
	}
	
	while(InStr(LSData.sDialogLine, "!!") > -1)
	{
		U.RemoveText(LSData.sDialogLine, Mid(LSData.sDialogLine, InStr(LSData.sDialogLine, "!!"), InStr(LSData.sDialogLine, "!!")));
	}
	
	while(InStr(LSData.sDialogLine, "??") > -1)
	{
		U.RemoveText(LSData.sDialogLine, Mid(LSData.sDialogLine, InStr(LSData.sDialogLine, "??"), InStr(LSData.sDialogLine, "??")));
	}
	
	// Add spacing where needed so that the lip syncing is more in sync
	U.ReplaceText(LSData.sDialogLine, " ", "___");
	U.ReplaceText(LSData.sDialogLine, ".", "_________");
	U.ReplaceText(LSData.sDialogLine, "!", "_________");
	U.ReplaceText(LSData.sDialogLine, "?", "_________");
	U.ReplaceText(LSData.sDialogLine, "!?", "________");
	U.ReplaceText(LSData.sDialogLine, "?!", "________");
	U.ReplaceText(LSData.sDialogLine, ",", "_____");
	
	// Remove anything in the dialog line that is irrelevant information
	while(InStr(LSData.sDialogLine, "(") > -1)
	{
		U.RemoveText(LSData.sDialogLine, Mid(LSData.sDialogLine, InStr(LSData.sDialogLine, "("), InStr(LSData.sDialogLine, ")") + 1));
	}
	
	U.RemoveText(LSData.sDialogLine, Mid(LSData.sDialogLine, InStr(LSData.sDialogLine, "["), InStr(LSData.sDialogLine, "]") + 1));
	
	// Calculate the length of the data
	LSData.iTickCount = U.Ceiling(LSData.fDialogLength * RefreshRate);
	LSData.LipAnims.Insert(0, LSData.iTickCount);
	
	if(LSData.iTickCount <= 0)
	{
		return true;
	}
	
	LSData.iDialogLineLength = Len(LSData.sDialogLine);
	
	// Determine what lipsync animation should be playing on every individual tick
	for(i = 0; i < LSData.iTickCount; i++)
	{
		switch(Caps(Mid(LSData.sDialogLine, U.Floor(float(LSData.iDialogLineLength) / float(LSData.iTickCount) * float(i)), 1)))
		{
			case "_":
				LSData.LipAnims[i] = 'Silent';
				
				break;
			case "A":
			case "I":
				LSData.LipAnims[i] = 'AI';
				
				break;
			case "C":
			case "D":
			case "G":
			case "K":
			case "N":
			case "R":
			case "S":
			case "Y":
			case "Z":
				if(IsPIB(LSData.LipSyncOwner))
				{
					LSData.LipAnims[i] = 'CDG';
				}
				else
				{
					LSData.LipAnims[i] = 'CDGKNRSthYZ';
				}
				
				break;
			case "T":
				if(Caps(Mid(LSData.sDialogLine, i + 1, 1)) == "H")
				{
					if(IsPIB(LSData.LipSyncOwner))
					{
						LSData.LipAnims[i] = 'CDG';
					}
					else
					{
						LSData.LipAnims[i] = 'CDGKNRSthYZ';
					}
				}
				else
				{
					LSData.LipAnims[i] = 'AI';
				}
				
				break;
			case "E":
				if(IsPIB(LSData.LipSyncOwner))
				{
					LSData.LipAnims[i] = 'EE';
				}
				else
				{
					LSData.LipAnims[i] = 'E';
				}
				
				break;
			case "F":
			case "V":
				LSData.LipAnims[i] = 'FV';
				
				break;
			case "M":
			case "B":
			case "P":
				LSData.LipAnims[i] = 'MBP';
				
				break;
			case "O":
				if(IsPIB(LSData.LipSyncOwner))
				{
					LSData.LipAnims[i] = 'OH';
				}
				else
				{
					LSData.LipAnims[i] = 'O';
				}
				
				break;
			case "U":
				LSData.LipAnims[i] = 'U';
				
				break;
			default:
				LSData.LipAnims[i] = 'AI';
				
				break;
		}
	}
	
	return false;
}

function bool IsPIB(KWPawn P) // Returns true if the pawn is PIB
{
	return P.IsA('PIB') || P.IsA('MPIB');
}

state DoLipSync // Run lipsyncing logic
{
	event BeginState()
	{
		LSData.LipSyncOwner.AnimBlendParams(LipSyncAnimChannel, 1.0, 0.0, 0.0, U.SName(LSData.LipSyncOwner.GetPropertyText("MouthBone")));
	}
	
	event Tick(float DeltaTime)
	{
		if(!ShouldRunLipSyncLogic())
		{
			return;
		}
		
		if(LSData.iCurrentTick < LSData.iTickCount)
		{
			if(LSData.LipAnims[LSData.iCurrentTick] != LSData.nOldAnim || LSData.iSameAnimCount == U.Ceiling(float(RefreshRate) * 0.25))
			{
				LSData.LipSyncOwner.PlayAnim(LSData.LipAnims[LSData.iCurrentTick], LSData.fLipAnimRate, 0.0, LipSyncAnimChannel);
				LSData.nOldAnim = LSData.LipAnims[LSData.iCurrentTick];
				LSData.iSameAnimCount = 0;
				
				if(LSData.nOldAnim != 'Silent')
				{
					LSData.LipSyncOwner.SetAnimFrame(0.25, LipSyncAnimChannel);
				}
			}
			else
			{
				LSData.iSameAnimCount++;
				
				if(LSData.iSameAnimCount > U.Ceiling(float(RefreshRate) * 0.25))
				{
					LSData.iSameAnimCount = 0;
				}
			}
		}
		else
		{
			LSData.LipSyncOwner.PlayAnim('Silent', LSData.fLipAnimRate, 0.0, LipSyncAnimChannel);
			
			GotoState('');
			
			Destroy();
			
			return;
		}
		
		LSData.fTimePassed += DeltaTime;
		
		if(LSData.fTimePassed >= ((1000.0 / RefreshRate) / 1000.0) / 1.25)
		{
			LSData.fTimePassed = 0.0;
			LSData.iCurrentTick++;
		}
	}
}


defaultproperties
{
	bCanBeTriggered=true
	bAlwaysTick=true
	bStatic=false
}