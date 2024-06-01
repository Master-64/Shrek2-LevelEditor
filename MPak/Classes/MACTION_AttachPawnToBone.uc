// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_AttachPawnToBone extends MScriptedAction
	Config(MPak);


struct AddNotifyStruct
{
	var() class<Pawn> PawnClass;
	var() name PawnTag;
	var() class<Pawn> AttachingPawnClass;
	var() name AttachingPawnTag;
	var() name nBoneName;
	var() vector vBoneOffsetLoc;
	var() rotator rBoneOffsetRot;
	var() bool bDetachPawn;
};

var(Action) array<AddNotifyStruct> AttachActions;


function bool InitActionFor(ScriptedController C)
{
	local Pawn TargetPawn1, TargetPawn2;
	local int i;
	
	GetUtils(C);
	HP = U.GetHP();
	
	for(i = 0; i < AttachActions.Length; i++)
	{
		if(AttachActions[i].PawnTag == 'CurrentPlayer')
		{
			TargetPawn1 = HP;
		}
		else
		{
			if(AttachActions[i].PawnClass == none)
			{
				Warn(ActionString @ "-- An actor class assignment is missing; skipping action" @ string(i));
				
				continue;
			}
			
			foreach C.AllActors(AttachActions[i].PawnClass, TargetPawn1, AttachActions[i].PawnTag)
			{
				break;
			}
		}
		
		if(AttachActions[i].AttachingPawnTag == 'CurrentPlayer')
		{
			TargetPawn2 = HP;
		}
		else
		{
			if(AttachActions[i].AttachingPawnClass == none)
			{
				Warn(ActionString @ "-- An actor class assignment is missing; skipping action" @ string(i));
				
				continue;
			}
			
			foreach C.AllActors(AttachActions[i].AttachingPawnClass, TargetPawn2, AttachActions[i].AttachingPawnTag)
			{
				break;
			}
		}
		
		if(TargetPawn1 == none || TargetPawn2 == none)
		{
			Warn(ActionString @ "-- Failed to find either the pawn for attachment or the pawn to attach to the pawn; skipping action" @ string(i));
			
			continue;
		}
		
		if(!AttachActions[i].bDetachPawn)
		{
			TargetPawn1.AttachToBone(TargetPawn2, AttachActions[i].nBoneName);
			TargetPawn2.SetRelativeLocation(AttachActions[i].vBoneOffsetLoc);
			TargetPawn2.SetRelativeRotation(AttachActions[i].rBoneOffsetRot);
		}
		else
		{
			TargetPawn1.DetachFromBone(TargetPawn2);
		}
	}
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Attaching" @ string(AttachActions.Length) @ "pawns to" @ string(AttachActions.Length) @ "pawns";
}


defaultproperties
{
	ActionString="Attach Pawn To Bone"
}