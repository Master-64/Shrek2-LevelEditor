//================================================================================
// KWHudFadeSpinItem.
//================================================================================

class KWHudFadeSpinItem extends KWHudItemFade;

enum HUDSPINDRAWSTYLE {
  DrawActor,
  DrawTile
};

enum SPINBEHAVIOR {
  ALLWAYSSPINNING,
  SPINONEVENT
};

var int spinRate;
var SPINBEHAVIOR eSpinBehavior;
var HUDSPINDRAWSTYLE eDrawStyle;
var int iSpinAmount;
var int iHaveSpunAmount;
var int iElapsedRotation;
var bool AmSpinning;
var transient Vector vLook;
var int YawPlus;

function StartOneTimeRotation()
{
}

function DrawHudItem(Canvas Canvas)
{
}

defaultproperties
{
     bHoldIndefinitely=True
     bUnlit=True
}
