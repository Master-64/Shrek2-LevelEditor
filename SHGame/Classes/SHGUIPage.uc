//*******************************************************************************
//* SHGUIPage generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//********************************************************************************
class SHGUIPage extends KWGUIPage
    instanced;

var Sound sfxClick;

function InitComponent(GUIController MyController, GUIComponent MyOwner);

function bool InternalOnKeyEvent(out byte Key, out byte State, float Delta);

function bool InternalOnClick(GUIComponent Sender);

defaultproperties
{
    sfxClick=Sound'UI.Button'
    Begin Object name=MyFooter class=GUITitleBar
        Justification=1
        bUseTextHeight=false
        StyleName="SHHint"
        WinTop=0.92
        WinLeft=0.06
        WinWidth=0.88
        WinHeight=0.055
    End Object
    TabFooter=MyFooter
}