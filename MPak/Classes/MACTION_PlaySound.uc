// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_PlaySound extends MScriptedAction
	Config(MPak);


struct GetPropStruct
{
	var() class<Actor> GetActorClass;
	var() name GetActorTag;
};

struct LocalizeSoundVarsStruct
{
	var() float fRadius, fPitch;
};

var(Action) array<Sound> Sounds;
var(Action) array<GetPropStruct> Actors;
var(Action) float fVolume;
var(Action) LocalizeSoundVarsStruct LocalizeSoundVars;
var(Action) bool bPickRandom, bPlaySound3D, bMoveMouth;


function bool InitActionFor(ScriptedController C)
{
	GetUtils(C);
	PC = U.GetPC();
	HP = U.GetHP();
	
	if(!bPickRandom)
	{
		PlaySound(C, 0);
	}
	else
	{
		PlaySound(C, Rand(Sounds.Length));
	}
	
	return false;
}

function PlaySound(ScriptedController C, int Index) // Plays a 2D or a 3D sound with a configurable volume
{
	local Actor TargetActor;
	local int i;
	
	if(HP == none)
	{
		Warn(ActionString @ "-- Hero pawn could not be found; sound may play in an unintentional way");
	}
	
	if(!bPlaySound3D)
	{
		U.PlayASound(, Sounds[Index], fVolume, bMoveMouth);
	}
	else
	{
		for(i = 0; i < Actors.Length; i++)
		{
			if(Actors[i].GetActorTag == 'CurrentPlayer')
			{
				TargetActor = HP;
			}
			else
			{
				if(Actors[i].GetActorClass == none)
				{
					Warn(ActionString @ "-- An actor class assignment is missing; skipping action" @ string(i));
					
					continue;
				}
				
				foreach C.DynamicActors(Actors[i].GetActorClass, TargetActor, Actors[i].GetActorTag)
				{
					break;
				}
			}
			
			if(TargetActor == none)
			{
				Warn(ActionString @ "-- Failed to find actor to play sound from; skipping action" @ string(i));
				
				continue;
			}
			
			U.PlayASound3D(TargetActor,, Sounds[Index], fVolume, LocalizeSoundVars.fRadius, LocalizeSoundVars.fPitch, bMoveMouth);
		}
	}
}

function string GetActionString()
{
	if(!bPickRandom)
	{
		return ActionString @ "-- Playing sound" @ string(Sounds[0]);
	}
	else
	{
		return ActionString @ "-- Playing a random sound";
	}
}


defaultproperties
{
	fVolume=0.9
	LocalizeSoundVars=(fRadius=8192.0,fPitch=1.0)
	ActionString="Play Sound"
}