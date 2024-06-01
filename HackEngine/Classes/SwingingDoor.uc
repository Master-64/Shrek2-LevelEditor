//================================================================================
// SwingingDoor.
//================================================================================

class SwingingDoor extends Mover
    placeable;

enum EOpenDirection
{
    OPEN_TwoWay,
    OPEN_Out,
    OPEN_In
};

var() SwingingDoor.EOpenDirection SwingDirection;
var() bool bLocked;
var() float OpenForce;
var() float BumpForce;
var() float YawFriction;
var() bool bNeverClose;
var() float ImpactBounce;
var() name DoorOpenEvent;
var() name DoorClosedEvent;
var() Sound LockedSound;
var() Sound FrameImpactSound;
var() bool bCanBePushed;
var() float TimeBeforeClose;
var() bool bUnlockOnTrigger;
var() bool bLockOnTrigger;
var() bool bOpenOnTrigger;
var int BaseYaw;
var int DoorKeys;
var int OpenDirection;
var Rotator RotationForce;
var Rotator RotationVelocity;
var Rotator RotationFriction;
var() bool MoveByForce;
var bool bClosed;

function RestoreAntiPortals();

event BeginPlay();

event DoorFrameImpactSound();

function SendDoorClosedEvent();

function AddForce(float Force, Actor Other);

function InitPhysics();

function bool IsDoorClosed();

defaultproperties
{
    OpenForce=20000
    BumpForce=20000
    YawFriction=10000
    ImpactBounce=-0.4
    bCanBePushed=true
    TimeBeforeClose=3
    bOpenOnTrigger=true
    MoverEncroachType=1
    StayOpenTime=3
    DelayTime=0.1
    InitialState=SwingDoor
}