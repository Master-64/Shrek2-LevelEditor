//================================================================================
// LaserBeamUpDown.
//================================================================================

class LaserBeamUpDown extends ShProps
  Config(User);

var() float LaserLength;
var() float animSpeed;
var() float DamageAmount;
var LaserBeam Beam;
var Rotator beamRotation;
var Vector beamLocation;
var Rotator fakeBeamRotation;
var Vector fakeBeamLocation;
var bool bAttachedToBone;

function SetFXLocation(Vector V)
{
}

function SetFXRotation(Rotator R)
{
}

defaultproperties
{
     LaserLength=1.000000
     animSpeed=1.000000
     DamageAmount=10.000000
     beamRotation=(Pitch=49152,Roll=16114)
     beamLocation=(X=7.200000,Y=-17.799999,Z=304.100006)
     fakeBeamRotation=(Roll=16384)
     fakeBeamLocation=(X=6.200000,Y=-12.800000,Z=30.100000)
     Mesh=SkeletalMesh'EnvAnims.laser_base_1'
     CollisionRadius=4.000000
     CollisionHeight=4.000000
     bBlockActors=False
     bBlockPlayers=False
}
