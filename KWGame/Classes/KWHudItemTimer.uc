//================================================================================
// KWHudItemTimer.
//================================================================================

class KWHudItemTimer extends KWHudItemFade;

var float DST_W;
var float DST_H;
var float DST_BAR_L;
var float DST_BAR_T;
var float DST_BAR_W;
var float DST_BAR_H;
var float SRC_BAR_L;
var float SRC_BAR_W;
var float SRC_BAR_H;
var bool Loop;
var float Length;
var float Current;
var bool Active;
var bool StartEmpty;
var bool LeftToRight;
var float dstLeft;
var float dstTop;
var Texture textureEmpty;

function SetHudTimer(Actor aOther, float NewTimerRate, bool bLoop)
{
}

function StopHudTimer()
{
}

function ClearHudTimer()
{
}

defaultproperties
{
     DST_W=0.130000
     DST_H=0.170000
     DST_BAR_L=0.760000
     DST_BAR_W=0.090000
     DST_BAR_H=0.170000
     SRC_BAR_L=10.000000
     SRC_BAR_W=76.000000
     SRC_BAR_H=100.000000
     LeftToRight=True
     dstLeft=0.750000
}
