//================================================================================
// PickupWheel.
//================================================================================

class PickupWheel extends ShProps
  Placeable;

var Vector vDir;
var Vector LandedNormal;
var() float bounceHeight;
var() Sound sfxLand;
var() Sound sfxBounce;
var Rotator rollRotation;

function Landed(Vector HitNormal)
{
}

defaultproperties
{
     bounceHeight=120.000000
     sfxLand=Sound'soundeffects.wheel_drop'
     sfxBounce=Sound'soundeffects.wheel_hit'
     Mesh=SkeletalMesh'EnvAnims.carraigewheel'
     DrawScale=1.500000
     CollisionRadius=35.000000
     CollisionHeight=35.000000
	 Physics=PHYS_Walking
}
