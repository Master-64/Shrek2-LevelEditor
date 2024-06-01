//*******************************************************************************
//* WindowConsole generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//* 
//* All rights belong to their respective owners.
//* ******************************************************************************
class WindowConsole extends Console
    config;

const MaxLines = 64;
const TextMsgSize = 128;

var Viewport Viewport;
var int Scrollback;
var int numLines;
var int TopLine;
var int TextLines;
var float MsgTime;
var float MsgTickTime;
var string MsgText[64];
var float MsgTick[64];
var int ConsoleLines;
var float ConsolePos;
var float ConsoleDest;
var bool bNoStuff;
var bool bTyping;
var bool bNoDrawWorld;
var UWindowRootWindow Root;
var() config string RootWindow;
var float OldClipX;
var float OldClipY;
var bool bCreatedRoot;
var float MouseX;
var float MouseY;
var class<UWindowConsoleWindow> ConsoleClass;
var config float MouseScale;
var config bool ShowDesktop;
var config bool bShowConsole;
var bool bBlackout;
var bool bUWindowType;
var bool bUWindowActive;
var bool bQuickKeyEnable;
var bool bLocked;
var bool bLevelChange;
var string OldLevel;
var config Interactions.EInputKey UWindowKey;
var UWindowConsoleWindow ConsoleWindow;

function ResetUWindow();

function bool KeyEvent(Interactions.EInputKey Key, Interactions.EInputAction Action, float Delta);

function ShowConsole();

function HideConsole();

event Tick(float Delta);

function ToggleUWindow();

function LaunchUWindow();

function CloseUWindow();

function CreateRootWindow(Canvas Canvas);

function RenderUWindow(Canvas Canvas);

event Message(coerce string Msg, float MsgLife);

function UpdateHistory();

function HistoryUp();

function HistoryDown();

function NotifyLevelChange();

state UWindow{}

defaultproperties
{
    RootWindow="UWindow.UWindowRootWindow"
    ConsoleClass=Class'UWindowConsoleWindow'
    MouseScale=0.6
    ConsoleKey=192
}