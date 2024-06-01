// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_AddNotify extends MScriptedAction
	Config(MPak);


struct AddNotifyStruct
{
	var() class<KWPawn> PawnClass;
	var() name PawnTag;
	var() name nAnimSequence;
	var() float fFrame;
	var() name nFunctionToRun;
};

var(Action) array<AddNotifyStruct> AddNotifyActions;


function bool InitActionFor(ScriptedController C)
{
	local KWPawn TargetPawn;
	local string sTempMesh;
	local int i;
	
	GetUtils(C);
	HP = U.GetHP();
	
	for(i = 0; i < AddNotifyActions.Length; i++)
	{
		AddNotifyActions[i].fFrame = FMax(AddNotifyActions[i].fFrame, 0.000001);
		
		if(AddNotifyActions[i].PawnTag == 'CurrentPlayer')
		{
			TargetPawn = KWPawn(HP);
		}
		else
		{
			if(AddNotifyActions[i].PawnClass == none)
			{
				Warn(ActionString @ "-- An actor class assignment is missing; skipping action" @ string(i));
				
				continue;
			}
			
			foreach C.AllActors(AddNotifyActions[i].PawnClass, TargetPawn, AddNotifyActions[i].PawnTag)
			{
				break;
			}
		}
		
		if(TargetPawn == none)
		{
			Warn(ActionString @ "-- Failed to find an actor to add a notify to; skipping action" @ string(i));
			
			continue;
		}
		
		sTempMesh = TargetPawn.GetPropertyText("Mesh");
		
		TargetPawn.AddNotify(MeshAnimation(DynamicLoadObject(Right(Left(sTempMesh, Len(sTempMesh) - 1), Len(Left(sTempMesh, Len(sTempMesh) - 1)) - 13), class'MeshAnimation')), AddNotifyActions[i].nAnimSequence, AddNotifyActions[i].fFrame, AddNotifyActions[i].nFunctionToRun);
	}
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Adding a notify to" @ string(AddNotifyActions.Length) @ "pawns";
}


defaultproperties
{
	ActionString="Add Notify"
}