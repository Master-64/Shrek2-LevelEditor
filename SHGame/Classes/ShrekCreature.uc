//================================================================================
// ShrekCreature.
//================================================================================

class ShrekCreature extends ShHeroPawn
  Config(User);

var string MeshNameString;
var int BlendOutLandingFrame;
var float ParentCollisionHeight;
var float fLiveInBFGM;

function AddAnimNotifys()
{
}

function bool TraceUpForTable()
{
}

function bool IsTrailingChar()
{
}

event bool Mount(Vector Delta, Actor A)
{
}

function bool DoJump(bool bUpdating)
{
}

function DoDoubleJump(bool bUpdating)
{
}

function bool MovingForward()
{
}

defaultproperties
{
     DefaultPlayerControllerClass=Class'SHGame.ShrekController'
     WalkAnims(0)="run"
     WalkAnims(1)="runbackward"
     WalkAnims(2)="StrafeLeft"
     WalkAnims(3)="StrafeRight"
     LandAnims(0)="land"
     LandAnims(1)="land"
     AirStillAnim="Fall"
     RunAnimName="run"
     WalkAnimName="run"
     KnockBackAnimName="knockback"
     bCanBlink=False
     IdleAnims(0)="Idle"
     IdleAnims(1)="Idle"
     IdleAnims(2)="Idle"
     IdleAnims(3)="Idle"
     IdleAnims(4)="Idle"
     IdleAnims(5)="Idle"
     IdleAnims(6)="Idle"
     IdleAnims(7)="Idle"
     ControllerClass=Class'SHGame.SHCompanionController'
     TurnLeftAnim="Idle"
     TurnRightAnim="Idle"
}
