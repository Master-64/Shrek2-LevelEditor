//*******************************************************************************
//* UGraphCollisionPage generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************/
class UGraphCollisionPage extends UWindowPageWindow
    config(CollisionOptions);

var UWindowLabelControl Labels[4];
var localized string StatNameText[4];
var localized string CatNameText;
var UWindowEditControl DesiredMaxEdit[4];
var localized string DesiredMaxText;
var UWindowCheckbox UseBarStatCheck[4];
var localized string UseBarStatText;
var UWindowCheckbox UseLineStatCheck[4];
var localized string UseLineStatText;
var UWindowCheckbox SmallIsBadCheck[4];
var localized string SmallIsBadText;
var config string DesiredMaxEditSettings[4];
var config int SmallIsBadSettings[4];
var config int UseBarStatSettings[4];
var config int UseLineStatSettings[4];
var bool bIsLoading;
var bool bShouldDelayChange;

function Created();

function Notify(UWindowDialogControl C, byte E);

function Change(int nIndex);

defaultproperties
{
    StatNameText[0]="BSP"
    StatNameText[1]="Terrain"
    StatNameText[2]="Corona"
    StatNameText[3]="Collision"
    CatNameText="Collision"
    DesiredMaxText="Target Max"
    UseBarStatText="Bar graph"
    UseLineStatText="Line graph"
    SmallIsBadText="Small values are bad"
}