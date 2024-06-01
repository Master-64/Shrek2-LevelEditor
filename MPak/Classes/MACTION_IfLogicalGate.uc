// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_IfLogicalGate extends MScriptedAction
	Config(MPak);


enum ELogicType
{
	LT_Buffer,
	LT_NOT,
	LT_AND,
	LT_OR,
	LT_NAND,
	LT_NOR,
	LT_XOR,
	LT_XNOR
};

var(Action) MACTION_IfLogicalGate.ELogicType LogicGateType;
var(Action) name TriggeredConditionTags[2];


function ProceedToNextAction(ScriptedController C)
{
	local TriggeredCondition T;
	local int i;
	local bool b1, b2;
	
	C.ActionNum++;
	
	for(i = 0; i < 2; i++)
	{
		foreach C.DynamicActors(class'TriggeredCondition', T, TriggeredConditionTags[i])
		{
			break;
		}
		
		if(i == 0)
		{
			b1 = T.bEnabled;
		}
		else
		{
			b2 = T.bEnabled;
		}
	}
	
	switch(LogicGateType)
	{
		case LT_Buffer:
			if(b1)
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case LT_NOT:
			if(!b1)
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case LT_AND:
			if(b1 && b2)
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case LT_OR:
			if(b1 || b2)
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case LT_NAND:
			if(!(b1 && b2))
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case LT_NOR:
			if(!(b1 || b2))
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case LT_XOR:
			if(!(b1 && b2) && (b1 || b2))
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
		case LT_XNOR:
			if(!(!(b1 && b2) && (b1 || b2)))
			{
				break;
			}
			else
			{
				ProceedToSectionEnd(C);
			}
			
			break;
	}
}

function string GetActionString()
{
	switch(LogicGateType)
	{
		case LT_Buffer:
			return ActionString @ "-- Buffer Gate";
			
			break;
		case LT_NOT:
			return ActionString @ "-- NOT Gate";
			
			break;
		case LT_AND:
			return ActionString @ "-- AND Gate";
			
			break;
		case LT_OR:
			return ActionString @ "-- OR Gate";
			
			break;
		case LT_NAND:
			return ActionString @ "-- NAND Gate";
			
			break;
		case LT_NOR:
			return ActionString @ "-- NOR Gate";
			
			break;
		case LT_XOR:
			return ActionString @ "-- XOR Gate";
			
			break;
		case LT_XNOR:
			return ActionString @ "-- XNOR Gate";
			
			break;
	}
}


defaultproperties
{
	ActionString="If Logical Gate"
}