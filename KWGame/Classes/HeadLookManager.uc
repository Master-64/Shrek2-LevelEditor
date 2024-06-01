//================================================================================
// HeadLookManager.
//================================================================================

class HeadLookManager extends Actor;

var transient bool bEnabled;
var transient KWPawn OwnerPawn;
var transient Actor LookTarget;
var transient bool bTurnToTrack;
var transient bool bIgnoreWhenTrackLost;
var transient name CurrentState;
var transient Rotator LastHeadRot;
enum EHeadLookMode {
  HL_NotLooking,
  HL_ScanEnvironment,
  HL_LockOnActor
};

const HEADLOOK_ANIMCHANNEL= 23;
const TurnRate= 3.0;
const MaxHeadTiltPitch= 5000;
const MinHeadTiltPitch= -5000;
const MaxNeckTurnYaw= 10000;
const MinNeckTurnYaw= -10000;

function EnableHeadLook(bool bEnableIn)
{
}

function bool IsHeadLookEnabled()
{
}

function SetParameters(bool bTurnToTrackIn, bool bIgnoreWhenTrackLostIn)
{
}

function ScanEnvironment()
{
}

function LockOnActor(Actor LockTargetIn)
{
}

function StopLooking()
{
}

defaultproperties
{
     bHidden=True
}
