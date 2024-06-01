//================================================================================
// HoleInGroundItems.
//================================================================================

class HoleInGroundItems extends ShProps
  Config(User);

var int randTumble;
var Rotator NewRotation;
var() bool bRotate;
var bool bLandedOnce;
var() Sound sfxBounce;
var() Sound sfxLand;
var Vector startingVelocity;

function Landed(Vector HitNormal)
{
}

function SpawnStuff(Class typeOfStuff)
{
}

defaultproperties
{
     bRotate=True
     bShouldBaseAtStartup=False
     CollisionRadius=15.000000
     CollisionHeight=2.000000
}
