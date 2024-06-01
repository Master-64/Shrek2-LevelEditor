//================================================================================
// BaseCamTarget.
//================================================================================

class BaseCamTarget extends KWPawn
  Config(User);

var PlayerController Player;
var Actor aAttachedTo;
var Vector vDestLocation;
var Vector VOffset;
var Rotator rOffset;
var bool bRelative;
var BaseCam cam;
var bool bDebug;

function bool IsAttached()
{
}

function SetOffset(Vector V)
{
}

function SetXOffset(float X)
{
}

function SetYOffset(float Y)
{
}

function SetZOffset(float Z)
{
}

function SetROffset(Rotator R)
{
}

function SetPitchOffset(int Pitch)
{
}

function SetAttachedTo(Actor A)
{
}

function bool SetAttachedToByName(name nName, optional bool smooth)
{
}

function PossessedBy(Controller C)
{
}

function UnPossessed()
{
}

function SetMovementPhysics()
{
}

function SetNewRotation(Rotator Rot)
{
}

function UpdateOrientation(optional float fTimeDelta, optional float TimeToTake)
{
}

function PreCutPossess()
{
}

function PostCutUnPossess()
{
}

defaultproperties
{
     bRelative=True
     AirSpeed=100.000000
     bHidden=False
     Tag="Target"
     bCollideActors=False
     bCollideWorld=False
}
