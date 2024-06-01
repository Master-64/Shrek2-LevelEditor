// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MTriggerLight extends Light
	Config(MPak);


var() float ChangeTime, RemainOnTime;
var() bool bInitiallyOn, bDelayFullOn;
var float InitialBrightness, Alpha, direction, poundTime;
var Actor SavedTrigger;


event BeginPlay()
{
	InitialBrightness = LightBrightness;
	
	if(bInitiallyOn)
	{
		Alpha = 1.0;
		direction = 1.0;
	}
	else
	{
		Alpha = 0.0;
		direction = -1.0;
	}
	
	SetDrawType(DT_None);
}

event Tick(float DeltaTime)
{
	Alpha += ((direction * DeltaTime) / ChangeTime);
	
	if(Alpha > 1.0)
	{
		Alpha = 1.0;
		Disable('Tick');
		
		if(SavedTrigger != none)
		{
			SavedTrigger.EndEvent();
		}
	}
	else
	{
		if(Alpha < 0.0)
		{
			Alpha = 0.0;
			Disable('Tick');
			
			if(SavedTrigger != none)
			{
				SavedTrigger.EndEvent();
			}
		}
	}
	
	if(!bDelayFullOn)
	{
		LightBrightness = Alpha * InitialBrightness;
	}
	else
	{
		if(((direction > 0.0) && Alpha != 1.0) || Alpha == 0.0)
		{
			LightBrightness = 0;
		}
		else
		{
			LightBrightness = InitialBrightness;
		}
	}
}

state() TriggerTurnsOn
{
	function Trigger(Actor Other, Pawn EventInstigator)
	{
		if(SavedTrigger != none)
		{
			SavedTrigger.EndEvent();
		}
		
		SavedTrigger = Other;
		SavedTrigger.BeginEvent();
		direction = 1.0;
		Enable('Tick');
	}
}

state() TriggerTurnsOff
{
	function Trigger(Actor Other, Pawn EventInstigator)
	{
		if(SavedTrigger != none)
		{
			SavedTrigger.EndEvent();
		}
		
		SavedTrigger = Other;
		SavedTrigger.BeginEvent();
		direction = -1.0;
		Enable('Tick');
	}
}

state() TriggerToggle
{
	function Trigger(Actor Other, Pawn EventInstigator)
	{
		if(SavedTrigger != none)
		{
			SavedTrigger.EndEvent();
		}
		
		SavedTrigger = Other;
		SavedTrigger.BeginEvent();
		direction *= -1.0;
		Enable('Tick');
	}
}

state() TriggerControl
{
	function Trigger(Actor Other, Pawn EventInstigator)
	{
		if(SavedTrigger != none)
		{
			SavedTrigger.EndEvent();
		}
		
		SavedTrigger = Other;
		SavedTrigger.BeginEvent();
		
		if(bInitiallyOn)
		{
			direction = -1.0;
		}
		else
		{
			direction = 1.0;
		}
		
		Enable('Tick');
	}

	function UnTrigger(Actor Other, Pawn EventInstigator)
	{
		if(SavedTrigger != none)
		{
			SavedTrigger.EndEvent();
		}
		
		SavedTrigger = Other;
		SavedTrigger.BeginEvent();
		
		if(bInitiallyOn)
		{
			direction = 1.0;
		}
		else
		{
			direction = -1.0;
		}
		
		Enable('Tick');
	}
}

state() TriggerPound
{
	event Timer()
	{
		if(poundTime >= RemainOnTime)
		{
			Disable('Timer');
		}
		
		poundTime += ChangeTime;
		direction *= -1.0;
		SetTimer(ChangeTime, false);
	}

	function Trigger(Actor Other, Pawn EventInstigator)
	{
		if(SavedTrigger != none)
		{
			SavedTrigger.EndEvent();
		}
		
		SavedTrigger = Other;
		SavedTrigger.BeginEvent();
		direction = 1.0;
		poundTime = ChangeTime;
		SetTimer(ChangeTime, false);
		Enable('Timer');
		Enable('Tick');
	}
}


defaultproperties
{
	bStatic=false
	bDynamicLight=true
	RemoteRole=ROLE_SimulatedProxy
	InitialState=TriggerToggle
	bMovable=true
	DrawType=DT_Sprite
	bLightingVisibility=true
	bUseDynamicLights=true
	bAcceptsProjectors=true
	bReplicateMovement=true
	Role=ROLE_Authority
	NetUpdateFrequency=100.0
	NetPriority=1.0
	LODBias=1.0
	DrawScale3D=(X=1.0,Y=1.0,Z=1.0)
	MaxLights=4
	ScaleGlow=1.0
	Style=STY_Normal
	SoundRadius=64.0
	SoundVolume=128
	SoundPitch=64
	TransientSoundVolume=0.30
	TransientSoundRadius=300.0
	bBlockZeroExtentTraces=true
	bBlockNonZeroExtentTraces=true
	bJustTeleported=true
	Mass=100.0
	MessageClass=class'LocalMessage'
	Texture=Texture'KWLight'
}