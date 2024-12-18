//*******************************************************************************
//* UGraphMatineePage generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************/
class UGraphMatineePage extends UWindowPageWindow
    config(MatineeOptions);

var UWindowLabelControl Labels;
var localized string StatNameText;
var localized string CatNameText;
var UWindowEditControl DesiredMaxEdit;
var localized string DesiredMaxText;
var UWindowCheckbox UseBarStatCheck;
var localized string UseBarStatText;
var UWindowCheckbox UseLineStatCheck;
var localized string UseLineStatText;
var UWindowCheckbox SmallIsBadCheck;
var localized string SmallIsBadText;
var config string DesiredMaxEditSettings;
var config int SmallIsBadSettings;
var config int UseBarStatSettings;
var config int UseLineStatSettings;
var bool bIsLoading;
var bool bShouldDelayChange;

function Created();

function Notify(UWindowDialogControl C, byte E);

function Change(int nIndex);

defaultproperties
{
    StatNameText="Skin"
    CatNameText="Matinee"
    DesiredMaxText="Target Max"
    UseBarStatText="Bar graph"
    UseLineStatText="Line graph"
    SmallIsBadText="Small values are bad"
}