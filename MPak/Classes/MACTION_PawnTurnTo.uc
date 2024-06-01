// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_PawnTurnTo extends MLatentScriptedAction
	Config(MPak);


var(Action) class<Actor> ActorClass, DestinationActorClass;
var(Action) name ActorTag, DestinationTag;
var(Action) bool bUseTime, bInstant;
var(Action) float fTurnDuration, fRateMag;
var Actor aActor, aDestinationActor;
var rotator rSavedRotSpeed;
var string sSavedRotAccel;
var Actor.EPhysics SavedPhysics;
var float fTimeSoFar;


function bool InitActionFor(ScriptedController C)
{
	local array<string> TokenArray;
	local array<int> RAs;
	local string sTemp;
	
	GetUtils(C);
	HP = U.GetHP();
	
	if(bNonBlocking)
	{
		bInstant = true;
	}
	
	if(ActorClass == none)
	{
		Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
		
		return false;
	}
	
	foreach C.DynamicActors(ActorClass, aActor, ActorTag)
	{
		break;
	}
	
	if(aActor == none)
	{
		Warn(ActionString @ "-- Failed to find the pawn for turning; aborting process");
		
		return false;
	}
	
	rSavedRotSpeed = aActor.RotationRate;
	sSavedRotAccel = aActor.GetPropertyText("RotationalAcceleration");
	SavedPhysics = aActor.Physics;
	
	if(DestinationTag == 'CurrentPlayer')
	{
		aDestinationActor = HP;
	}
	else
	{
		if(DestinationActorClass == none)
		{
			Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
			
			return false;
		}
		
		foreach C.AllActors(DestinationActorClass, aDestinationActor, DestinationTag)
		{
			break;
		}
	}
	
	if(aDestinationActor == none)
	{
		Warn(ActionString @ "-- Failed to find the pawn for the turn destination; aborting process");
		
		return false;
	}
	
	if(fRateMag > 0.0)
	{
		// Crazy hack I made that allows multiplying the value of <RotationalAcceleration>, which is a variable not natively available
		TokenArray = U.Split(sSavedRotAccel, ",");
		
		sTemp = Right(TokenArray[2], Len(TokenArray[2]) - 5);
		
		RAs[0] = int(Right(TokenArray[0], Len(TokenArray[0]) - 7));
		RAs[1] = int(Right(TokenArray[1], Len(TokenArray[1]) - 4));
		RAs[2] = int(Left(sTemp, Len(sTemp) - 1));
		
		RAs[0] *= fRateMag;
		RAs[1] *= fRateMag;
		RAs[2] *= fRateMag;
		
		aActor.SetPropertyText("RotationalAcceleration", "(Pitch=" $ string(RAs[0]) $ ",Yaw=" $ string(RAs[1]) $ ",Roll=" $ string(RAs[1]) $ ")");
		aActor.RotationRate *= fRateMag;
	}
	
	if(bInstant || HP == aActor)
	{
		FinishRotation(C, true);
		
		return false;
	}
	
	aActor.SetPhysics(PHYS_Rotating);
	
	C.CurrentAction = self;
	
	return true;
}

function bool TickedAction()
{
	return !bInstant;
}

function bool StillTicking(ScriptedController C, float DeltaTime)
{
	if(!bUseTime)
	{
		UntimedRotation(C, DeltaTime);
	}
	else
	{
		TimedRotation(C, DeltaTime);
	}
	
	return true;
}

function UntimedRotation(ScriptedController C, float DeltaTime) // The logic that should be used every tick for an untimed rotation
{
	if(U.RotationDiff(rotator(aDestinationActor.Location - aActor.Location), aActor.Rotation).Yaw == 0)
	{
		FinishRotation(C);
	}
}

function TimedRotation(ScriptedController C, float DeltaTime) // The logic that should be used every tick for a timed rotation
{
	local rotator rDiff;
	local float fRate;
	
	fTimeSoFar += DeltaTime;
	
	fRate = FClamp(fTurnDuration - fTimeSoFar, 0.0, fTurnDuration);
	rDiff = U.RotationDiff(rotator(aDestinationActor.Location - aActor.Location), aActor.Rotation);
	
	aActor.RotationRate = rDiff / fRate;
	
	if(rDiff.Yaw == 0 || fTimeSoFar >= fTurnDuration)
	{
		fTimeSoFar = 0.0;
		
		FinishRotation(C);
	}
}

function FinishRotation(ScriptedController C, optional bool B) // Finalizes the rotation of the actor
{
	aActor.RotationRate = rSavedRotSpeed;
	aActor.SetPropertyText("RotationalAcceleration", sSavedRotAccel);
	aActor.SetPhysics(SavedPhysics);
	U.FancySetRotation(aActor, rotator(U.Vector2D(aDestinationActor.Location - aActor.Location)));
	
	if(!B)
	{
		ForceFinishAction(C);
	}
}

function string GetActionString()
{
	return ActionString @ "-- Turning pawn" @ string(ActorTag) @ "to point" @ string(DestinationTag);
}


defaultproperties
{
	ActorClass=class'Actor'
	DestinationActorClass=class'Actor'
	fRateMag=0.5
	fTurnDuration=2.0
	ActionString="Pawn Turn To"
}