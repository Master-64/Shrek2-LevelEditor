//*******************************************************************************
//* UWindowVSplitter generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//* 
//* All rights belong to their respective owners.
//* ******************************************************************************
class UWindowVSplitter extends UWindowWindow;

var UWindowWindow TopClientWindow;
var UWindowWindow BottomClientWindow;
var bool bSizing;
var float SplitPos;
var float MinWinHeight;
var float MaxSplitPos;
var float OldWinHeight;
var bool bBottomGrow;
var bool bSizable;

function Created();

function Paint(Canvas C, float X, float Y);

function BeforePaint(Canvas C, float X, float Y);

function LMouseDown(float X, float Y);

function MouseMove(float X, float Y);

defaultproperties
{
    bSizable=true
}