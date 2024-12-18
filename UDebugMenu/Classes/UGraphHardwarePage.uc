//*******************************************************************************
//* UGraphHardwarePage generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************/
class UGraphHardwarePage extends UWindowPageWindow
    config(HardwareOptions);

var UWindowLabelControl Labels[16];
var localized string StatNameText[16];
var localized string CatNameText;
var UWindowEditControl DesiredMaxEdit[16];
var localized string DesiredMaxText;
var UWindowCheckbox UseBarStatCheck[16];
var localized string UseBarStatText;
var UWindowCheckbox UseLineStatCheck[16];
var localized string UseLineStatText;
var UWindowCheckbox SmallIsBadCheck[16];
var localized string SmallIsBadText;
var config string DesiredMaxEditSettings[16];
var config int SmallIsBadSettings[16];
var config int UseBarStatSettings[16];
var config int UseLineStatSettings[16];
var bool bIsLoading;
var bool bShouldDelayChange;

function Created();

function Notify(UWindowDialogControl C, byte E);

function Change(int nIndex);

defaultproperties
{
    StatNameText[0]="TextureBytes"
    StatNameText[1]="PushState"
    StatNameText[2]="PopState"
    StatNameText[3]="SetRenderTarget"
    StatNameText[4]="SetMaterial"
    StatNameText[5]="SetMaterialBlending"
    StatNameText[6]="SetVertexStream"
    StatNameText[7]="SetDynStream"
    StatNameText[8]="SetIB"
    StatNameText[9]="SetDynIB"
    StatNameText[10]="DrawPrimitive"
    StatNameText[11]="Lock"
    StatNameText[12]="Unlock"
    StatNameText[13]="Present"
    StatNameText[14]="StateChanges"
    StatNameText[15]="TextureChanges"
    CatNameText="Hardware"
    DesiredMaxText="Target Max"
    UseBarStatText="Bar graph"
    UseLineStatText="Line graph"
    SmallIsBadText="Small values are bad"
}