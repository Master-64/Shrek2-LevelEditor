// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_ForceAction extends MScriptedAction
	Config(MPak);


enum EActionType
{
	AT_Single_Jump,
	AT_Double_Jump,
	AT_Punch,
	AT_Skip_Cutscene,
	AT_Skip_Movie,
	AT_Potion_Menu,
	AT_Pause_Menu
};

var(Action) MACTION_ForceAction.EActionType ActionType;
var(Action) class<Pawn> GetPawnClass;
var(Action) name GetPawnTag;


function bool InitActionFor(ScriptedController C)
{
	local Pawn TargetPawn;
	
	GetUtils(C);
	
	if(int(ActionType) <= 2)
	{
		HP = U.GetHP();
		
		if(GetPawnTag == 'CurrentPlayer')
		{
			TargetPawn = HP;
		}
		else
		{
			if(GetPawnClass == none)
			{
				Warn(ActionString @ "-- An actor class assignment is missing; aborting process");
				
				return false;
			}
			
			foreach C.DynamicActors(GetPawnClass, TargetPawn, GetPawnTag)
			{
				break;
			}
		}
		
		if(TargetPawn == none)
		{
			Warn(ActionString @ "-- Failed to find a pawn; aborting process");
			
			return false;
		}
		
		switch(ActionType)
		{
			case AT_Single_Jump:
				TargetPawn.DoJump(false);
				
				break;
			case AT_Double_Jump:
				if(TargetPawn.IsA('KWPawn'))
				{
					KWPawn(TargetPawn).DoDoubleJump(false);
				}
				
				break;
			case AT_Punch:
				TargetPawn.Fire();
				
				if(TargetPawn.IsA('ShHeroPawn'))
				{
					ShHeroPawn(TargetPawn).DoSomeAction();
				}
				
				break;
		}
	}
	else
	{
		PC = U.GetPC();
		
		switch(ActionType)
		{
			case AT_Skip_Cutscene:
				KWHud(PC.myHUD).BypassCutscene();
				
				break;
			case AT_Skip_Movie:
				PC.StopMoviePlayback();
				
				break;
			case AT_Potion_Menu:
				PC.ForceLoadPotionSelectMenu();
				
				break;
			case AT_Pause_Menu:
				PC.EscHandler();
				
				break;
		}
	}
	
	return false;
}

function string GetActionString()
{
	switch(ActionType)
	{
		case AT_Single_Jump:
			return ActionString @ "-- Executing single jump on target pawn";
			
			break;
		case AT_Double_Jump:
			return ActionString @ "-- Executing double jump on target pawn";
			
			break;
		case AT_Punch:
			return ActionString @ "-- Executing punch on target pawn";
			
			break;
		case AT_Skip_Cutscene:
			return ActionString @ "-- Executing a cutscene skip";
			
			break;
		case AT_Skip_Movie:
			return ActionString @ "-- Executing a movie skip";
			
			break;
		case AT_Potion_Menu:
			return ActionString @ "-- Executing potion menu popup";
			
			break;
		case AT_Pause_Menu:
			return ActionString @ "-- Executing pause menu popup";
			
			break;
	}
}


defaultproperties
{
	ActionString="Force Action"
	GetPawnClass=class'Pawn'
}