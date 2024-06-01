// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_SetGlobalData extends MScriptedAction
	Config(MGlobalData);


struct ActionStruct
{
	var() int Slot;
	var() MGlobalData.EDataType DataType;
	var() string Value;
	var() bool bGetCurrentGameSlot;
};

var(Action) array<ActionStruct> DataActions;
var(Action) bool bResetAllGlobalData;


function bool InitActionFor(ScriptedController C)
{
	local int i;
	
	if(!bResetAllGlobalData)
	{
		for(i = 0; i < DataActions.Length; i++)
		{
			class'MGlobalData'.static.SaveGlobalData(DataActions[i].DataType, DataActions[i].Slot, DataActions[i].Value, DataActions[i].bGetCurrentGameSlot);
		}
	}
	else
	{
		class'MGlobalData'.static.ResetGlobalData();
	}
	
	return false;
}

function string GetActionString()
{
	if(!bResetAllGlobalData)
	{
		return ActionString @ "-- Executing" @ string(DataActions.Length) @ "actions";
	}
	else
	{
		return ActionString @ "-- Resetting all global data";
	}
}


defaultproperties
{
	ActionString="Set Global Data"
}