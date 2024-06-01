//================================================================================
// SavePointFairy.
//================================================================================

class SavePointFairy extends SHCharacter
  Config(User);

var() Class<Emitter> fxWandClass;
var() Vector fxWandOffset;
var() Class<Emitter> fxTrailClass;
var Emitter TrailParticles;
var() Rotator Trailrot;
var() int HeroActivateDistance;
var SHSavePoint mysavepoint;
var() string LoadString;
var() bool HasSaved;
var() Sound sfxSave;

function SpawnTrailingParticles()
{
}

function JumpOffPawn()
{
}

function SpawnWandParticles()
{
}

event HitWall(Vector HitNormal, Actor Wall)
{
}

function Touch(Actor Other)
{
}

defaultproperties
{
     fxTrailClass=Class'SHGame.Save_Fairy'
     Trailrot=(Pitch=-16384)
     HeroActivateDistance=7000
     LoadString="ShrekCharacters.Fairy"
     sfxSave=Sound'UI.SaveGame'
     bUseBlobShadow=True
     AirSpeed=300.000000
     AccelRate=80000.000000
     ControllerClass=Class'SHGame.SavePointFairycontroller'
     bActorShadows=True
     Mesh=SkeletalMesh'ShrekCharacters.fairy'
     DrawScale=1.500000
     bUnlit=True
     CollisionRadius=25.000000
     CollisionHeight=30.000000
     bBlockPlayers=False
	 Physics=PHYS_None
}
