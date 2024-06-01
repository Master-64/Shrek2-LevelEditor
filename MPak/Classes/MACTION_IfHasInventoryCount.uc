// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfHasInventoryCount extends MScriptedAction
	Config(MPak);


var(Action) class<KWInventoryCollection> InventoryType;
var(Action) int iItemCountCondition;


function ProceedToNextAction(ScriptedController C)
{
	C.ActionNum++;
	
	GetUtils(C);
	
	if(U.GetInventoryCount(InventoryType) < iItemCountCondition)
	{
		ProceedToSectionEnd(C);
	}
}

function bool StartsSection()
{
	return true;
}

function string GetActionString()
{
	return ActionString @ "-- Checking if the player has an item count of" @ string(iItemCountCondition) @ "from inventory type" @ string(InventoryType);
}


defaultproperties
{
	iItemCountCondition=64
	ActionString="If Has Inventory Count"
}