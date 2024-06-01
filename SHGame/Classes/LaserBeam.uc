//================================================================================
// LaserBeam.
//================================================================================

class LaserBeam extends ShProps
  Config(User);

var bool bTouched;
var() float TouchDelay;
var float TouchDelayCounter;
var bool bStartReappearTimer;
var() float Length;
var() float DamageAmount;
var LaserBeamHitEffect fakeLaser;
var() name BoneName;
var shpawn OwnerPawn;
var bool bAttachedToBone;
var Vector beamLocation;
var Rotator beamRotation;
var Rotator fakeBeamRotation;
var Vector fakeBeamLocation;
var() Class<Emitter> fxSmokeClass;
var Emitter smokeFX;
var bool bSmokeOn;
var float myDefaultLength;
var(sounds) array<Sound> sfxReappear;
var(sounds) array<Sound> sfxTouch;
var name bumpHitHero;
var float moveNum;

function bool GiveDamageToBase(Actor Base)
{
}

function GetBumpSets()
{
}

function SizeLaser(Actor Other)
{
}

function ShowSmoke()
{
}

function ShowHitSmoke(Actor Other)
{
}

function StopSmoke()
{
}

function SetFXLocation(Vector V)
{
}

function SetFXRotation(Rotator R)
{
}

defaultproperties
{
     TouchDelay=1.000000
     Length=0.100000
     DamageAmount=10.000000
     fxSmokeClass=Class'SHGame.Torch_Burn'
     sfxReappear(0)=Sound'FGM_laboratory.laser_base_movement_large'
     sfxReappear(1)=Sound'FGM_laboratory.laser_base_movement_small'
     sfxTouch(0)=Sound'Items.flower_poison'
     sfxTouch(1)=Sound'Items.flower_poison'
     moveNum=1.000000
     Mesh=SkeletalMesh'EnvAnims.laser_beam'
     bUnlit=True
     CollisionRadius=13.700000
	 CollisionWidth=4.00
     CollisionHeight=4.000000
	 CollideType=CT_Box
     bBlockActors=False
     bBlockPlayers=False
}
