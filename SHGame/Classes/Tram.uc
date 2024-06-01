//================================================================================
// Tram.
//================================================================================

class Tram extends MongoPickup
  Placeable
  Config(User);

var Vector Loc;
var Rotator Rot;
var string RName;
var() Class<Emitter> DestroyTramEmitter;
var() float BumpLineDist;
var bool bBumpLineDone;
var() Sound TramPickupSound;
var() Sound TramDestroySound;

function PlayTramPickupSound()
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function SpawnAndSetNewTram()
{
}

function Bump(Actor Other)
{
}

function TramIsOver(bool bEffect)
{
}

function Landed(Vector HitNormal)
{
}

defaultproperties
{
     DestroyTramEmitter=Class'SHGame.Dust_Cloud'
     BumpLineDist=500.000000
     TramPickupSound=Sound'The_Seige.trolley_throw'
     TramDestroySound=Sound'The_Seige.trolley_hit_bridge'
     bCanBePickedUp=True
     IdleAnimName="Moving"
     GroundRunSpeed=100.000000
     ControllerClass=Class'SHGame.TramController'
     Mesh=SkeletalMesh'EnvAnims.tour_cart'
     CollisionRadius=230.000000
	 CollisionWidth=60.00
     CollisionHeight=80.000000
	 CollideType=CT_Box
     bBlockActors=False
     bBlockPlayers=False
     RotationRate=(Yaw=1024)
	 bAlignBottom=False
	 Physics=PHYS_Walking
}
