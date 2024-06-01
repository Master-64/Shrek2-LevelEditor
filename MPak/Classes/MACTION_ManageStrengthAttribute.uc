// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_ManageStrengthAttribute extends MScriptedAction
	Config(MPak);


enum EPlayerType
{
	PT_Shrek,
	PT_Donkey,
	PT_PIB,
	PT_Steed,
	PT_ShrekHuman
};

struct TSAStruct
{
	var() MACTION_ManageStrengthAttribute.EPlayerType PlayerType;
	var() bool bNewVisibility, bToggleInstead;
};

var(Action) array<TSAStruct> ManageStrengthAttributeActions;
var(Action) bool bPickRandom;


function bool InitActionFor(ScriptedController C)
{
	local int i;
	
	if(!bPickRandom)
	{
		for(i = 0; i < ManageStrengthAttributeActions.Length; i++)
		{
			ManageStrengthAttribute(C, i);
		}
	}
	else
	{
		ManageStrengthAttribute(C, Rand(ManageStrengthAttributeActions.Length));
	}
	
	return false;
}

function ManageStrengthAttribute(ScriptedController C, int iIndex) // Toggles the strength attribute of a specific player type
{
	local Shrek S;
	local Donkey D;
	local PIB P;
	local Steed ST;
	local ShrekHuman SH;
	
	switch(ManageStrengthAttributeActions[iIndex].PlayerType)
	{
		case PT_Shrek:
			foreach C.DynamicActors(class'Shrek', S)
			{
				if(!ManageStrengthAttributeActions[iIndex].bToggleInstead)
				{
					if(ManageStrengthAttributeActions[iIndex].bNewVisibility)
					{
						S.ShowStrengthAttributes();
					}
					else
					{
						S.HideStrengthAttributes();
					}
				}
				else
				{
					if(!S.bHasStrengthPotion)
					{
						S.ShowStrengthAttributes();
					}
					else
					{
						S.HideStrengthAttributes();
					}
				}
			}
			
			break;
		case PT_Donkey:
			foreach C.DynamicActors(class'Donkey', D)
			{
				if(!ManageStrengthAttributeActions[iIndex].bToggleInstead)
				{
					if(ManageStrengthAttributeActions[iIndex].bNewVisibility)
					{
						D.ShowStrengthAttributes();
					}
					else
					{
						D.HideStrengthAttributes();
					}
				}
				else
				{
					if(!S.bHasStrengthPotion)
					{
						D.ShowStrengthAttributes();
					}
					else
					{
						D.HideStrengthAttributes();
					}
				}
			}
			
			break;
		case PT_PIB:
			foreach C.DynamicActors(class'PIB', P)
			{
				if(!ManageStrengthAttributeActions[iIndex].bToggleInstead)
				{
					if(ManageStrengthAttributeActions[iIndex].bNewVisibility)
					{
						P.ShowStrengthAttributes();
					}
					else
					{
						P.HideStrengthAttributes();
					}
				}
				else
				{
					if(!S.bHasStrengthPotion)
					{
						P.ShowStrengthAttributes();
					}
					else
					{
						P.HideStrengthAttributes();
					}
				}
			}
			
			break;
		case PT_Steed:
			foreach C.DynamicActors(class'Steed', ST)
			{
				if(!ManageStrengthAttributeActions[iIndex].bToggleInstead)
				{
					if(ManageStrengthAttributeActions[iIndex].bNewVisibility)
					{
						ST.ShowStrengthAttributes();
					}
					else
					{
						ST.HideStrengthAttributes();
					}
				}
				else
				{
					if(!S.bHasStrengthPotion)
					{
						ST.ShowStrengthAttributes();
					}
					else
					{
						ST.HideStrengthAttributes();
					}
				}
			}
			
			break;
		case PT_ShrekHuman:
			foreach C.DynamicActors(class'ShrekHuman', SH)
			{
				if(!ManageStrengthAttributeActions[iIndex].bToggleInstead)
				{
					if(ManageStrengthAttributeActions[iIndex].bNewVisibility)
					{
						SH.ShowStrengthAttributes();
					}
					else
					{
						SH.HideStrengthAttributes();
					}
				}
				else
				{
					if(!S.bHasStrengthPotion)
					{
						SH.ShowStrengthAttributes();
					}
					else
					{
						SH.HideStrengthAttributes();
					}
				}
			}
			
			break;
	}
}

function string GetActionString()
{
	if(!bPickRandom)
	{
		return ActionString @ "-- Executing" @ string(ManageStrengthAttributeActions.Length) @ "actions";
	}
	else
	{
		return ActionString @ "-- Randomly toggling strength attribute";
	}
}


defaultproperties
{
	ActionString="Toggle Strength Attribute"
}