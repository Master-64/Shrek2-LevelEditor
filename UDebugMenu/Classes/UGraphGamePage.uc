//*******************************************************************************
//* UGraphGamePage generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************/
class UGraphGamePage extends UWindowPageWindow
    config(GameOptions);

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
    StatNameText[0]="ScriptTick"
    StatNameText[1]="Actor"
    StatNameText[2]="Path"
    StatNameText[3]="See"
    StatNameText[4]="Spawning"
    StatNameText[5]="Audio"
    StatNameText[6]="CleanupDestroyed"
    StatNameText[7]="Unused"
    StatNameText[8]="Net"
    StatNameText[9]="Particle"
    StatNameText[10]="Canvas"
    StatNameText[11]="Move"
    StatNameText[12]="Physics"
    StatNameText[13]="MLChecks"
    StatNameText[14]="MPChecks"
    StatNameText[15]="RenderData"
    CatNameText="Game"
    DesiredMaxText="Target Max"
    UseBarStatText="Bar graph"
    UseLineStatText="Line graph"
    SmallIsBadText="Small values are bad"
}