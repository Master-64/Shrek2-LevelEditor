//================================================================================
// PotionObject.
//================================================================================

class PotionObject extends ShProps
  Config(User);

var int randTumble;
var Rotator NewRotation;
var bool bRotate;
var() bool bFirstHit;
var float Speed;
var() bool bBounce;
var Vector dampedVelocity;
var Vector savedNormal;
var() Sound sfxBounce;
var() Sound sfxLand;
var Vector startingVelocity;

function Landed(Vector HitNormal)
{
}

function HitWall(Vector HitNormal, Actor HitWall)
{
}

defaultproperties
{
     bFirstHit=True
     bBounce=True
     sfxBounce=Sound'Footsteps.F_shrek_leaf01'
     sfxLand=Sound'Footsteps.F_shrek_dirt03'
     StaticMesh=StaticMesh'Character_Props.potion_orange'
     bUnlit=True
     CollisionRadius=20.000000
     CollisionHeight=20.000000
	 DrawType=DT_StaticMesh
	 Physics=PHYS_Falling
}
