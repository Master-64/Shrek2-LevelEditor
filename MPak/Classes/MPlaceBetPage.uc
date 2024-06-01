// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MPlaceBetPage extends MGUIPage
	Config(MPak);


var automated GUILabel PromptLabel;
var automated GUIButton YesButton, NoButton;
var MSlotMachine S;


event InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	local MSlotMachine SM;
	
	super.InitComponent(MyController, MyOwner);
	
	__OnKeyEvent__Delegate = InternalOnKeyEvent;
	
	TabFooter.WinTop = 0.885;
	
	CenterComponent(PromptLabel);
	CenterComponent(YesButton);
	CenterComponent(NoButton);
	
	PC = U.GetPC();
	
	PC.SetPause(true);
	
	foreach U.DynamicActors(class'MSlotMachine', SM)
	{
		if(SM.bGUIOpen)
		{
			S = SM;
			
			break;
		}
	}
	
	if(S == none)
	{
		ClosePage();
	}
	
	PromptLabel.Caption = "Do you want to bet" @ string(S.iCostOfBet.Count) @ "coins?";
}

event bool InternalOnClick(GUIComponent Sender)
{
	super.InternalOnClick(Sender);
	
	switch(Sender)
	{
		case YesButton:
			S.GotoState('ProcessBet');
			
			break;
		default:
			break;
	}
	
	PC.SetPause(false);
	ClosePage();
	
	return true;
}

event bool InternalOnKeyEvent(out byte Key, out byte State, float Delta)
{
	return super.InternalOnKeyEvent(Key, State, Delta);
}


defaultproperties
{
	Begin Object Name=lblPrompt0 Class=GUILabel
		StyleName="SH18Auptimagh"
		TextAlign=TXTA_Center
		bMultiLine=true
		WinTop=0.35
		WinLeft=0.5
		WinWidth=0.3
		WinHeight=0.15
	End Object
	PromptLabel=lblPrompt0
	Begin Object Name=btnYes0 Class=GUIButton
		StyleName="SHBTNYesStyle"
		WinTop=0.5
		WinLeft=0.37
		WinWidth=0.2
		WinHeight=0.06
		bNeverFocus=true
		Caption="Yes"
		OnClick=InternalOnClick
	End Object
	YesButton=btnYes0
	Begin Object Name=btnNo0 Class=GUIButton
		StyleName="SHBTNNoStyle"
		WinTop=0.5
		WinLeft=0.63
		WinWidth=0.2
		WinHeight=0.06
		bNeverFocus=true
		Caption="No"
		OnClick=InternalOnClick
	End Object
	NoButton=btnNo0
	Background=Texture'FGM_Potion_Menu.black_screen'
}