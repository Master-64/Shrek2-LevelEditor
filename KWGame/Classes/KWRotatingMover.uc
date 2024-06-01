//================================================================================
// KWRotatingMover.
//================================================================================

class KWRotatingMover extends KWMover;

var Rotator DefRotationRate;

defaultproperties
{
     Physics=PHYS_Rotating
	 InitialState="MoverRotating"
     bFixedRotationDir=True
}
