//================================================================================
// LaserBeamSideToSide.
//================================================================================

class LaserBeamSideToSide extends ShProps
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
     beamRotation=(Pitch=57886,Yaw=16470,Roll=11160)
     beamLocation=(X=2.000000,Y=-264.500000,Z=224.699997)
     fakeBeamRotation=(Pitch=7740,Yaw=10080,Roll=11790)
     fakeBeamLocation=(X=4.000000,Y=-49.500000,Z=37.700001)
     Mesh=SkeletalMesh'EnvAnims.laser_base_2'
     CollisionRadius=4.000000
     CollisionHeight=4.000000
     bBlockActors=False
     bBlockPlayers=False
}
