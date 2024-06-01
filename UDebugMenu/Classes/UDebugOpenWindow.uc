//*******************************************************************************
//* UDebugOpenWindow generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************/
class UDebugOpenWindow extends UWindowFramedWindow;

var UWindowSmallCloseButton CloseButton;
var UWindowSmallButton OKButton;
var localized string OKText;

function Created();

function Resized();

function BeforePaint(Canvas C, float X, float Y);

function Paint(Canvas C, float X, float Y);

defaultproperties
{
    OKText="OK"
    ClientClass=Class'UDebugOpenCW'
    WindowTitle="Open Location"
}