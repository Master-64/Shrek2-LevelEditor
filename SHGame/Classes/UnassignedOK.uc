//*******************************************************************************
//* UnassignedOK generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//********************************************************************************
class UnassignedOK extends GUIPage
    instanced;

var int Count;
var string OrigRes;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnAccept;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnbackground;
var /*0x00000000-0x80000000*/ export editinline GUILabel lblVideo;
var export editinline transient Tab_OptionsVideo videoptr;
var string originalbitdepth;
var Sound sfxClick;

function InitComponent(GUIController MyController, GUIComponent MyOwner);

function bool InternalOnClick(GUIComponent Sender);

defaultproperties
{
    Begin Object name=AcceptButton class=GUIButton
        StyleName="SHSolidBox"
        bBoundToParent=true
        WinTop=0.68
        WinLeft=0.125
        WinWidth=0.3
        WinHeight=0.05
        OnClick=InternalOnClick
    End Object
    btnAccept=AcceptButton
    Begin Object name=VideoOKDesc class=GUILabel
        TextAlign=1
        StyleName="SHAuptimaghRed"
        WinTop=0.4
        WinHeight=32
    End Object
    lblVideo=VideoOKDesc
    sfxClick=Sound'UI.Button'
    Background=Texture'storybookanimTX.videosettings'
    WinTop=0.372
    WinHeight=0.29
}