// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MConversationManager extends MInfo
	Config(MPak);


struct CoversationStruct
{
	var() array<Sound> DialogsInOrder;
	var() array<string> SubtitlesInOrder;
	var() array< class<Pawn> > PawnsInOrder;
	var() array<name> PawnTagsInOrder;
};

struct MinMaxFStruct
{
	var() float Min, Max;
};

struct LocalizeSoundVarsStruct
{
	var() float fRadius, fPitch;
};

var() array<CoversationStruct> Conversations;
var() MinMaxFStruct ConversationDelay, DialogDelay;
var() float fVolume;
var() bool bAllowRepeats, bPlaySound3D, bShowSubtitles, bEnabled;
var() LocalizeSoundVarsStruct LocalizeSoundVars;
var array<float> DialogLengths;
var int iConversationToExecute, iOldConversation, iCurrentDialog;

// This is here so that the states below can have "local variables" (a state cannot have local variables by default)
var int i;
var float f;


event PostBeginPlay()
{
	local MConversationManager CM;
	local int i;
	
	super.PostBeginPlay();
	
	foreach DynamicActors(class'MConversationManager', CM)
	{
		if(CM.bEnabled == true)
		{
			i++;
			
			if(i > 1)
			{
				Warn("MConversationManager -- More than one MConversationManager are enabled at the same time; this shouldn't be expected. Turning all but one off");
				
				CM.bEnabled = false;
			}
		}
	}
	
	if(bEnabled)
	{
		Log(class'MVersion'.default.ModName @ class'MVersion'.default.Version @ "-- This level is running Master's Conversation Manager, made by Master_64");
	}
}

event PostLoadGame(bool bLoadFromSaveGame)
{
	if(!bLoadFromSaveGame)
	{
		PC = U.GetPC();
		
		GotoState('Idle');
	}
}

function float GetRandomDelay() // Returns with a random delay
{
	return RandRange(ConversationDelay.Min, ConversationDelay.Max);
}

function GetConversationLengths(int Index) // Gets the delay of each dialog. Needed for allowing a bEnabled change mid-conversation to stop the entire conversation
{
	local array<float> f;
	local int i;
	
	for(i = 0; i < Conversations[Index].DialogsInOrder.Length; i++)
	{
		f[i] = GetSoundDuration(Conversations[Index].DialogsInOrder[i]);
	}
	
	DialogLengths = f;
}

function PlayConversationSound(int Index, int Index2, bool bControl, float fVol) // Plays a 2D or 3D sound
{
	local Pawn TargetPawn;
	
	if(!bPlaySound3D)
	{
		U.PlayASound(, Conversations[Index].DialogsInOrder[Index2], fVol);
	}
	else
	{
		if(Conversations[Index].PawnsInOrder[Index2] == none)
		{
			Warn("MConversationManager -- An actor class assignment is missing; aborting process");
			
			return;
		}
		
		foreach DynamicActors(Conversations[Index].PawnsInOrder[Index2], TargetPawn, Conversations[Index].PawnTagsInOrder[Index2])
		{
			break;
		}
		
		if(TargetPawn != none)
		{
			U.PlayASound3D(TargetPawn,, Conversations[Index].DialogsInOrder[Index2], fVol, LocalizeSoundVars.fRadius, LocalizeSoundVars.fPitch);
		}
	}
	
	if(bShowSubtitles)
	{
		HUD = U.GetHUD();
		
		HUD.StartCutScene(true);
		HUD.SetSubtitleText(Conversations[Index].SubtitlesInOrder[Index2], DialogLengths[Index2]);
	}
}

state Idle // Waits and constantly checks whether bEnabled is true or not. If it is true, change to state 'WaitBeforeSpeakTimer'
{
	event Timer()
	{
		if(bEnabled)
		{
			SetTimer(0.0, false);
			
			GotoState('WaitBeforeSpeakTimer');
		}
	}
	
	Begin:
	
	SetTimer(0.1, true);
}

state WaitBeforeSpeakTimer // Starts a big random delay, then checks if bEnabled is still true. If it's still true, calculate which conversation to play, then go to state 'StartConversation'
{
	event Timer()
	{
		if(!bEnabled)
		{
			SetTimer(0.0, false);
			
			GotoState('Idle');
		}
		
		iConversationToExecute = Rand(Conversations.Length);
		
		if(!bAllowRepeats)
		{
			if(iOldConversation == iConversationToExecute && Conversations.Length != 1)
			{
				if(Conversations.Length == iConversationToExecute)
				{
					iConversationToExecute -= 1;
				}
				else
				{
					iConversationToExecute++;
				}
			}
		}
		
		// Saves the conversation last played
		iOldConversation = iConversationToExecute;
		
		GotoState('StartConversation');
	}
	
	Begin:
	
	f = GetRandomDelay();
	
	SetTimer(f, true);
}

state StartConversation // Plays out a conversation. If at any point bEnabled is changed to false mid-way through, the conversation will be stopped
{
	event Timer()
	{
		if(!bEnabled)
		{
			SetTimer(0.0, false);
			
			GotoState('Idle');
		}
	}
	
	function Conversate()
	{
		PlayConversationSound(iConversationToExecute, iCurrentDialog, true, fVolume);
	}
	
	Begin:
	
	GetConversationLengths(iConversationToExecute);
	SetTimer(0.1, true);
	
	for(i = 0; i < Conversations[iConversationToExecute].DialogsInOrder.Length; i++)
	{
		iCurrentDialog = i;
		f = RandRange(DialogDelay.Min, DialogDelay.Max);
		Conversate();
		
		Sleep(DialogLengths[i] + f);
	}
	
	SetTimer(0.0, false);
	
	GotoState('Idle');
}


defaultproperties
{
	bEnabled=true
	fVolume=1.4
	ConversationDelay=(Min=15.0,Max=30.0)
	DialogDelay=(Min=0.2,Max=0.2)
	LocalizeSoundVars=(fRadius=8192.0,fPitch=1.0)
	iOldConversation=-1 // This allows the first conversation to be any conversation while preventing repeats
}