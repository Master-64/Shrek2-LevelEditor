//================================================================================
// KWHudItemFade.
//================================================================================

class KWHudItemFade extends KWHudItem;

var float fCurrFadeInTime;
var float fCurrFadeOutTime;
var float fCurrHoldTime;
var float fTotalFadeInTime;
var float fTotalFadeOutTime;
var float fTotalHoldTime;
var bool bHoldIndefinitely;

function int CalcFadeValue(bool bIn, float fCurrTime, float fTotalTime)
{
}

function float GetTimeRatio(float fCurrTime, float fTotalTime)
{
}

function DoFadeInAndOut()
{
}

function DoFadeOut()
{
}

function DoFadeIn()
{
}

function int GetFadeValue()
{
}

function Color GetDrawColor()
{
}

defaultproperties
{
     fTotalFadeInTime=0.500000
     fTotalFadeOutTime=0.500000
     fTotalHoldTime=3.000000
}
