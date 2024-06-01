//================================================================================
// CatapultAmmo.
//================================================================================

class CatapultAmmo extends shpawn
  NotPlaceable
  Config(User);

var int DamageAmount;
var Class<Emitter> fxAmmoClass;
var Rotator CurrentRot;
var() Rotator UpdateRot;
var array<Sound> sfxLanded;
var array<Sound> sfxHitPlayer;

function Touch(Actor Other)
{
}

function HitSomething()
{
}

function SpawnParticles()
{
}

function Bump(Actor Other)
{
}

defaultproperties
{
     fxAmmoClass=Class'SHGame.Milk_Splat'
     UpdateRot=(Pitch=100,Yaw=100,Roll=1000)
     bCanBePickedUp=True
     bCollideActors=False
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
	 Physics=PHYS_Trailer
	 DrawType=DT_StaticMesh
	 StaticMesh=StaticMesh'10_Castle_Siege_SM.<Type New>.milk_barrell'
}
