// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MMusicManager extends MInfo
	Config(MPak);


#exec TEXTURE IMPORT NAME=MMusicManager FILE=Textures\MMusicManager.dds FLAGS=2


enum EEventType
{
	ET_None,
	ET_Condition_Tag_X_Enabled,
	ET_Cutscene_Playing,
	ET_Movie_Playing,
	ET_Below_X_Health,
	ET_Below_X_Percent_Health,
	ET_X_Or_More_Coins,
	ET_Fighting_X_Enemies,
	ET_Fighting_Boss,
	ET_Within_X_Distance_From_Enemies,
	ET_Within_X_Distance_From_Shamrock,
	ET_Touching_Class_X_Actor,
	ET_Elapsed_Level_Time_Higher_Than_X
};

struct MusicStruct
{
	var bool bEnabled;
	var() EEventType EventType;
	var() string sSong;
	var() float fFadeTime, fLullPeriod;
	var() bool bInvertEventCondition;
	var() string OptionalVar;
	var() name nEventToFire;
};

var() array<MusicStruct> MusicEvents;
var() bool bEnabled;
var bool bIgnoreMusicEvents;
var MusicStruct CurrentMusicEvent;


event PostBeginPlay()
{
	local MMusicManager MM;
	local int i;
	
	super.PostBeginPlay();
	
	foreach DynamicActors(class'MMusicManager', MM)
	{
		i++;
		
		if(i > 1)
		{
			Warn("MMusicManager -- Deleting a duplicate MMusicManager");
			
			Destroy();
			
			return;
		}
	}
	
	FormatMusicEvents(MusicEvents);
	
	Log(class'MVersion'.default.ModName @ class'MVersion'.default.Version @ "-- This level is running Master's Music Manager, made by Master_64");
}

event PostLoadGame(bool bLoadFromSaveGame)
{
	if(!bLoadFromSaveGame)
	{
		PC = U.GetPC();
	}
}

event Timer()
{
	bIgnoreMusicEvents = false;
}

event Tick(float DeltaTime)
{
	if(!bEnabled || bIgnoreMusicEvents || SHHeroController(PC).bPotionInUse || MusicEvents.Length == 0)
	{
		return;
	}
	
	if(CurrentMusicEvent.bEnabled && CurrentMusicEvent.EventType != ET_None)
	{
		if(!CheckIfMusicEvent(CurrentMusicEvent.EventType, CurrentMusicEvent.bInvertEventCondition, CurrentMusicEvent.OptionalVar) || (U.GetCurrentMusic() != CurrentMusicEvent.sSong))
		{
			CurrentMusicEvent.EventType = ET_None;
			CurrentMusicEvent.bEnabled = false;
		}
		else
		{
			return;
		}
	}
	
	TickMusicEventChecks();
}

function TickMusicEventChecks() // Runs a check to see if any music events are valid to run
{
	local int i, iNoneIndex;
	
	HP = U.GetHP();
	
	for(i = 0; i < MusicEvents.Length; i++)
	{
		if(MusicEvents[i].EventType == ET_None)
		{
			iNoneIndex = i;
		}
		
		if(U.GetCurrentMusic() == MusicEvents[i].sSong)
		{
			continue;
		}
		
		if(CheckIfMusicEvent(MusicEvents[i].EventType, MusicEvents[i].bInvertEventCondition, MusicEvents[i].OptionalVar))
		{
			StartMusicEvent(MusicEvents[i]);
			
			return;
		}
	}
	
	if(MusicEvents[iNoneIndex].sSong != U.GetCurrentMusic())
	{
		StartMusicEvent(MusicEvents[iNoneIndex]);
	}
}

function bool CheckIfMusicEvent(EEventType EventType, bool bInvertEventCondition, string OptionalVar) // Returns true if a music event's condition is set
{
	switch(EventType)
	{
		case ET_None:
			break;
		case ET_Condition_Tag_X_Enabled:
			if(!bInvertEventCondition)
			{
				if(CheckConditionTag(OptionalVar))
				{
					return true;
				}
			}
			else
			{
				if(!CheckConditionTag(OptionalVar))
				{
					return true;
				}
			}
			
			break;
		case ET_Cutscene_Playing:
			if(!bInvertEventCondition)
			{
				if(PC.bInCutScene())
				{
					return true;
				}
			}
			else
			{
				if(!PC.bInCutScene())
				{
					return true;
				}
			}
			
			break;
		case ET_Movie_Playing:
			if(!bInvertEventCondition)
			{
				if(HP.IsInState('statePlayerInMovie'))
				{
					return true;
				}
			}
			else
			{
				if(!HP.IsInState('statePlayerInMovie'))
				{
					return true;
				}
			}
			
			break;
		case ET_Below_X_Health:
			if(!bInvertEventCondition)
			{
				if(U.GetHealth(HP) < float(OptionalVar))
				{
					return true;
				}
			}
			else
			{
				if(U.GetHealth(HP) >= float(OptionalVar))
				{
					return true;
				}
			}
			
			break;
		case ET_Below_X_Percent_Health:
			ICP = U.GetICP();
			
			if(!bInvertEventCondition)
			{
				if(U.GetHealth(HP) / U.GetMaxHealth(HP) < float(OptionalVar))
				{
					return true;
				}
			}
			else
			{
				if(U.GetHealth(HP) / U.GetMaxHealth(HP) >= float(OptionalVar))
				{
					return true;
				}
			}
			
			break;
		case ET_X_Or_More_Coins:
			ICP = U.GetICP();
			
			if(!bInvertEventCondition)
			{
				if(KWPawn(ICP).GetInventoryCount('Coin') >= int(OptionalVar))
				{
					return true;
				}
			}
			else
			{
				if(KWPawn(ICP).GetInventoryCount('Coin') < int(OptionalVar))
				{
					return true;
				}
			}
			
			break;
		case ET_Fighting_X_Enemies:
			if(!bInvertEventCondition)
			{
				if(SHHeroPawn(HP).numCombatants >= int(OptionalVar))
				{
					return true;
				}
			}
			else
			{
				if(SHHeroPawn(HP).numCombatants < int(OptionalVar))
				{
					return true;
				}
			}
			
			break;
		case ET_Fighting_Boss:
			if(!bInvertEventCondition)
			{
				if(KWPawn(HP).aBoss != none)
				{
					return true;
				}
			}
			else
			{
				if(KWPawn(HP).aBoss == none)
				{
					return true;
				}
			}
			
			break;
		case ET_Within_X_Distance_From_Enemies:
			if(!bInvertEventCondition)
			{
				if(WithinXDistanceOfActor(class'SHEnemy', HP, float(OptionalVar)) || WithinXDistanceOfActor(class'SHEnemyCreature', HP, float(OptionalVar)) || WithinXDistanceOfActor(class'BossPawn', HP, float(OptionalVar)))
				{
					return true;
				}
			}
			else
			{
				if(!WithinXDistanceOfActor(class'SHEnemy', HP, float(OptionalVar)) && !WithinXDistanceOfActor(class'SHEnemyCreature', HP, float(OptionalVar)) && !WithinXDistanceOfActor(class'BossPawn', HP, float(OptionalVar)))
				{
					return true;
				}
			}
			
			break;
		case ET_Within_X_Distance_From_Shamrock:
			if(!bInvertEventCondition)
			{
				if(WithinXDistanceOfActor(class'Shamrock', HP, float(OptionalVar)))
				{
					return true;
				}
			}
			else
			{
				if(!WithinXDistanceOfActor(class'Shamrock', HP, float(OptionalVar)))
				{
					return true;
				}
			}
			
			break;
		case ET_Touching_Class_X_Actor:
			if(!bInvertEventCondition)
			{
				if(TouchingClass(class<Actor>(DynamicLoadObject(OptionalVar, class'Class')), HP))
				{
					return true;
				}
			}
			else
			{
				if(!TouchingClass(class<Actor>(DynamicLoadObject(OptionalVar, class'Class')), HP))
				{
					return true;
				}
			}
			
			break;
		case ET_Elapsed_Level_Time_Higher_Than_X:
			if(!bInvertEventCondition)
			{
				if(Level.TimeSeconds >= float(OptionalVar))
				{
					return true;
				}
			}
			else
			{
				if(Level.TimeSeconds < float(OptionalVar))
				{
					return true;
				}
			}
			
			break;
	}
	
	return false;
}

function bool CheckConditionTag(string S) // Returns true if the provided condition tag <S> is true (enabled)
{
	local TriggeredCondition TC;
	
	foreach DynamicActors(class'TriggeredCondition', TC, U.SName(S))
	{
		if(TC.bEnabled)
		{
			return true;
		}
	}
	
	return false;
}

function bool WithinXDistanceOfActor(class<Actor> C, Pawn P, float F) // Returns true if <P> is within <F> units of an actor with the class <C>
{
	local Actor A;
	
	foreach P.RadiusActors(C, A, F)
	{
		return true;
	}
	
	return false;
}

function bool TouchingClass(class<Actor> C, Pawn P) // Returns true if <P> is touching an actor with the class <C>
{
	local Actor A;
	
	foreach P.TouchingActors(C, A)
	{
		return true;
	}
	
	return false;
}

function FormatMusicEvents(out array<MusicStruct> MS) // Makes all song names in caps
{
	local int i;
	
	for(i = 0; i < MS.Length; i++)
	{
		MS[i].sSong = Caps(MS[i].sSong);
	}
}

function StartMusicEvent(MusicStruct MusicEvent) // Starts a new music event
{
	CurrentMusicEvent = MusicEvent;
	CurrentMusicEvent.bEnabled = true;
	
	if(CurrentMusicEvent.nEventToFire != 'None')
	{
		TriggerEvent(CurrentMusicEvent.nEventToFire, none, none);
	}
	
	bIgnoreMusicEvents = true;
	
	PC.PlayMusic(CurrentMusicEvent.sSong, CurrentMusicEvent.fFadeTime);
	
	SetTimer(CurrentMusicEvent.fLullPeriod, false);
}


defaultproperties
{
	bEnabled=true
	Texture=Texture'MMusicManager'
}