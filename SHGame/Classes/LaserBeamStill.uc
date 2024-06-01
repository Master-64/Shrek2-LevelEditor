//================================================================================
// LaserBeamStill.
//================================================================================

class LaserBeamStill extends ShProps
  Config(User);

var() float LaserLength;
var() float DamageAmount;
var LaserBeam Beam;
var Rotator beamRotation;
var Vector beamLocation;
var Rotator fakeBeamRotation;
var Vector fakeBeamLocation;
var bool bAttachedToBone;
var Rotator straightRotation;

function SetFXLocation(Vector V)
{
}

function SetFXRotation(Rotator R)
{
}

defaultproperties
{
     LaserLength=1.000000
     DamageAmount=10.000000
     beamRotation=(Pitch=47986,Yaw=51300,Roll=23850)
     beamLocation=(X=0.700000,Y=-12.500000,Z=70.000000)
     fakeBeamRotation=(Pitch=540,Yaw=30330,Roll=17460)
     fakeBeamLocation=(X=-0.700000,Y=-1.500000,Z=2.000000)
     Mesh=SkeletalMesh'EnvAnims.laser_base'
     DrawScale=2.000000
     CollisionRadius=4.000000
     CollisionHeight=4.000000
     bBlockActors=False
     bBlockPlayers=False
}
