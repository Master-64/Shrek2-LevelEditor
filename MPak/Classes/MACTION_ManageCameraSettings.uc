// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_ManageCameraSettings extends MScriptedAction
	Config(MPak);


struct CamChangesStruct
{
	var() bool bDefaultAllApplications, bApply_rCamRotation, bApply_rCamRotationStep, bApply_fMinPitch, bApply_fMaxPitch, bApply_fMoveTightness, bApply_fMoveBackTightness, bApply_fRotTightness, bApply_fRotSpeed, bApply_fLookAtDistance, bApply_FOVSettings, bApply_vLookAtOffset, bApply_fLookAtOffsetX, bApply_fLookAtOffsetY, bApply_fLookAtOffsetZ, bApply_fLookAtHeight, bApply_fMoveSpeed, bApply_fMaxMouseDeltaX, bApply_fMaxMouseDeltaY, bApply_bGotoLastCameraMode, bApply_bAutoLevelCamera, bApply_bCameraControlsRotation, bApply_fDesiredCamDistFromWall, bApply_fCameraRollModifier, bApply_bDoWorldCollisionCheck;
};

struct RandomizeStruct
{
	var() bool bRand_rCamRotation, bRand_rCamRotationStep, bRand_fMinPitch, bRand_fMaxPitch, bRand_fMoveTightness, bRand_fMoveBackTightness, bRand_fRotTightness, bRand_fRotSpeed, bRand_fLookAtDistance, bRand_vLookAtOffset, bRand_fLookAtOffsetX, bRand_fLookAtOffsetY, bRand_fLookAtOffsetZ, bRand_fLookAtHeight, bRand_fMoveSpeed, bRand_fMaxMouseDeltaX, bRand_fMaxMouseDeltaY, bRand_fDesiredCamDistFromWall, bRand_fCameraRollModifier;
};

struct SetFOVStruct
{
	var() float fFOV, fTime;
	var() KWGame.enumMoveType TransitionType;
};

struct RandRangesStruct
{
	var() MinMaxSStruct Rand_rCamRotation[3], Rand_rCamRotationStep[3], Rand_fMinPitch, Rand_fMaxPitch, Rand_fMoveTightness[3], Rand_fMoveBackTightness, Rand_fRotTightness, Rand_fRotSpeed, Rand_fLookAtDistance, Rand_vLookAtOffset[3], Rand_fLookAtOffsetX, Rand_fLookAtOffsetY, Rand_fLookAtOffsetZ, Rand_fLookAtHeight, Rand_fMoveSpeed, Rand_fMaxMouseDeltaX, Rand_fMaxMouseDeltaY, Rand_fDesiredCamDistFromWall, Rand_fCameraRollModifier;
};

struct AllCamChangesStruct
{
	var() CamChangesStruct CamChangesToApply;
	var() RandomizeStruct CamRands;
	var() RandRangesStruct CamRandRanges;
};

var(Action) AllCamChangesStruct CamChanges;
var(Action) rotator rCamRotation, rCamRotationStep;
var(Action) float fMinPitch, fMaxPitch, fMoveBackTightness, fRotTightness, fRotSpeed, fLookAtDistance, fLookAtOffsetX, fLookAtOffsetY, fLookAtOffsetZ, fLookAtHeight, fMoveSpeed, fMaxMouseDeltaX, fMaxMouseDeltaY, fAutoLevelCameraRotationPitch, fDesiredCamDistFromWall, fCameraRollModifier;
var(Action) vector fMoveTightness, vLookAtOffset;
var(Action) bool bLookAtDistance_NoSmoothTransition, bGotoLastCameraMode, bAutoLevelCamera, bCameraControlsRotation, bDoWorldCollisionCheck;
var(Action) SetFOVStruct FOVSettings;


function bool InitActionFor(ScriptedController C)
{
	local vector TempVector;
	local rotator TempRotator;
	local float f1;
	
	GetUtils(C);
	PC = U.GetPC();
	HP = U.GetHP();
	Cam = U.GetCam();
	
	if(Cam == none)
	{
		Warn(ActionString @ "-- Hero controller's camera could not be found; aborting process");
		
		return false;
	}
	
	if(HP == none)
	{
		Warn(ActionString @ "-- Hero pawn could not be found; aborting process");
		
		return false;
	}
	
	if(CamChanges.CamChangesToApply.bApply_rCamRotation)
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			Cam.SetRot(Rot(0, 0, 0));
		}
		else if(CamChanges.CamRands.bRand_rCamRotation)
		{
			TempRotator = Rot(0, 0, 0);
			TempRotator.Pitch = int(RandRange(float(CamChanges.CamRandRanges.Rand_rCamRotation[0].Min), float(CamChanges.CamRandRanges.Rand_rCamRotation[0].Max)));
			TempRotator.Yaw = int(RandRange(float(CamChanges.CamRandRanges.Rand_rCamRotation[1].Min), float(CamChanges.CamRandRanges.Rand_rCamRotation[1].Max)));
			TempRotator.Roll = int(RandRange(float(CamChanges.CamRandRanges.Rand_rCamRotation[2].Min), float(CamChanges.CamRandRanges.Rand_rCamRotation[2].Max)));
			
			Cam.SetRot(TempRotator);
		}
		else
		{
			Cam.SetRot(rCamRotation);
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_rCamRotationStep)
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			Cam.SetRotStep(Rot(0, 0, 0));
		}
		else if(CamChanges.CamRands.bRand_rCamRotationStep)
		{
			TempRotator = Rot(0, 0, 0);
			TempRotator.Pitch = int(RandRange(float(CamChanges.CamRandRanges.Rand_rCamRotationStep[0].Min), float(CamChanges.CamRandRanges.Rand_rCamRotationStep[0].Max)));
			TempRotator.Yaw = int(RandRange(float(CamChanges.CamRandRanges.Rand_rCamRotationStep[1].Min), float(CamChanges.CamRandRanges.Rand_rCamRotationStep[1].Max)));
			TempRotator.Roll = int(RandRange(float(CamChanges.CamRandRanges.Rand_rCamRotationStep[2].Min), float(CamChanges.CamRandRanges.Rand_rCamRotationStep[2].Max)));
			
			Cam.SetRotStep(TempRotator);
		}
		else
		{
			Cam.SetRotStep(rCamRotationStep);
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_fMinPitch && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).CameraSetStandard.fMinPitch = KWPawn(HP).default.CameraSetStandard.fMinPitch;
			Cam.SetMinPitch(KWPawn(HP).default.CameraSetStandard.fMinPitch);
		}
		else if(CamChanges.CamRands.bRand_fMinPitch)
		{
			f1 = RandRange(float(CamChanges.CamRandRanges.Rand_fMinPitch.Min), float(CamChanges.CamRandRanges.Rand_fMinPitch.Max));
			KWPawn(HP).CameraSetStandard.fMinPitch = f1;
			Cam.SetMinPitch(f1);
		}
		else
		{
			KWPawn(HP).CameraSetStandard.fMinPitch = fMinPitch;
			Cam.SetMinPitch(fMinPitch);
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_fMaxPitch && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).CameraSetStandard.fMaxPitch = KWPawn(HP).default.CameraSetStandard.fMaxPitch;
			Cam.SetMaxPitch(KWPawn(HP).default.CameraSetStandard.fMaxPitch);
		}
		else if(CamChanges.CamRands.bRand_fMaxPitch)
		{
			f1 = RandRange(float(CamChanges.CamRandRanges.Rand_fMaxPitch.Min), float(CamChanges.CamRandRanges.Rand_fMaxPitch.Max));
			KWPawn(HP).CameraSetStandard.fMaxPitch = f1;
			Cam.SetMaxPitch(f1);
		}
		else
		{
			KWPawn(HP).CameraSetStandard.fMaxPitch = fMaxPitch;
			Cam.SetMaxPitch(fMaxPitch);
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_fMoveTightness && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).CameraSetStandard.fMoveTightness = KWPawn(HP).default.CameraSetStandard.fMoveTightness;
			Cam.SetMoveTightness(KWPawn(HP).default.CameraSetStandard.fMoveTightness);
		}
		else if(CamChanges.CamRands.bRand_fMoveTightness)
		{
			TempVector = Vect(0.0, 0.0, 0.0);
			TempVector.X = RandRange(float(CamChanges.CamRandRanges.Rand_fMoveTightness[0].Min), float(CamChanges.CamRandRanges.Rand_fMoveTightness[0].Max));
			TempVector.Y = RandRange(float(CamChanges.CamRandRanges.Rand_fMoveTightness[1].Min), float(CamChanges.CamRandRanges.Rand_fMoveTightness[1].Max));
			TempVector.Z = RandRange(float(CamChanges.CamRandRanges.Rand_fMoveTightness[2].Min), float(CamChanges.CamRandRanges.Rand_fMoveTightness[2].Max));
			
			KWPawn(HP).CameraSetStandard.fMoveTightness = TempVector;
			Cam.SetMoveTightness(TempVector);
		}
		else
		{
			KWPawn(HP).CameraSetStandard.fMoveTightness = fMoveTightness;
			Cam.SetMoveTightness(fMoveTightness);
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_fMoveBackTightness)
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			Cam.SetMoveBackTightness(4.0);
		}
		else if(CamChanges.CamRands.bRand_fMoveBackTightness)
		{
			Cam.SetMoveBackTightness(RandRange(float(CamChanges.CamRandRanges.Rand_fMoveBackTightness.Min), float(CamChanges.CamRandRanges.Rand_fMoveBackTightness.Max)));
		}
		else
		{
			Cam.SetMoveBackTightness(fMoveBackTightness);
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_fRotTightness && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).CameraSetStandard.fRotTightness = KWPawn(HP).default.CameraSetStandard.fRotTightness;
			Cam.SetRotTightness(KWPawn(HP).default.CameraSetStandard.fRotTightness);
		}
		else if(CamChanges.CamRands.bRand_fRotTightness)
		{
			f1 = RandRange(float(CamChanges.CamRandRanges.Rand_fRotTightness.Min), float(CamChanges.CamRandRanges.Rand_fRotTightness.Max));
			KWPawn(HP).CameraSetStandard.fRotTightness = f1;
			Cam.SetRotTightness(f1);
		}
		else
		{
			KWPawn(HP).CameraSetStandard.fRotTightness = fRotTightness;
			Cam.SetRotTightness(fRotTightness);
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_fRotSpeed && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).CameraSetStandard.fRotSpeed = KWPawn(HP).default.CameraSetStandard.fRotSpeed;
			Cam.SetRotSpeed(KWPawn(HP).default.CameraSetStandard.fRotSpeed);
		}
		else if(CamChanges.CamRands.bRand_fRotSpeed)
		{
			f1 = RandRange(float(CamChanges.CamRandRanges.Rand_fRotSpeed.Min), float(CamChanges.CamRandRanges.Rand_fRotSpeed.Max));
			KWPawn(HP).CameraSetStandard.fRotSpeed = f1;
			Cam.SetRotSpeed(f1);
		}
		else
		{
			KWPawn(HP).CameraSetStandard.fRotSpeed = fRotSpeed;
			Cam.SetRotSpeed(fRotSpeed);
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_fLookAtDistance && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).CameraSetStandard.fLookAtDistance = KWPawn(HP).default.CameraSetStandard.fLookAtDistance;
			U.CC("SetCameraDist" @ string(KWPawn(HP).default.CameraSetStandard.fLookAtDistance) @ U.BoolToString(bLookAtDistance_NoSmoothTransition));
		}
		else if(CamChanges.CamRands.bRand_fLookAtDistance)
		{
			f1 = RandRange(float(CamChanges.CamRandRanges.Rand_fLookAtDistance.Min), float(CamChanges.CamRandRanges.Rand_fLookAtDistance.Max));
			KWPawn(HP).CameraSetStandard.fLookAtDistance = f1;
			U.CC("SetCameraDist" @ string(f1) @ U.BoolToString(bLookAtDistance_NoSmoothTransition));
		}
		else
		{
			KWPawn(HP).CameraSetStandard.fLookAtDistance = fLookAtDistance;
			U.CC("SetCameraDist" @ string(fLookAtDistance) @ U.BoolToString(bLookAtDistance_NoSmoothTransition));
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_FOVSettings)
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			Cam.SetFOV(PC.default.DefaultFOV, FOVSettings.fTime, FOVSettings.TransitionType);
		}
		else
		{
			Cam.SetFOV(FOVSettings.fFOV, FOVSettings.fTime, FOVSettings.TransitionType);
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_vLookAtOffset && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).CameraSetStandard.vLookAtOffset = KWPawn(HP).default.CameraSetStandard.vLookAtOffset;
			Cam.SetOffset(KWPawn(HP).default.CameraSetStandard.vLookAtOffset);
		}
		else if(CamChanges.CamRands.bRand_vLookAtOffset)
		{
			TempVector = Vect(0.0, 0.0, 0.0);
			TempVector.X = RandRange(float(CamChanges.CamRandRanges.Rand_vLookAtOffset[0].Min), float(CamChanges.CamRandRanges.Rand_vLookAtOffset[0].Max));
			TempVector.Y = RandRange(float(CamChanges.CamRandRanges.Rand_vLookAtOffset[1].Min), float(CamChanges.CamRandRanges.Rand_vLookAtOffset[1].Max));
			TempVector.Z = RandRange(float(CamChanges.CamRandRanges.Rand_vLookAtOffset[2].Min), float(CamChanges.CamRandRanges.Rand_vLookAtOffset[2].Max));
			
			KWPawn(HP).CameraSetStandard.vLookAtOffset = TempVector;
			Cam.SetOffset(TempVector);
		}
		else
		{
			KWPawn(HP).CameraSetStandard.vLookAtOffset = vLookAtOffset;
			Cam.SetOffset(vLookAtOffset);
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_fLookAtOffsetX && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).CameraSetStandard.vLookAtOffset.X = KWPawn(HP).default.CameraSetStandard.vLookAtOffset.X;
			Cam.SetXOffset(KWPawn(HP).default.CameraSetStandard.vLookAtOffset.X);
		}
		else if(CamChanges.CamRands.bRand_fLookAtOffsetX)
		{
			f1 = RandRange(float(CamChanges.CamRandRanges.Rand_fLookAtOffsetX.Min), float(CamChanges.CamRandRanges.Rand_fLookAtOffsetX.Max));
			KWPawn(HP).CameraSetStandard.vLookAtOffset.X = f1;
			Cam.SetXOffset(f1);
		}
		else
		{
			KWPawn(HP).CameraSetStandard.vLookAtOffset.X = fLookAtOffsetX;
			Cam.SetXOffset(fLookAtOffsetX);
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_fLookAtOffsetY && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).CameraSetStandard.vLookAtOffset.Y = KWPawn(HP).default.CameraSetStandard.vLookAtOffset.Y;
			Cam.SetYOffset(KWPawn(HP).default.CameraSetStandard.vLookAtOffset.Y);
		}
		else if(CamChanges.CamRands.bRand_fLookAtOffsetY)
		{
			f1 = RandRange(float(CamChanges.CamRandRanges.Rand_fLookAtOffsetY.Min), float(CamChanges.CamRandRanges.Rand_fLookAtOffsetY.Max));
			KWPawn(HP).CameraSetStandard.vLookAtOffset.Y = f1;
			Cam.SetYOffset(f1);
		}
		else
		{
			KWPawn(HP).CameraSetStandard.vLookAtOffset.Y = fLookAtOffsetY;
			Cam.SetYOffset(fLookAtOffsetY);
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_fLookAtOffsetZ && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).CameraSetStandard.vLookAtOffset.Z = KWPawn(HP).default.CameraSetStandard.vLookAtOffset.Z;
			Cam.SetZOffset(KWPawn(HP).default.CameraSetStandard.vLookAtOffset.Z);
		}
		else if(CamChanges.CamRands.bRand_fLookAtOffsetZ)
		{
			f1 = RandRange(float(CamChanges.CamRandRanges.Rand_fLookAtOffsetZ.Min), float(CamChanges.CamRandRanges.Rand_fLookAtOffsetZ.Max));
			KWPawn(HP).CameraSetStandard.vLookAtOffset.Z = f1;
			Cam.SetZOffset(f1);
		}
		else
		{
			KWPawn(HP).CameraSetStandard.vLookAtOffset.Z = fLookAtOffsetZ;
			Cam.SetZOffset(fLookAtOffsetZ);
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_fLookAtHeight && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).CameraSetStandard.fLookAtHeight = KWPawn(HP).default.CameraSetStandard.fLookAtHeight;
		}
		else if(CamChanges.CamRands.bRand_fLookAtHeight)
		{
			KWPawn(HP).CameraSetStandard.fLookAtHeight = RandRange(float(CamChanges.CamRandRanges.Rand_fLookAtHeight.Min), float(CamChanges.CamRandRanges.Rand_fLookAtHeight.Max));
		}
		else
		{
			KWPawn(HP).CameraSetStandard.fLookAtHeight = fLookAtHeight;
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_fMoveSpeed && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).CameraSetStandard.fMoveSpeed = KWPawn(HP).default.CameraSetStandard.fMoveSpeed;
		}
		else if(CamChanges.CamRands.bRand_fMoveSpeed)
		{
			KWPawn(HP).CameraSetStandard.fMoveSpeed = RandRange(float(CamChanges.CamRandRanges.Rand_fMoveSpeed.Min), float(CamChanges.CamRandRanges.Rand_fMoveSpeed.Max));
		}
		else
		{
			KWPawn(HP).CameraSetStandard.fMoveSpeed = fMoveSpeed;
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_fMaxMouseDeltaX && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).CameraSetStandard.fMaxMouseDeltaX = KWPawn(HP).default.CameraSetStandard.fMaxMouseDeltaX;
		}
		else if(CamChanges.CamRands.bRand_fMaxMouseDeltaX)
		{
			KWPawn(HP).CameraSetStandard.fMaxMouseDeltaX = RandRange(float(CamChanges.CamRandRanges.Rand_fMaxMouseDeltaX.Min), float(CamChanges.CamRandRanges.Rand_fMaxMouseDeltaX.Max));
		}
		else
		{
			KWPawn(HP).CameraSetStandard.fMaxMouseDeltaX = fMaxMouseDeltaX;
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_fMaxMouseDeltaY && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).CameraSetStandard.fMaxMouseDeltaY = KWPawn(HP).default.CameraSetStandard.fMaxMouseDeltaY;
		}
		else if(CamChanges.CamRands.bRand_fMaxMouseDeltaY)
		{
			KWPawn(HP).CameraSetStandard.fMaxMouseDeltaY = RandRange(float(CamChanges.CamRandRanges.Rand_fMaxMouseDeltaY.Min), float(CamChanges.CamRandRanges.Rand_fMaxMouseDeltaY.Max));
		}
		else
		{
			KWPawn(HP).CameraSetStandard.fMaxMouseDeltaY = fMaxMouseDeltaY;
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_bGotoLastCameraMode && bGotoLastCameraMode)
	{
		Cam.GotoLastCameraMode();
	}
	
	if(CamChanges.CamChangesToApply.bApply_bAutoLevelCamera && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).CameraSnapRotationPitch = KWPawn(HP).default.CameraSnapRotationPitch;
			KWPawn(HP).CameraNoSnapRotation = KWPawn(HP).default.CameraNoSnapRotation;
		}
		else
		{
			KWPawn(HP).CameraSnapRotationPitch = fAutoLevelCameraRotationPitch;
			KWPawn(HP).CameraNoSnapRotation = !bAutoLevelCamera;
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_bCameraControlsRotation && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).bControlsCameraRot = KWPawn(HP).default.bControlsCameraRot;
		}
		else
		{
			KWPawn(HP).bControlsCameraRot = bCameraControlsRotation;
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_fDesiredCamDistFromWall && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).fDesiredCamDistFromWall = KWPawn(HP).default.fDesiredCamDistFromWall;
			Cam.fDesiredCamDistFromWall = KWPawn(HP).default.fDesiredCamDistFromWall;
		}
		else if(CamChanges.CamRands.bRand_fDesiredCamDistFromWall)
		{
			f1 = RandRange(float(CamChanges.CamRandRanges.Rand_fDesiredCamDistFromWall.Min), float(CamChanges.CamRandRanges.Rand_fDesiredCamDistFromWall.Max));
			KWPawn(HP).fDesiredCamDistFromWall = f1;
			Cam.fDesiredCamDistFromWall = f1;
		}
		else
		{
			KWPawn(HP).fDesiredCamDistFromWall = fDesiredCamDistFromWall;
			Cam.fDesiredCamDistFromWall = fDesiredCamDistFromWall;
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_fCameraRollModifier && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).fCameraRollModifier = KWPawn(HP).default.fCameraRollModifier;
			Cam.fCameraRollModifier = KWPawn(HP).default.fCameraRollModifier;
		}
		else if(CamChanges.CamRands.bRand_fCameraRollModifier)
		{
			f1 = RandRange(float(CamChanges.CamRandRanges.Rand_fCameraRollModifier.Min), float(CamChanges.CamRandRanges.Rand_fCameraRollModifier.Max));
			KWPawn(HP).fCameraRollModifier = f1;
			Cam.fCameraRollModifier = f1;
		}
		else
		{
			KWPawn(HP).fCameraRollModifier = fCameraRollModifier;
			Cam.fCameraRollModifier = fCameraRollModifier;
		}
	}
	
	if(CamChanges.CamChangesToApply.bApply_bDoWorldCollisionCheck && HP.IsA('KWPawn'))
	{
		if(CamChanges.CamChangesToApply.bDefaultAllApplications)
		{
			KWPawn(HP).bDoWorldCollisionCheck = KWPawn(HP).default.bDoWorldCollisionCheck;
			Cam.bDoWorldCollisionCheck = KWPawn(HP).default.bDoWorldCollisionCheck;
		}
		else
		{
			KWPawn(HP).bDoWorldCollisionCheck = bDoWorldCollisionCheck;
			Cam.bDoWorldCollisionCheck = bDoWorldCollisionCheck;
		}
	}
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Applying" @ string(int(CamChanges.CamChangesToApply.bApply_rCamRotation) + int(CamChanges.CamChangesToApply.bApply_rCamRotationStep) + int(CamChanges.CamChangesToApply.bApply_fMinPitch) + int(CamChanges.CamChangesToApply.bApply_fMaxPitch) + int(CamChanges.CamChangesToApply.bApply_fMoveTightness) + int(CamChanges.CamChangesToApply.bApply_fMoveBackTightness) + int(CamChanges.CamChangesToApply.bApply_fRotTightness) + int(CamChanges.CamChangesToApply.bApply_fRotSpeed) + int(CamChanges.CamChangesToApply.bApply_fLookAtDistance) + int(CamChanges.CamChangesToApply.bApply_FOVSettings) + int(CamChanges.CamChangesToApply.bApply_vLookAtOffset) + int(CamChanges.CamChangesToApply.bApply_fLookAtOffsetX) + int(CamChanges.CamChangesToApply.bApply_fLookAtOffsetY) + int(CamChanges.CamChangesToApply.bApply_fLookAtOffsetZ) + int(CamChanges.CamChangesToApply.bApply_fLookAtHeight) + int(CamChanges.CamChangesToApply.bApply_fMoveSpeed) + int(CamChanges.CamChangesToApply.bApply_fMaxMouseDeltaX) + int(CamChanges.CamChangesToApply.bApply_fMaxMouseDeltaY) + int(CamChanges.CamChangesToApply.bApply_bGotoLastCameraMode) + int(CamChanges.CamChangesToApply.bApply_bAutoLevelCamera) + int(CamChanges.CamChangesToApply.bApply_bCameraControlsRotation) + int(CamChanges.CamChangesToApply.bApply_fDesiredCamDistFromWall) + int(CamChanges.CamChangesToApply.bApply_fCameraRollModifier) + int(CamChanges.CamChangesToApply.bApply_bDoWorldCollisionCheck)) @ "camera changes";
}


defaultproperties
{
	ActionString="Manage Camera Settings"
	fMinPitch=-10000.0
	fMaxPitch=10000.0
	fMoveTightness=(X=25.0,Y=40.0,Z=40.0)
	fMoveBackTightness=4.0
	fRotTightness=8.0
	fRotSpeed=8.0
	fLookAtDistance=170.0
	FOVSettings=(fFOV=85.0,fTime=1.0,TransitionType=MOVE_TYPE_EASE_FROM_AND_TO)
	vLookAtOffset=(X=-25.0,Y=0.0,Z=65.0)
	fLookAtOffsetX=-25.0
	fLookAtOffsetY=0.0
	fLookAtOffsetZ=65.0
	fLookAtHeight=50.0
	fMoveSpeed=0.0
	fMaxMouseDeltaX=190.0
	fMaxMouseDeltaY=65.0
	bGotoLastCameraMode=true
	bAutoLevelCamera=true
	fAutoLevelCameraRotationPitch=-3500.0
	bCameraControlsRotation=true
	fDesiredCamDistFromWall=15.0
	fCameraRollModifier=1.0
	bDoWorldCollisionCheck=true
}