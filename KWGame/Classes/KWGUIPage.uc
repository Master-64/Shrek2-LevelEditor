//*******************************************************************************
//* KWGUIPage generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************
class KWGUIPage extends GUIPage
    instanced;

var string DefaultHint;
var /*0x00000000-0x80000000*/ export editinline GUITitleBar TabFooter;

function InitComponent(GUIController MyController, GUIComponent MyOwner);

function UnPause();

function bool InternalOnKeyEvent(out byte Key, out byte State, float Delta);

event ChangeHint(string NewHint);

function InternalOnClose(optional bool bCanceled);

function bool InternalOnClick(GUIComponent Sender);

defaultproperties
{
    DefaultHint="PlaceHolder Hint"
    Begin Object name=MyFooter class=GUITitleBar
        Justification=1
        bUseTextHeight=false
        StyleName="NoBackground"
        WinTop=0.942397
        WinLeft=0.06
        WinWidth=0.88
        WinHeight=0.055
    End Object
    TabFooter=MyFooter
    bRequire640x480=false
    bAllowedAsLast=true
}