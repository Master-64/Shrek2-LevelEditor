//================================================================================
// SuperSoaker.
//================================================================================

class SuperSoaker extends ShProps
  Config(User);

enum E_FrameStatus {
  milk_off,
  milk_on
};

var() float animSpeed;
var() int DamageAmount;
var bool bAttachedToBone;
var Vector boneLocation;
var Rotator boneRotation;
var int numFrames;
var MilkBlob milk;
var() string LoadString;
var(sounds) array<Sound> sfxShoot;
var() E_FrameStatus frameStatus[40];
var() float shootTime;
var() float Distance;
var() bool bActive;

function AddAnimNotifys()
{
}

function Trigger(Actor Other, Pawn EventInstigator)
{
}

function AnimNotifyShoot()
{
}

function OnEvent(name EventName)
{
}

function DamagePlayer(Vector HitLocation, class<DamageType> DamageType)
{
}

defaultproperties
{
     animSpeed=0.200000
     DamageAmount=5
     numFrames=40
     LoadString="EnvAnims.Milk_Turret"
     sfxShoot(0)=Sound'The_Seige.supersoaker_click_spray1'
     sfxShoot(1)=Sound'The_Seige.supersoaker_click_spray2'
     shootTime=0.400000
     Distance=600.000000
     bActive=True
     bStasis=False
     Mesh=SkeletalMesh'EnvAnims.milk_turret'
     CollisionRadius=4.000000
     CollisionHeight=4.000000
     Mass=150.000000
}
