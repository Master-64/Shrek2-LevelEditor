//*******************************************************************************
//* UGraphFramePage generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************/
class UGraphFramePage extends UWindowPageWindow
    config(FrameOptions);

var UWindowLabelControl Labels[2];
var localized string StatNameText[2];
var localized string CatNameText;
var UWindowEditControl DesiredMaxEdit[2];
var localized string DesiredMaxText;
var UWindowCheckbox UseBarStatCheck[2];
var localized string UseBarStatText;
var UWindowCheckbox UseLineStatCheck[2];
var localized string UseLineStatText;
var UWindowCheckbox SmallIsBadCheck[2];
var localized string SmallIsBadText;
var config string DesiredMaxEditSettings[2];
var config int SmallIsBadSettings[2];
var config int UseBarStatSettings[2];
var config int UseLineStatSettings[2];
var bool bIsLoading;
var bool bShouldDelayChange;

function Created();

function Notify(UWindowDialogControl C, byte E);

function Change(int nIndex);

defaultproperties
{
    StatNameText[0]="Frame"
    StatNameText[1]="Render"
    CatNameText="Frame"
    DesiredMaxText="Target Max"
    UseBarStatText="Bar graph"
    UseLineStatText="Line graph"
    SmallIsBadText="Small values are bad"
}