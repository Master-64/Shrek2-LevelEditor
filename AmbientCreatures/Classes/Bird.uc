//================================================================================
// Bird.
//================================================================================

class Bird extends TransientAmbientPawn
  Config(User);

var float Angle;
var bool bDirection;
var() bool bDestroyIfHitWall;
var float CircleRadius;
var float HeightOffset;

function GlideOrFly(Vector Dest)
{
}

function PlayMoving()
{
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
}

function float GetSleepTime()
{
}

function PlayCall()
{
}

function HitWall(Vector HitNormal, Actor HitWall)
{
}

defaultproperties
{
    CircleRadius=600
    AirSpeed=500
    AccelRate=800
    Health=1
    LandMovementState=PlayerFlying
    Physics=PHYS_Flying
    Mesh=SkeletalMesh'SmallBird'
    CollisionRadius=28
    CollisionHeight=16
    bCollideActors=true
    bBlockActors=true
    bBlockPlayers=true
    bProjTarget=true
    RotationRate=(Pitch=12000,Yaw=20000,Roll=12000)
}