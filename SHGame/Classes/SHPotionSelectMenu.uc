//*******************************************************************************
//* SHPotionSelectMenu generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//********************************************************************************
class SHPotionSelectMenu extends SHGUIPage
    instanced;

const BTN_W = 0.1;
const BTN_H = 0.1;
const Btn_L = 0.1;
const Btn_T = 0.1;
const AcceptBtnTop = 0.65333333;
const AcceptBtnLeft = 0.17125;
const AcceptBtnWidth = 0.15875;
const AcceptBtnHeight = 0.105;
const AcceptBtnHGap = 0.08;
const PotionTop = 0.41;
const PotionLeft = 0.1825;
const PotionWidth = 0.0425;
const PotionHeight = 0.11333333;
const PotionHGap = 0.03875;

var /*0x00000000-0x80000000*/ export editinline GUIImage potionBK;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnAccept;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnCancel;
var /*0x00000000-0x80000000*/ export editinline GUIButton BtnPotion1;
var /*0x00000000-0x80000000*/ export editinline GUIButton BtnPotion2;
var /*0x00000000-0x80000000*/ export editinline GUIButton BtnPotion3;
var /*0x00000000-0x80000000*/ export editinline GUIButton BtnPotion4;
var /*0x00000000-0x80000000*/ export editinline GUIButton BtnPotion5;
var /*0x00000000-0x80000000*/ export editinline GUIButton BtnPotion6;
var /*0x00000000-0x80000000*/ export editinline GUIButton BtnPotion7;
var /*0x00000000-0x80000000*/ export editinline GUIButton BtnPotion8;
var /*0x00000000-0x80000000*/ export editinline GUIButton BtnPotion9;
var /*0x00000000-0x80000000*/ export editinline GUIButton BtnPotions[9];
var bool bIgnoreEscape;
var Sound sfxAccept;
var Sound sfxCancel;
var Sound sfxNoPotion;
var Texture boxhighlight;
var int PotionCount[9];
var int KeyUse[9];

function InitComponent(GUIController MyController, GUIComponent MyOwner);

function bool InternalOnKeyEvent(out byte Key, out byte State, float Delta);

function SetHighlightBar();

function UnSetHighlightBar();

function PlayPotionUseSfx();

function bool InternalOnClick(GUIComponent Sender);

function bool Internal_OnDraw(Canvas Canvas);

function SetPotion1Image(bool halo);

function SetPotion2Image(bool halo);

function SetPotion3Image(bool halo);

function SetPotion4Image(bool halo);

function SetPotion5Image(bool halo);

function SetPotion6Image(bool halo);

function SetPotion7Image(bool halo);

function SetPotion8Image(bool halo);

function SetPotion9Image(bool halo);

defaultproperties
{
    Begin Object name=cpotionBK class=GUIImage
        Image=Texture'FGM_Potion_Menu.potion_menu.potion_menu'
        ImageStyle=2
        ImageAlign=1
        WinWidth=0.8
        WinHeight=0.6438648
    End Object
    potionBK=cpotionBK
    Begin Object name=cBtnYes class=GUIButton
        StyleName="SHFGM_Accept"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnAccept=cBtnYes
    Begin Object name=cBtnNo class=GUIButton
        StyleName="SHFGM_Cancel"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnCancel=cBtnNo
    Begin Object name=cBtnPotion1 class=GUIButton
        StyleName="SHPS_1Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    BtnPotion1=cBtnPotion1
    Begin Object name=cBtnPotion2 class=GUIButton
        StyleName="SHPS_6Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    BtnPotion2=cBtnPotion2
    Begin Object name=cBtnPotion3 class=GUIButton
        StyleName="SHPS_3Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    BtnPotion3=cBtnPotion3
    Begin Object name=cBtnPotion4 class=GUIButton
        StyleName="SHPS_4Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    BtnPotion4=cBtnPotion4
    Begin Object name=cBtnPotion5 class=GUIButton
        StyleName="SHPS_5Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    BtnPotion5=cBtnPotion5
    Begin Object name=cBtnPotion6 class=GUIButton
        StyleName="SHPS_2Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    BtnPotion6=cBtnPotion6
    Begin Object name=cBtnPotion7 class=GUIButton
        StyleName="SHPS_7Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    BtnPotion7=cBtnPotion7
    Begin Object name=cBtnPotion8 class=GUIButton
        StyleName="SHPS_8Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    BtnPotion8=cBtnPotion8
    Begin Object name=cBtnPotion9 class=GUIButton
        StyleName="SHPS_9Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    BtnPotion9=cBtnPotion9
    sfxAccept=Sound'UI.PotionUI_checkout'
    sfxCancel=Sound'UI.PotionUI_cancel'
    sfxNoPotion=Sound'Potions.no_potion'
    Background=Texture'FGM_Potion_Menu.potion_menu.black_screen'
    WinHeight=1
}