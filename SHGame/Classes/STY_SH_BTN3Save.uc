//*******************************************************************************
//* STY_SH_BTN3Save generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//********************************************************************************
class STY_SH_BTN3Save extends STY_SH_FadeStyle
    instanced;

function bool Internal_OnDraw(Canvas Canvas, GUI.eMenuState MenuState, float Left, float Top, float Width, float Height);

function bool Internal_OnDrawText(Canvas Canvas, GUI.eMenuState MenuState, float Left, float Top, float Width, float Height, GUI.eTextAlign Align, string Text);

defaultproperties
{
    KeyName="SHBTN3SaveStyle"
    Images[0]=Texture'storybookanimTX.box_button'
    Images[1]=Texture'storybookanimTX.box_button_hili'
    Images[2]=Texture'storybookanimTX.box_button_hili'
    Images[3]=Texture'storybookanimTX.box_button'
    Images[4]=Texture'storybookanimTX.box_button'
    OnDraw=Internal_OnDraw
    OnDrawText=Internal_OnDrawText
}