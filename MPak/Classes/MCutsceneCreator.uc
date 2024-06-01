// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCutsceneCreator extends MInfo
	Config(MPak);


enum ECSPropertyType
{
	PT_NoBypass,
	PT_Debug,
	PT_SaveBookmark
};

enum EOnExitType
{
	OET_SaveGame,
	OET_ChangeLevel,
	OET_Follow,
	OET_StopFollowing,
	OET_WaitInCorral,
	OET_SwitchControlToMe,
	OET_OnEvent,
	OET_GoHome,
	OET_FightWithLeadChar,
	OET_Trigger,
	OET_TriggerActor,
	OET_LeadActor,
	OET_CompanionStates
};

struct CSOnExitStruct
{
	var() name PawnTag;
	var() MCutsceneCreator.EOnExitType OnExitType;
	var() array<name> OptionalTagOrEvent;
};

struct CSSequenceStruct
{
	var() name PawnTag;
	var() export editinline array<export editinline MCSAction> Actions;
};

struct CSStruct
{
	var() name CutsceneName;
	var() array<MCutsceneCreator.ECSPropertyType> PropertyTypesToUse;
	var() array<CSSequenceStruct> Sequences;
	var() array<CSOnExitStruct> OnExit;
};

var() array<CSStruct> CCActions;
var array<MInfo> MIs;


event PostBeginPlay()
{
	local Actor TargetActor;
	local MCutsceneCreator CC;
	local CutFactory CF;
	local int i;
	
	super.PostBeginPlay();
	
	U = GetUtils();
	
	ManufactureCutScriptFiles();
	
	// This essentially scans the entire map to see if anything is going to fire an event to any cutscene
	// If it is, then we need to delete the MInfo we made for it, because if we don't do that, duplicate cutscenes will be created that are tied to the same actor
	// The reason I create a MInfo in the first place is so that the CutFactory reads the CutScript file in the first place
	foreach AllActors(class'Actor', TargetActor)
	{
		for(i = 0; i < CCActions.Length; i++)
		{
			if(TargetActor.Event == CCActions[i].CutsceneName || (Right(string(TargetActor.Event), Len(string(CCActions[i].CutsceneName))) == string(CCActions[i].CutsceneName) && Left(Caps(string(TargetActor.Event)), 4) == "CUT_" && Mid(Caps(string(TargetActor.Event)), 4) != "_"))
			{
				TargetActor.Event = U.MergeNames('CUT__', CCActions[i].CutsceneName);
				
				if(MIs[i] != none && !TargetActor.IsA('MInfo'))
				{
					MIs[i].Destroy();
				}
			}
			
			if(TargetActor.IsA('CutSceneTrigger'))
			{
				if(CutSceneTrigger(TargetActor).AlternateEvent == CCActions[i].CutsceneName || (Right(string(CutSceneTrigger(TargetActor).AlternateEvent), Len(string(CCActions[i].CutsceneName))) == string(CCActions[i].CutsceneName) && Left(Caps(string(CutSceneTrigger(TargetActor).AlternateEvent)), 4) == "CUT_" && Mid(Caps(string(CutSceneTrigger(TargetActor).AlternateEvent)), 4) != "_"))
				{
					CutSceneTrigger(TargetActor).AlternateEvent = U.MergeNames('CUT__', CCActions[i].CutsceneName);
					
					if(MIs[i] != none && !TargetActor.IsA('MInfo'))
					{
						MIs[i].Destroy();
					}
					
					break;
				}
			}
		}
	}
	
	i = 0;
	
	foreach DynamicActors(class'MCutsceneCreator', CC)
	{
		i++;
		
		if(i > 1)
		{
			Warn("MCutsceneCreator -- Deleting a duplicate MCutsceneCreator");
			
			Destroy();
			
			return;
		}
	}
	
	foreach DynamicActors(class'CutFactory', CF)
	{
		break;
	}
	
	if(CF == none)
	{
		Spawn(class'CutFactory');
	}
	
	Log(class'MVersion'.default.ModName @ class'MVersion'.default.Version @ "-- This level is running Master's Cutscene Creator, made by Master_64");
}

function ManufactureCutScriptFiles() // Creates all CutScript files in real-time
{
	local int i1, i2, i3, i4;
	local string S;
	local array<string> Script;
	
	for(i1 = 0; i1 < CCActions.Length; i1++)
	{
		Script.Remove(0, Script.Length);
		
		for(i2 = 0; i2 < CCActions[i1].PropertyTypesToUse.Length; i2++)
		{
			if(i2 == 0)
			{
				InsertLine(Script, "[CutScene]", -1);
			}
			
			switch(CCActions[i1].PropertyTypesToUse[i2])
			{
				case PT_NoBypass:
					InsertLine(Script, "NoBypass", i2);
					
					break;
				case PT_Debug:
					InsertLine(Script, "Debug", i2);
					
					break;
				case PT_SaveBookmark:
					InsertLine(Script, "SaveBookmark", i2);
					
					break;
			}
		}
		
		for(i2 = 0; i2 < CCActions[i1].Sequences.Length; i2++)
		{
			InsertLine(Script, "[Sequence_" $ i2 $ "]", -1);
			InsertLine(Script, "PawnTag=" $ string(CCActions[i1].Sequences[i2].PawnTag), -1);
			
			for(i3 = 0; i3 < CCActions[i1].Sequences[i2].Actions.Length; i3++)
			{
				InsertLine(Script, CreateActionLine(CCActions[i1].Sequences[i2].Actions[i3]), i3);
			}
		}
		
		if(CCActions[i1].OnExit.Length > 0)
		{
			InsertLine(Script, "[Sequence_" $ string(CCActions[i1].Sequences.Length) $ "]", -1);
			InsertLine(Script, "PawnTag=OnExit", -1);
			
			for(i2 = 0; i2 < CCActions[i1].OnExit.Length; i2++)
			{
				S = "";
				
				if(int(CCActions[i1].OnExit[i2].OnExitType) >= 2)
				{
					S = string(CCActions[i1].OnExit[i2].PawnTag);
				}
				
				if(S != "")
				{
					S = S @ GetOnExitTypeString(int(CCActions[i1].OnExit[i2].OnExitType));
				}
				else
				{
					S = GetOnExitTypeString(int(CCActions[i1].OnExit[i2].OnExitType));
				}
				
				for(i4 = 0; i4 < CCActions[i1].OnExit[i2].OptionalTagOrEvent.Length; i4++)
				{
					if(CCActions[i1].OnExit[i2].OptionalTagOrEvent[i4] != 'None')
					{
						S = S @ string(CCActions[i1].OnExit[i2].OptionalTagOrEvent[i4]);
					}
				}
				
				InsertLine(Script, S, i2);
			}
		}
		
		MIs.Insert(MIs.Length, 1);
		MIs[MIs.Length - 1] = Spawn(class'MInfo');
		MIs[MIs.Length - 1].Tag = CCActions[i1].CutsceneName;
		MIs[MIs.Length - 1].Event = U.MergeNames('CUT__', CCActions[i1].CutsceneName);
		
		KWGame(Level.Game).SaveStringArray(Script, "..\\System\\Cutscenes\\_" $ string(CCActions[i1].CutsceneName) $ ".int");
	}
}

function InsertLine(out array<string> Script, string S, int Index) // Inserts a line into the script file
{
	if(Index >= 0)
	{
		S = "line_" $ string(Index) $ "=" $ S;
	}
	
	Script.Insert(Script.Length, 1);
	Script[Script.Length - 1] = S;
}

function string CreateActionLine(MCSAction A) // Returns a line of text that represents the configuration provided for the action
{
	local string S;
	
	S = A.ActionString;
	
	switch(A.Class)
	{
		case class'MCSACTION_AttachActorToBone':
			S = S @ string(MCSACTION_AttachActorToBone(A).nActorTag);
			S = S @ string(MCSACTION_AttachActorToBone(A).nBoneName);
			S = S @ "Yaw=" $ string(MCSACTION_AttachActorToBone(A).rBoneOffset.Yaw);
			S = S @ "Pitch=" $ string(MCSACTION_AttachActorToBone(A).rBoneOffset.Pitch);
			S = S @ "Roll=" $ string(MCSACTION_AttachActorToBone(A).rBoneOffset.Roll);
			S = S @ "X=" $ string(MCSACTION_AttachActorToBone(A).vBoneOffset.X);
			S = S @ "Y=" $ string(MCSACTION_AttachActorToBone(A).vBoneOffset.Y);
			S = S @ "Z=" $ string(MCSACTION_AttachActorToBone(A).vBoneOffset.Z);
			
			break;
		case class'MCSACTION_BanditsRunHome':
			break;
		case class'MCSACTION_ChangeLevel':
			S = S @ string(MCSACTION_ChangeLevel(A).nLevelName);
			
			break;
		case class'MCSACTION_CC':
			S = S @ MCSACTION_CC(A).sConsoleCommand;
			
			break;
		case class'MCSACTION_Comment':
			S = S @ MCSACTION_Comment(A).sComment;
			
			break;
		case class'MCSACTION_Cue':
			S = S @ MCSACTION_Cue(A).sCueName;
			
			break;
		case class'MCSACTION_DetachActorFromBone':
			S = S @ string(MCSACTION_DetachActorFromBone(A).nActorTag);
			
			break;
		case class'MCSACTION_DropCarryingActor':
			break;
		case class'MCSACTION_ElvesRunHome':
			break;
		case class'MCSACTION_EndSection':
			break;
		case class'MCSACTION_Face':
			S = S @ string(MCSACTION_Face(A).nDestinationTag);
			
			if(MCSACTION_Face(A).bFollow)
			{
				S = S @ "Follow";
			}
			
			break;
		case class'MCSACTION_FadeIn':
		case class'MCSACTION_FadeTo':
		case class'MCSACTION_Flash':
		case class'MCSACTION_Fade':
			S = S @ "A=" $ string(MCSACTION_Fade(A).cNewColor.A);
			S = S @ "Time=" $ string(MCSACTION_Fade(A).fDuration);
			S = S @ "R=" $ string(MCSACTION_Fade(A).cNewColor.R);
			S = S @ "G=" $ string(MCSACTION_Fade(A).cNewColor.G);
			S = S @ "B=" $ string(MCSACTION_Fade(A).cNewColor.B);
			S = S @ "bFlash=" $ U.BoolToString(MCSACTION_Fade(A).bFlash);
			S = S @ GetEaseTypeString(int(MCSACTION_Fade(A).EaseType));
			
			break;
		case class'MCSACTION_FadeActor':
			S = S @ "A=" $ string(MCSACTION_FadeActor(A).cNewColor.A);
			S = S @ "Time=" $ string(MCSACTION_FadeActor(A).fDuration);
			S = S @ "R=" $ string(MCSACTION_FadeActor(A).cNewColor.R);
			S = S @ "G=" $ string(MCSACTION_FadeActor(A).cNewColor.G);
			S = S @ "B=" $ string(MCSACTION_FadeActor(A).cNewColor.B);
			S = S @ "bDestroy=" $ U.BoolToString(MCSACTION_FadeActor(A).bDestroy);
			
			if(MCSACTION_FadeActor(A).nActorTag != 'None')
			{
				S = S @ "Actor=" $ string(MCSACTION_FadeActor(A).nActorTag);
			}
			
			S = S @ GetEaseTypeString(int(MCSACTION_FadeActor(A).EaseType));
			
			break;
		case class'MCSACTION_TargetFlyTo':
		case class'MCSACTION_FlyTo':
			S = S @ string(MCSACTION_FlyTo(A).nDestinationTag);
			S = S @ "Time=" $ string(MCSACTION_FlyTo(A).fMoveTime);
			
			if(MCSACTION_FlyTo(A).fSpeedFactor != MCSACTION_FlyTo(A).default.fSpeedFactor)
			{
				S = S @ "Speed=" $ string(MCSACTION_FlyTo(A).fSpeedFactor);
			}
			
			S = S @ "X=" $ string(MCSACTION_FlyTo(A).vDestOffset.X);
			S = S @ "Y=" $ string(MCSACTION_FlyTo(A).vDestOffset.Y);
			S = S @ "Z=" $ string(MCSACTION_FlyTo(A).vDestOffset.Z);
			S = S @ "YawStep=" $ string(MCSACTION_FlyTo(A).rRotStep.Yaw);
			S = S @ "PitchStep=" $ string(MCSACTION_FlyTo(A).rRotStep.Pitch);
			S = S @ "RollStep=" $ string(MCSACTION_FlyTo(A).rRotStep.Roll);
			S = S @ "SplinePoint=" $ string(MCSACTION_FlyTo(A).nSplinePointTag);
			S = S @ GetEaseTypeString(int(MCSACTION_FlyTo(A).EaseType));
			
			if(MCSACTION_FlyTo(A).bRelativeToChar)
			{
				S = S @ "Relative";
			}
			else
			{
				S = S @ "Absolute";
			}
			
			if(MCSACTION_FlyTo(A).bTurnWithChar)
			{
				S = S @ "TurnWithActor";
			}
			else
			{
				S = S @ "DontTurnWithActor";
			}
			
			if(MCSACTION_FlyTo(A).bStayLockedToActor)
			{
				S = S @ "StayLocked";
			}
			else
			{
				S = S @ "DontStayLocked";
			}
			
			if(MCSACTION_FlyTo(A).bNonBlocking)
			{
				S = S @ "*";
			}
			
			break;
		case class'MCSACTION_FollowSpline':
			S = S @ string(MCSACTION_FollowSpline(A).nSplineName);
			S = S @ "Start=" $ string(MCSACTION_FollowSpline(A).nStartPointTag);
			S = S @ "Dest=" $ string(MCSACTION_FollowSpline(A).nDestinationTag);
			S = S @ "Time=" $ string(MCSACTION_FollowSpline(A).fDuration);
			
			if(MCSACTION_FollowSpline(A).fSpeedFactor != MCSACTION_FollowSpline(A).default.fSpeedFactor)
			{
				S = S @ "Speed=" $ string(MCSACTION_FollowSpline(A).fSpeedFactor);
			}
			
			S = S @ "Accel=" $ string(MCSACTION_FollowSpline(A).fAccelRate);
			
			if(int(MCSACTION_FollowSpline(A).EaseType) != 0)
			{
				S = S @ GetEaseTypeString(int(MCSACTION_FollowSpline(A).EaseType));
			}
			
			if(MCSACTION_FollowSpline(A).bAlignAlongSpline)
			{
				S = S @ "Align";
			}
			
			break;
		case class'MCSACTION_FOV':
			S = S @ "Angle=" $ string(MCSACTION_FOV(A).fNewFOV);
			S = S @ "Time=" $ string(MCSACTION_FOV(A).fChangeTime);
			S = S @ GetEaseTypeString(int(MCSACTION_FOV(A).EaseType));
			
			break;
		case class'MCSACTION_GoHome':
			S = S @ string(MCSACTION_GoHome(A).nDestinationTag);
			S = S @ "Time=" $ string(MCSACTION_GoHome(A).fTransitionTime);
			
			if(MCSACTION_GoHome(A).bNonBlocking)
			{
				S = S @ "*";
			}
			
			break;
		case class'MCSACTION_GotoAction':
			S = S @ string(MCSACTION_GotoAction(A).iActionNumber);
			
			break;
		case class'MCSACTION_GotoMenu':
			S = S @ MCSACTION_GotoMenu(A).sMenuName;
			
			break;
		case class'MCSACTION_HeroStartTalking':
			break;
		case class'MCSACTION_HeroStopTalking':
			break;
		case class'MCSACTION_HideHUDItem':
		case class'MCSACTION_ShowHUDItem':
			S = S @ string(MCSACTION_HideHUDItem(A).nHUDItemTag);
			
			break;
		case class'MCSACTION_Jump':
			S = S @ string(MCSACTION_Jump(A).nDestinationTag);
			
			break;
		case class'MCSACTION_KnightsRunHome':
			break;
		case class'MCSACTION_LockCamTo':
			S = S @ string(MCSACTION_LockCamTo(A).nActorTag);
			S = S @ "Yaw=" $ string(MCSACTION_LockCamTo(A).rCameraLockCone.Yaw);
			S = S @ "Pitch=" $ string(MCSACTION_LockCamTo(A).rCameraLockCone.Pitch);
			S = S @ "Roll=" $ string(MCSACTION_LockCamTo(A).rCameraLockCone.Roll);
			S = S @ "Speed=" $ string(MCSACTION_LockCamTo(A).fSpeed);
			S = S @ "Tightness=" $ string(MCSACTION_LockCamTo(A).fTightness);
			
			break;
		case class'MCSACTION_LookAt':
			S = S @ string(MCSACTION_LookAt(A).nPawnTag);
			
			if(MCSACTION_LookAt(A).bStayLocked)
			{
				S = S @ "StayLocked";
			}
			
			break;
		case class'MCSACTION_MMKnightsRunHome':
			break;
		case class'MCSACTION_WalkTo':
		case class'MCSACTION_RunTo':
		case class'MCSACTION_MoveTo':
			S = S @ string(MCSACTION_MoveTo(A).nDestinationTag);
			
			if(MCSACTION_MoveTo(A).bMoveDirect)
			{
				S = S @ "Direct";
			}
			
			break;
		case class'MCSACTION_OnEvent':
			S = S @ string(MCSACTION_OnEvent(A).nEventName);
			
			break;
		case class'MCSACTION_OnExit':
			S = S @ MCSACTION_OnExit(A).sOnExitCommand;
			
			break;
		case class'MCSACTION_PlayAnim':
			S = S @ string(MCSACTION_PlayAnim(A).nAnimName);
			S = S @ "Rate=" $ string(MCSACTION_PlayAnim(A).fAnimRate);
			S = S @ "Tween=" $ string(MCSACTION_PlayAnim(A).fTweenTime);
			S = S @ "Frame=" $ string(MCSACTION_PlayAnim(A).fStartFrame);
			S = S @ "Channel=" $ string(MCSACTION_PlayAnim(A).iChannel);
			
			if(MCSACTION_PlayAnim(A).bLoopAnim)
			{
				S = S @ "Loop";
			}
			
			if(MCSACTION_PlayAnim(A).bHoldLastFrame)
			{
				S = S @ "HoldLastFrame";
			}
			
			break;
		case class'MCSACTION_PlayMusic':
			S = S @ string(MCSACTION_PlayMusic(A).nMusicName);
			S = S @ "Fade=" $ string(MCSACTION_PlayMusic(A).fTransitionTime);
			S = S @ "Loop=" $ U.BoolToString(MCSACTION_PlayMusic(A).bLoop);
			
			if(MCSACTION_PlayMusic(A).bStab)
			{
				S = S @ "Stab";
			}
			
			break;
		case class'MCSACTION_PlaySound':
			S = S @ string(MCSACTION_PlaySound(A).nSound);
			S = S @ "Volume=" $ string(MCSACTION_PlaySound(A).fVolume);
			S = S @ "Pitch=" $ string(MCSACTION_PlaySound(A).fPitch);
			S = S @ "Attenuate=" $ U.BoolToString(MCSACTION_PlaySound(A).bAttenuate);
			S = S @ "No3D=" $ U.BoolToString(MCSACTION_PlaySound(A).bNo3D);
			
			break;
		case class'MCSACTION_SayTo':
		case class'MCSACTION_Say':
			S = S @ string(MCSACTION_Say(A).nDialogName);
			
			if(MCSACTION_Say(A).nPawnTag != MCSACTION_Say(A).default.nPawnTag)
			{
				S = S @ "Pawn=" $ string(MCSACTION_Say(A).nPawnTag);
			}
			
			break;
		case class'MCSACTION_MSay':
			S = S @ string(MCSACTION_MSay(A).nDialogName);
			
			if(MCSACTION_MSay(A).nPawnTag != MCSACTION_MSay(A).default.nPawnTag)
			{
				S = S @ "Pawn=" $ string(MCSACTION_MSay(A).nPawnTag);
			}
			
			if(MCSACTION_MSay(A).bModifiedBumpline)
			{
				S = S @ "Mod";
			}
			
			break;
		case class'MCSACTION_SendActorCommand':
			S = S @ string(MCSACTION_SendActorCommand(A).nPawnTag);
			S = S @ GetOnExitTypeString(int(MCSACTION_SendActorCommand(A).OnExitType));
			
			if(MCSACTION_SendActorCommand(A).nOptionalTagOrEvent[0] != 'None')
			{
				S = S @ string(MCSACTION_SendActorCommand(A).nOptionalTagOrEvent[0]);
				
				if(MCSACTION_SendActorCommand(A).nOptionalTagOrEvent[1] != 'None')
				{
					S = S @ string(MCSACTION_SendActorCommand(A).nOptionalTagOrEvent[1]);
				}
			}
			
			break;
		case class'MCSACTION_SetFocus':
			S = S @ string(MCSACTION_SetFocus(A).nActorTag);
			
			break;
		case class'MCSACTION_SetGameState':
			S = S @ string(MCSACTION_SetGameState(A).nNewGameState);
			
			break;
		case class'MCSACTION_SetIdle':
			S = S @ string(MCSACTION_SetIdle(A).nAnimName);
			
			if(!MCSACTION_SetIdle(A).bPlayNow)
			{
				S = S @ "DontPlayNow";
			}
			
			break;
		case class'MCSACTION_SetObjective':
			S = S @ MCSACTION_SetObjective(A).sDialogTag;
			
			break;
		case class'MCSACTION_SetProp':
			S = S @ "Actor=" $ string(MCSACTION_SetProp(A).nActorTag);
			S = S @ MCSACTION_SetProp(A).sVariable $ "=" $ MCSACTION_SetProp(A).sValue;
			
			break;
		case class'MCSACTION_Shake':
			S = S @ "Magnitude=" $ string(MCSACTION_Shake(A).fMagnitude);
			S = S @ "Time=" $ string(MCSACTION_Shake(A).fTime);
			S = S @ "Decay=" $ string(MCSACTION_Shake(A).fDecay);
			
			break;
		case class'MCSACTION_ShowWeapon':
			if(!MCSACTION_ShowWeapon(A).bShowWeapon)
			{
				S = S @ "False";
			}
			
			break;
		case class'MCSACTION_Sleep':
			S = S @ string(MCSACTION_Sleep(A).fSleepTime);
			
			break;
		case class'MCSACTION_SloMo':
			S = S @ string(MCSACTION_SloMo(A).fNewTimescale);
			
			break;
		case class'MCSACTION_StopMusic':
			S = S @ "Fade=" $ string(MCSACTION_StopMusic(A).fTransitionTime);
			
			break;
		case class'MCSACTION_Teleport':
			S = S @ string(MCSACTION_Teleport(A).nDestinationTag);
			
			break;
		case class'MCSACTION_Trigger':
			S = S @ string(MCSACTION_Trigger(A).nEvent);
			
			break;
		case class'MCSACTION_TurnTo':
			S = S @ string(MCSACTION_TurnTo(A).nDestinationTag);
			
			if(MCSACTION_TurnTo(A).fTimeToTake != 0.0)
			{
				S = S @ "Time=" $ string(MCSACTION_TurnTo(A).fTimeToTake);
			}
			
			S = S @ "Rate=" $ string(MCSACTION_TurnTo(A).fRateMag);
			
			if(MCSACTION_TurnTo(A).bFollow)
			{
				S = S @ "Follow";
			}
			
			break;
		case class'MCSACTION_UnLockCamTo':
			S = S @ string(MCSACTION_UnLockCamTo(A).nActorTag);
			
			break;
		case class'MCSACTION_WaitForAnim':
			break;
		case class'MCSACTION_WaitForCue':
			S = S @ MCSACTION_WaitForCue(A).sCueName;
			
			break;
		case class'MCSACTION_WaitForEvent':
			S = S @ string(MCSACTION_WaitForEvent(A).nExternalEvent);
			
			break;
		case class'MCSACTION_WaitForFlyTo':
			break;
		case class'MCSACTION_WaitForSay':
			break;
		case class'MCSACTION_WaitForSound':
			break;
	}
	
	return S;
}

function string GetEaseTypeString(int I)
{
	switch(I)
	{
		case 0:
			return "Linear";
			
			break;
		case 1:
			return "EaseFrom";
			
			break;
		case 2:
			return "EaseTo";
			
			break;
		case 3:
			return "EaseBetween";
			
			break;
	}
}

function string GetOnExitTypeString(int I)
{
	switch(I)
	{
		case 0:
			return "SaveGame";
			
			break;
		case 1:
			return "ChangeLevel";
			
			break;
		case 2:
			return "Follow";
			
			break;
		case 3:
			return "StopFollowing";
			
			break;
		case 4:
			return "WaitInCorral";
			
			break;
		case 5:
			return "SwitchControlToMe";
			
			break;
		case 6:
			return "OnEvent";
			
			break;
		case 7:
			return "GoHome";
			
			break;
		case 8:
			return "FightWithLeadChar";
			
			break;
		case 9:
			return "Trigger";
			
			break;
		case 10:
			return "TriggerActor";
			
			break;
		case 11:
			return "LeadActor";
			
			break;
		case 12:
			return "CompanionStates";
			
			break;
	}
}


defaultproperties
{
	Texture=Texture'S_SceneManager'
}