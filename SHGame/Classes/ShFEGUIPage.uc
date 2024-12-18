//*******************************************************************************
//* ShFEGUIPage generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//********************************************************************************
class ShFEGUIPage extends SHGUIPage
    config
    instanced;

var config string FirstLevel;
var config int GameSlot;
var config string FEMenuLevel;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnOptions;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnQuit;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnDelete;
var /*0x00000000-0x80000000*/ export editinline GUIButton lblVersion;
var /*0x00000000-0x80000000*/ export editinline GUIButton ButtonSaveGame0;
var /*0x00000000-0x80000000*/ export editinline GUIButton ButtonSaveGame1;
var /*0x00000000-0x80000000*/ export editinline GUIButton ButtonSaveGame2;
var /*0x00000000-0x80000000*/ export editinline GUIButton ButtonSaveGame3;
var /*0x00000000-0x80000000*/ export editinline GUIButton ButtonSaveGame4;
var /*0x00000000-0x80000000*/ export editinline GUIButton ButtonSaveGame5;
var shpawn shp;
var bool AmDeleteing;
var /*0x00000000-0x80000000*/ export editinline GUIButton lblDeleteMsg;
var SHMenuBook Mb;
var /*0x00000000-0x80000000*/ export editinline GUILabel lblStartGame;

function InitComponent(GUIController MyController, GUIComponent MyOwner);

event HandleParameters(string Param1, string Param2);

function InitFadeInItems();

function InitFadeOutItems();

event Timer();

function RevertSaveImages();

function SetSaveButtonImage();

function SetSaveButtonText();

function bool DoesASavedGameExist();

function DisableOptionalButtons();

function bool InternalOnClick(GUIComponent Sender);

function CleanupAndStartGame(int GameSlot);

function bool InternalOnKeyEvent(out byte Key, out byte State, float Delta);

defaultproperties
{
    FirstLevel="Book_Story_1.unr"
    GameSlot=-1
    FEMenuLevel="Book_FrontEnd.unr"
    Begin Object name=cBtnOptions class=GUIButton
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnOptions=cBtnOptions
    Begin Object name=cBtnQuit class=GUIButton
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnQuit=cBtnQuit
    Begin Object name=cBtnDelete class=GUIButton
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnDelete=cBtnDelete
    Begin Object name=cLblVersion class=GUIButton
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    lblVersion=cLblVersion
    Begin Object name=cButtonSaveGame0 class=GUIButton
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    ButtonSaveGame0=cButtonSaveGame0
    Begin Object name=cButtonSaveGame1 class=GUIButton
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    ButtonSaveGame1=cButtonSaveGame1
    Begin Object name=cButtonSaveGame2 class=GUIButton
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    ButtonSaveGame2=cButtonSaveGame2
    Begin Object name=cButtonSaveGame3 class=GUIButton
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    ButtonSaveGame3=cButtonSaveGame3
    Begin Object name=cButtonSaveGame4 class=GUIButton
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    ButtonSaveGame4=cButtonSaveGame4
    Begin Object name=cButtonSaveGame5 class=GUIButton
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    ButtonSaveGame5=cButtonSaveGame5
    Begin Object name=clblDeleteMsg class=GUIButton
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    lblDeleteMsg=clblDeleteMsg
    Begin Object name=clblStartGame class=GUILabel
        TextAlign=1
        StyleName="SH12AuptimaghWhite"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    lblStartGame=clblStartGame
    WinHeight=1
}