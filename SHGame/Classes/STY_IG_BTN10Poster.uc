//*******************************************************************************
//* STY_IG_BTN10Poster generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//********************************************************************************
class STY_IG_BTN10Poster extends STY_SH_FadeStyle
    instanced;

function bool Internal_OnDraw(Canvas Canvas, GUI.eMenuState MenuState, float Left, float Top, float Width, float Height);

function bool Internal_OnDrawText(Canvas Canvas, GUI.eMenuState MenuState, float Left, float Top, float Width, float Height, GUI.eTextAlign Align, string Text);

defaultproperties
{
    KeyName="IGBTN10PosterStyle"
    Images[0]=none
    Images[1]=none
    Images[2]=none
    Images[3]=none
    Images[4]=none
    OnDraw=Internal_OnDraw
    OnDrawText=Internal_OnDrawText
}