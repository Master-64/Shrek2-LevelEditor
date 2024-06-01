//================================================================================
// SHHud.
//================================================================================

class SHHud extends KWHud
  Config(User);

var Font SHBigFont;
var Font SHMedFont;
var Font SHSmallFont;
var Font SHTinyFont;
var Font SHBigArielFont;
var Font SHMedArielFont;
var Font SHSmallArielFont;
var Font SHTinyArielFont;
var Texture Loadimage;
var Texture saveimage;
var Texture loadimagesolid;
var Texture blackimage;

function SetupLanguage(Canvas Canvas)
{
}

function InitHudItems()
{
}

function Font GetHudTextFont(Canvas Canvas)
{
}

function Font GetSmallHudTextFont(Canvas Canvas)
{
}

function float GetScaleXNoCanvas()
{
}

function float GetScaleYNoCanvas()
{
}

function int GetCanvasSizeX()
{
}

function int GetCanvasSizeY()
{
}

function SetHudTimer(Actor aOther, float NewTimerRate, bool bLoop)
{
}

function ClearHudTimer()
{
}

function SetPotionTimer(Actor aOther, float NewTimerRate, bool bLoop)
{
}

function ClearPotionTimer()
{
}

function ShowTimesUpBar()
{
}

function HideTimesUpBar()
{
}

function bool DrawLevelAction(Canvas C)
{
}

defaultproperties
{
     fBaseResX=1024.000000
     fBaseResY=768.000000
     PausedMessage=""
}
