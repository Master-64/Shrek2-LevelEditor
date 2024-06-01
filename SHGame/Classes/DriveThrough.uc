//================================================================================
// DriveThrough.
//================================================================================

class DriveThrough extends ShProps
  Config(User);

var() float AliveDistance;
var() float TauntDistance;
var() float TalkingDistance;
var() bool IntroPlayed;
var() Class<Emitter> fxTrailClass;
var Emitter TrailParticles;

function SpawnTrailingParticles()
{
}

function ChooseTauntBehavior()
{
}

function ChooseIdleBehavior()
{
}

function ActivateVendor()
{
}

function bool IsHeroInFront()
{
}

defaultproperties
{
     AliveDistance=5096.000000
     TauntDistance=1024.000000
     TalkingDistance=400.000000
     fxTrailClass=Class'SHGame.FGM_Pixie'
     bCouldBeAttacked=True
     Mesh=SkeletalMesh'EnvAnims.drivethru'
     CollisionRadius=50.000000
     CollisionHeight=80.000000
}
