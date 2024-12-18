//*******************************************************************************
//* UGraphGame2Page generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************/
class UGraphGame2Page extends UWindowPageWindow
    config(Game2Options);

var UWindowLabelControl Labels[6];
var localized string StatNameText[6];
var localized string CatNameText;
var UWindowEditControl DesiredMaxEdit[6];
var localized string DesiredMaxText;
var UWindowCheckbox UseBarStatCheck[6];
var localized string UseBarStatText;
var UWindowCheckbox UseLineStatCheck[6];
var localized string UseLineStatText;
var UWindowCheckbox SmallIsBadCheck[6];
var localized string SmallIsBadText;
var config string DesiredMaxEditSettings[6];
var config int SmallIsBadSettings[6];
var config int UseBarStatSettings[6];
var config int UseLineStatSettings[6];
var bool bIsLoading;
var bool bShouldDelayChange;

function Created();

function Notify(UWindowDialogControl C, byte E);

function Change(int nIndex);

defaultproperties
{
    StatNameText[0]="HUD PostRender"
    StatNameText[1]="Interaction Pre"
    StatNameText[2]="Interaction Post"
    StatNameText[3]="ScriptDebug"
    StatNameText[4]="Reps"
    StatNameText[5]="RPC"
    CatNameText="Game"
    DesiredMaxText="Target Max"
    UseBarStatText="Bar graph"
    UseLineStatText="Line graph"
    SmallIsBadText="Small values are bad"
}