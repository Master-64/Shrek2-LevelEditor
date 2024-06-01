// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_FadeActor extends MScriptedAction
	Config(MPak);


struct FadeActorStruct
{
	var() class<Actor> ActorClass;
	var() name ActorTag;
	var() Color ActorColor;
	var() float fFadeTime;
	var() KWGame.enumMoveType FadeType;
	var() bool bDestroyOnFadeEnd;
	var() bool bRandomizeColor;
};

var(Action) array<FadeActorStruct> FadeActorActions;


function bool InitActionFor(ScriptedController C)
{
	local FadeActorDelegate Fader;
	local Actor TargetActor;
	local Color TempColor;
	local int i;
	
	GetUtils(C);
	HP = U.GetHP();
	
	for(i = 0; i < FadeActorActions.Length; i++)
	{
		if(FadeActorActions[i].ActorTag == 'CurrentPlayer')
		{
			TargetActor = HP;
		}
		else
		{
			if(FadeActorActions[i].ActorClass == none)
			{
				Warn(ActionString @ "-- An actor class assignment is missing; skipping action" @ string(i));
				
				continue;
			}
			
			foreach C.AllActors(FadeActorActions[i].ActorClass, TargetActor, FadeActorActions[i].ActorTag)
			{
				break;
			}
		}
		
		if(TargetActor == none)
		{
			Warn(ActionString @ "-- Failed to find an actor to fade; skipping action" @ string(i));
			
			continue;
		}
		
		if(FadeActorActions[i].bRandomizeColor)
		{
			TempColor.R = Rand(256);
			TempColor.G = Rand(256);
			TempColor.B = Rand(256);
			TempColor.A = FadeActorActions[i].ActorColor.A;
		}
		else
		{
			TempColor = FadeActorActions[i].ActorColor;
		}
		
		Fader = C.Spawn(class'FadeActorDelegate');
		Fader.Init(TargetActor, TempColor.A, TempColor.R, TempColor.G, TempColor.B, FadeActorActions[i].fFadeTime, FadeActorActions[i].FadeType, FadeActorActions[i].bDestroyOnFadeEnd);
	}
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Fading" @ string(FadeActorActions.Length) @ "actors";
}


defaultproperties
{
	ActionString="Fade Actor"
}