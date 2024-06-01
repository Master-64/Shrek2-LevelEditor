// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MTriggerVolume extends MVolume
	HideCategories(Events)
	Config(MPak);


struct TriggerStruct
{
	var() Trigger.ETriggerType TriggerType;
	var() localized string Message;
	var() bool bTriggerOnceOnly, bInitiallyActive, bTT_CP_EventMustMatchTag, bActivateOnUntouchInsteadOfTouch, bTriggerByDirection;
	var() class<Actor> ClassProximityType;
	var() float RepeatTriggerTime, ReTriggerDelay, DamageThreshold;
	var() KWTrigger.ETellOtherTrigger TellOtherTrigger;
};

struct EventsStruct
{
	var() name Event, Tag;
	var() bool bOneAtATime, bLoop;
	var() int NextEventIndex;
};

struct SettingsStruct
{
	var() EventsStruct Events;
	var() TriggerStruct Trigger;
};

var() SettingsStruct TriggerSettings;
var() name nGroupName, nTriggerOnlyTag;
var() bool bOnlyTriggerIfHasTag, bDisableDuringCutscenes;
var KWTrigger T;
var array<MTriggerVolume> TVs;
var bool bDisabled, bActive, bFreeze;


event PostBeginPlay()
{
	local int i;
	local MTriggerVolume TV;
	
	super.PostBeginPlay();
	
	Tag = Name;
	
	foreach DynamicActors(class'MTriggerVolume', TV)
	{
		if(nGroupName != 'None' && TV.nGroupName == nGroupName)
		{
			TVs.Insert(TVs.Length, 1);
			TVs[TVs.Length - 1] = TV;
		}
	}
	
	if(TVs.Length > 0)
	{
		for(i = 0; i < TVs.Length; i++)
		{
			if(TVs[i].T != none)
			{
				T = TVs[i].T;
				TriggerSettings = TVs[i].TriggerSettings;
				bOnlyTriggerIfHasTag = TVs[i].bOnlyTriggerIfHasTag;
				nTriggerOnlyTag = TVs[i].nTriggerOnlyTag;
				bDisableDuringCutscenes = TVs[i].bDisableDuringCutscenes;
				GotoState(TVs[i].GetStateName());
				
				break;
			}
		}
	}
	else
	{
		TVs.Insert(TVs.Length, 1);
		TVs[TVs.Length - 1] = self;
	}
	
	if(T == none && TriggerSettings != default.TriggerSettings)
	{
		T = Spawn(class'KWTrigger');
		T.SetCollision(false, false, false);
		U.FancySetRotation(T, Rotation);
		
		T.Event = TriggerSettings.Events.Event;
		
		if(TriggerSettings.Events.Tag != 'None')
		{
			T.Tag = TriggerSettings.Events.Tag;
		}
		
		T.SetPropertyText("bOneAtATime", U.BoolToString(TriggerSettings.Events.bOneAtATime));
		T.SetPropertyText("bLoop", U.BoolToString(TriggerSettings.Events.bLoop));
		T.SetPropertyText("NextEventIndex", string(TriggerSettings.Events.NextEventIndex));
		T.TriggerType = TriggerSettings.Trigger.TriggerType;
		T.Message = TriggerSettings.Trigger.Message;
		T.bTriggerOnceOnly = TriggerSettings.Trigger.bTriggerOnceOnly;
		T.bInitiallyActive = TriggerSettings.Trigger.bInitiallyActive;
		T.ClassProximityType = TriggerSettings.Trigger.ClassProximityType;
		T.RepeatTriggerTime = TriggerSettings.Trigger.RepeatTriggerTime;
		T.ReTriggerDelay = TriggerSettings.Trigger.ReTriggerDelay;
		T.DamageThreshold = TriggerSettings.Trigger.DamageThreshold;
		T.SetPropertyText("bTT_CP_EventMustMatchTag", U.BoolToString(TriggerSettings.Trigger.bTT_CP_EventMustMatchTag));
		T.SetPropertyText("bActivateOnUntouchInsteadOfTouch", U.BoolToString(TriggerSettings.Trigger.bActivateOnUntouchInsteadOfTouch));
		T.SetPropertyText("bTriggerByDirection", U.BoolToString(TriggerSettings.Trigger.bTriggerByDirection));
		T.SetPropertyText("TellOtherTrigger", string(TriggerSettings.Trigger.TellOtherTrigger));
	}
	
	if(T == none)
	{
		SetCollision(false, false, false);
		bDisabled = true;
	}
}

event PostLoadGame(bool bLoadFromSaveGame)
{
	if(!bLoadFromSaveGame)
	{
		PC = U.GetPC();
	}
}

event Touch(Actor Other)
{
	if(!bActive || bDisabled || (PC.bInCutScene() && bDisableDuringCutscenes))
	{
		return;
	}
	
	if(IsActorValidForTouch(Other))
	{
		T.Touch(Other);
		
		LinkVolumeDisabledState(true);
	}
}

event UnTouch(Actor Other)
{
	if(!bActive)
	{
		return;
	}
	
	if(IsActorValidForTouch(Other) && !IsActorIntersectingOtherTriggerVolume(Other))
	{
		T.UnTouch(Other);
		
		LinkVolumeDisabledState(false);
	}
}

function bool IsActorIntersectingOtherTriggerVolume(Actor Other) // Returns with true if the actor <Other> is intersecting another trigger volume
{
	local MTriggerVolume TV;
	
	foreach Other.TouchingActors(class'MTriggerVolume', TV) 
	{
		if(TV.TriggerSettings.Events.Event == TriggerSettings.Events.Event)
		{
			return true;
		}
	}
	
	return false;
}

function LinkVolumeDisabledState(bool B) // Tells every linked volume to have <bDisabled> to equal <B>
{
	local int i;
	
	for(i = 0; i < TVs.Length; i++)
	{
		TVs[i].bDisabled = B;
	}
}

function LinkVolumeActiveState(bool B) // Tells every linked volume to have <bActive> to equal <B>
{
	local int i;
	
	for(i = 0; i < TVs.Length; i++)
	{
		TVs[i].bActive = B;
	}
}

function LinkVolumeFreeze(float F) // Temporarily freezes all linked volumes for a set amount of time
{
	local int i;
	
	for(i = 0; i < TVs.Length; i++)
	{
		TVs[i].FreezeFor(F);
	}
}

function bool IsActorValidForTouch(Actor A) // Returns true if an actor is valid for touch
{
	if(!bOnlyTriggerIfHasTag)
	{
		if(KWHeroController(Pawn(A).Controller) == PC || Pawn(A) == U.GetHP())
		{
			return true;
		}
	}
	else if(A.Tag == nTriggerOnlyTag)
	{
		return true;
	}
	
	return false;
}

function FreezeFor(float F) // Disables the volume for <F> seconds
{
	bFreeze = true;
	
	SetTimer(F, false);
}

event Timer()
{
	bFreeze = false;
}

state() NormalTrigger{}

state() OtherTriggerToggles
{
	event Trigger(Actor Other, Pawn EventInstigator)
	{
		if(bFreeze)
		{
			return;
		}
		
		LinkVolumeActiveState(!bActive);
		LinkVolumeFreeze(0.01);
	}
}

state() OtherTriggerTurnsOn
{
	event BeginState()
	{
		LinkVolumeActiveState(false);
		LinkVolumeFreeze(0.01);
	}
	
	event Trigger(Actor Other, Pawn EventInstigator)
	{
		if(bFreeze)
		{
			return;
		}
		
		LinkVolumeActiveState(true);
		LinkVolumeFreeze(0.01);
	}
}

state() OtherTriggerTurnsOff
{
	event Trigger(Actor Other, Pawn EventInstigator)
	{
		if(bFreeze)
		{
			return;
		}
		
		LinkVolumeActiveState(false);
		LinkVolumeFreeze(0.01);
	}
}


defaultproperties
{
	TriggerSettings=(Trigger=(bInitiallyActive=true,ReTriggerDelay=0.01))
	bDisableDuringCutscenes=true
	InitialState=NormalTrigger
	bActive=true
}