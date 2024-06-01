// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_SaveLoadGame extends MScriptedAction
	Config(MPak);


enum EActionType
{
	AT_SaveGame,
	AT_LoadGame
};

var(Action) MACTION_SaveLoadGame.EActionType ActionType;
var(Action) int SaveSlotID;
var(Action) bool bGetCurrentGameSlot, bPlaySaveSound;
var(Action) Sound SaveSound;


function bool InitActionFor(ScriptedController C)
{
	GetUtils(C);
	PC = U.GetPC();
	
	switch(ActionType)
	{
		case AT_SaveGame:
			U.SaveAGame(SaveSlotID, bGetCurrentGameSlot);
			
			if(bPlaySaveSound)
			{
				U.PlayASound(, SaveSound);
			}
			
			break;
		case AT_LoadGame:
			U.LoadAGame(SaveSlotID, bGetCurrentGameSlot);
			
			break;
	}
	
	return false;
}

function string GetActionString()
{
	switch(ActionType)
	{
		case AT_SaveGame:
			return ActionString @ "-- Saving to save slot" @ string(SaveSlotID);
			
			break;
		case AT_LoadGame:
			return ActionString @ "-- Loading save slot" @ string(SaveSlotID);
			
			break;
	}
}


defaultproperties
{
	bGetCurrentGameSlot=true
	bPlaySaveSound=true
	SaveSound=Sound'UI.SaveGame'
	ActionString="Save/Load Game"
}