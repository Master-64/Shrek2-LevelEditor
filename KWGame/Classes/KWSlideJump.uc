//================================================================================
// KWSlideJump.
//================================================================================

class KWSlideJump extends KWSlideActors;

var() name TagOfJumpDest;
var Actor JumpDest;
var() float AlternateJumpAngle;
var() bool bUseFallingSpeedAsGroundSpeedOnLand;
var() bool bBlockSpeedInputDuringJump;

defaultproperties
{
}
