//*******************************************************************************
//* UWindowMenuBar generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//* 
//* All rights belong to their respective owners.
//* ******************************************************************************
class UWindowMenuBar extends UWindowListControl;

var UWindowMenuBarItem Selected;
var UWindowMenuBarItem Over;
var bool bAltDown;
var int Spacing;

function Created();

function UWindowMenuBarItem AddHelpItem(string Caption);

function UWindowMenuBarItem AddItem(string Caption);

function ResolutionChanged(float W, float H);

function Paint(Canvas C, float MouseX, float MouseY);

function MouseMove(float X, float Y);

function MouseLeave();

function Select(UWindowMenuBarItem i);

function LMouseDown(float X, float Y);

function DrawItem(Canvas C, UWindowList item, float X, float Y, float W, float H);

function DrawMenuBar(Canvas C);

function CloseUp();

function Close(optional bool bByParent);

function UWindowMenuBar GetMenuBar();

function bool HotKeyDown(int Key, float X, float Y);

function bool HotKeyUp(int Key, float X, float Y);

function KeyDown(int Key, float X, float Y);

function MenuCmd(int Menu, int item);

function MenuItemSelected(UWindowBase Sender, UWindowBase item);
