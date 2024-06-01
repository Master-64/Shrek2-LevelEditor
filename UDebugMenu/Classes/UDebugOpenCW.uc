//*******************************************************************************
//* UDebugOpenCW generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************/
class UDebugOpenCW extends UWindowDialogClientWindow
    config;

var UWindowComboControl OpenCombo;
var localized string OpenText;
var localized string OpenHelp;
var config string OpenHistory[10];

function Created();

function Notify(UWindowDialogControl C, byte E);

function OpenURL();

defaultproperties
{
    OpenText="Open:"
    OpenHelp="Enter a standard URL, or select one from the URL history.  Press Enter to activate."
}