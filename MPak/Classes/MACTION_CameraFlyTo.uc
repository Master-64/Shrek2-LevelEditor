// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_CameraFlyTo extends MLatentScriptedAction
	Config(MPak);


enum ECameraAction
{
	CA_FlyTo,
	CA_TargetFlyTo,
	CA_Both
};

var(Action) MACTION_CameraFlyTo.ECameraAction CameraAction;
var(Action) class<Actor> FlyToActorClass, TargetFlyToActorClass, SplineActorClass[2];
var(Action) name FlyToTag, TargetFlyToTag, SplinePointTag[2];
var(Action) KWGame.enumMoveType MoveType[2];
var(Action) float fMoveTime[2], fSpeedFactor[2], fHoldTime, fGoHomeTime;
var(Action) vector vDestOffset[2];
var(Action) rotator rRotStep[2];
var(Action) int bTurnWithChar[2], bRelativeToChar[2], bStayLockedToActor[2], bCalcTimeFromSpeed[2];
var(Action) bool bDisablePlayerMovement, bToggleCinematicBars;
var name nOldPCState;
var KWPawn.CamSettings CamSet;
var AIController AIC;


function bool InitActionFor(ScriptedController C)
{
	local int i;
	local Actor TargetActor[2], SplinePointActor[2];
	local vector vSplinePoint[2];
	
	if(fMoveTime[0] + fMoveTime[1] <= 0.0 && fHoldTime <= 0.0)
	{
		return false;
	}
	
	GetUtils(C);
	PC = U.GetPC();
	Cam = U.GetCam();
	HUD = U.GetHUD();
	HP = U.GetHP();
	
	switch(CameraAction)
	{
		case CA_Both:
		case CA_FlyTo:
			if(FlyToTag == 'CurrentPlayer')
			{
				TargetActor[0] = KWPawn(HP);
			}
			else
			{
				if(FlyToActorClass == none)
				{
					Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
					
					return false;
				}
				
				foreach C.AllActors(FlyToActorClass, TargetActor[0], FlyToTag)
				{
					break;
				}
			}
			
			if(TargetActor[0] == none)
			{
				Warn(ActionString @ "-- No point found to fly the camera to; aborting process");
				
				return false;
			}
			
			if(CameraAction != CA_Both)
			{
				break;
			}
		case CA_TargetFlyTo:
			if(TargetFlyToTag == 'CurrentPlayer')
			{
				TargetActor[1] = KWPawn(HP);
			}
			else
			{
				if(TargetFlyToActorClass == none)
				{
					Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
					
					return false;
				}
				
				foreach C.AllActors(TargetFlyToActorClass, TargetActor[1], TargetFlyToTag)
				{
					break;
				}
			}
			
			if(TargetActor[1] == none)
			{
				Warn(ActionString @ "-- No point found to target fly the camera to; aborting process");
				
				return false;
			}
			
			break;
	}
	
	CamSet = Cam.CurrentSet;
	
	Cam.PreCutPossess();
	Cam.PostCutPossess();
	
	if(bDisablePlayerMovement)
	{
		nOldPCState = PC.GetStateName();
		PC.GotoState('StateNoPawnMoveCanTurn');
		PC.bShouldRotate = false;
	}
	
	if(bToggleCinematicBars)
	{
		HUD.StartCutScene();
	}
	
	for(i = 0; i < 2; i++)
	{
		if(SplinePointTag[i] != 'None')
		{
			foreach C.AllActors(SplineActorClass[i], SplinePointActor[i], SplinePointTag[i])
			{
				break;
			}
			
			if(SplinePointActor[i] != none)
			{
				vSplinePoint[i] = SplinePointActor[i].Location;
			}
		}
		
		if(bool(bCalcTimeFromSpeed[i]))
		{
			fMoveTime[i] = VSize(TargetActor[i].Location - Cam.Location) / fSpeedFactor[i];
		}
		
		if(fMoveTime[i] == 0.0)
		{
			MoveType[i] = MOVE_SNAP;
		}
	}
	
	switch(CameraAction)
	{
		case CA_Both:
		case CA_FlyTo:
			Cam.DoFlyTo_Actor(TargetActor[0], vDestOffset[0], MoveType[0], fMoveTime[0], bool(bTurnWithChar[0]), bool(bRelativeToChar[0]), bool(bStayLockedToActor[0]), 'None', vSplinePoint[0], rRotStep[0]);
			
			if(CameraAction != CA_Both)
			{
				break;
			}
		case CA_TargetFlyTo:
			if(AIC == none)
			{
				AIC = C.Spawn(class'AIController');
			}
			
			AIC.Possess(Cam);
			AIC.Focus = Cam.CamTarget;
			Cam.CamTarget.DoFlyTo_Actor(TargetActor[1], vDestOffset[1], MoveType[1], fMoveTime[1], bool(bTurnWithChar[1]), bool(bRelativeToChar[1]), bool(bStayLockedToActor[1]), 'None', vSplinePoint[1], rRotStep[1]);
			
			break;
	}
	
	IfNonBlocking(C);
	
	C.CurrentAction = self;
	C.SetTimer(FMax(fMoveTime[0], fMoveTime[1]) + fHoldTime, false);
	
	return true;
}

function bool CompleteWhenTimer()
{
	ResetCamera();
	
	return true;
}

function ResetCamera() // Resets the camera settings so that it goes back to the player
{
	Cam.PostCutUnPossess();
	Cam.GotoLastCameraMode();
	Cam.CurrentSet = CamSet;
	Cam.InitTarget(HP, fGoHomeTime);
	
	if(fGoHomeTime <= 0.0)
	{
		Cam.DestroyDelegates();
	}
	
	if(CameraAction != CA_FlyTo)
	{
		Cam.CamTarget.DestroyDelegates();
		AIC.UnPossess();
		AIC.Destroy();
		AIC = none; // This line prevents a crash with Destroy() above where saving would crash the entire game
	}
	
	if(bDisablePlayerMovement)
	{
		PC.GotoState(nOldPCState);
		PC.bShouldRotate = true;
	}
	
	if(bToggleCinematicBars)
	{
		HUD.EndCutScene();
	}
}

function string GetActionString()
{
	switch(CameraAction)
	{
		case CA_FlyTo:
			return ActionString @ "-- Flying camera to point" @ string(FlyToTag);
			
			break;
		case CA_TargetFlyTo:
			return ActionString @ "-- Target flying camera to point" @ string(TargetFlyToTag);
			
			break;
		case CA_Both:
			return ActionString @ "-- Flying camera to point" @ string(FlyToTag) @ "and target flying camera to point" @ string(TargetFlyToTag);
			
			break;
	}
}

defaultproperties
{
	FlyToActorClass=class'Actor'
	TargetFlyToActorClass=class'Actor'
	SplineActorClass[0]=class'Actor'
	SplineActorClass[1]=class'Actor'
	fGoHomeTime=1.0
	bTurnWithChar[0]=1
	bTurnWithChar[1]=1
	bRelativeToChar[0]=1
	bRelativeToChar[1]=1
	bStayLockedToActor[0]=1
	bStayLockedToActor[1]=1
	fSpeedFactor[0]=1.0
	fSpeedFactor[1]=1.0
	MoveType[0]=MOVE_TYPE_EASE_FROM_AND_TO
	MoveType[1]=MOVE_TYPE_EASE_FROM_AND_TO
	bDisablePlayerMovement=true
	ActionString="Camera Fly To"
}