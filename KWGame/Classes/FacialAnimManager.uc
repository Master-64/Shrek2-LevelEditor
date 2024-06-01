//================================================================================
// FacialAnimManager.
//================================================================================

class FacialAnimManager extends Actor;

var transient KWPawn OwnerPawn;
var transient float HoldTime;
var transient name AnimName;
const FACIAL_ANIMCHANNEL= 24;

function PlayFacialAnim(string AnimNameString, float HoldTimeIn, optional float tweenTime)
{
}

defaultproperties
{
     bHidden=True
}
