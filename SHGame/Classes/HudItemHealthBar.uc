//================================================================================
// HudItemHealthBar.
//================================================================================

class HudItemHealthBar extends KWHudItem;

const IconVSIZE= 128;
const IconUSIZE= 512;
const BarVSIZE= 64;
const BarUSIZE= 64;
const GLOW_SCALE= 1.2;
var float PlayerHealth;
var Texture textureHealth;
var Texture textureback;
var Texture texturelow;
var Texture Glow[5];
var int GlowFrame;
var bool GlowIncrease;
var Sound GlowSound;
var float Glow_L;
var float Glow_T;
var float Glow_W;
var float Glow_H;
var int LastCanvasSizeX;
var bool UpdateRequired;
var array<int> BarSize;
var int NumIcons;
var array<string> BarIcons;
var float Bar_L;
var float Bar_T;
var float Bar_W;
var float Bar_H;
var float Icon_L;
var float Icon_T;
var float Icon_W;
var float Icon_H;

function UpdateHealthIconStatus()
{
}

function SetHealthStatusVars()
{
}

function RenderHud(Canvas Canvas)
{
}

function RenderGlow(Canvas Canvas)
{
}

function UpdateSizing(Canvas C)
{
}

function UpdateIconSizing(Canvas Canvas)
{
}

function UpdateGlowSizing(Canvas C)
{
}

defaultproperties
{
     NumIcons=1
}
