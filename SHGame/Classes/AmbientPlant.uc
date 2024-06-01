//================================================================================
// AmbientPlant.
//================================================================================

class AmbientPlant extends LandingObject
  Config(User);

var() float BobbingAmplitude;
var() float BobbingSpeed;
var() bool bBobbing;
var Vector vLoc;
var float fBobAmount;
var float fCycleTime;
var name AmbPlantIdleAnimName;
var name AmbPlantBounceAnimName;

defaultproperties
{
     BobbingAmplitude=10.000000
     BobbingSpeed=3.000000
     AmbPlantIdleAnimName="Idle"
     AmbPlantBounceAnimName="Bounce"
     bCanBeBaseForPawns=True
}
