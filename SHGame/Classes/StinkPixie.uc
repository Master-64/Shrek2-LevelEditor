//================================================================================
// StinkPixie.
//================================================================================

class StinkPixie extends SHCharacter
  Placeable
  Config(User);

enum EffectRadius {
  small,
  large
};

var() Class<Emitter> fxWandClass;
var() Vector fxWandOffset;
var() Class<Emitter> fxTrailClass;
var Emitter TrailParticles;
var() Class<Emitter> fxDeathClass;
var() int killradius;
var() int SmallKillRadius;
var() int LargeKillRadius;
var() StinkPixie.EffectRadius KillType;

function SpawnTrailingParticles()
{
}

function SpawnWandParticles()
{
}

function SpawnDeathParticles(Actor ac)
{
}

function JumpOffPawn()
{
}

event HitWall(Vector HitNormal, Actor Wall)
{
}

defaultproperties
{
     fxTrailClass=Class'SHGame.Save_Fairy'
     fxDeathClass=Class'SHGame.Potbot_Explod'
     SmallKillRadius=1024
     LargeKillRadius=2048
     AirSpeed=300.000000
     AccelRate=80000.000000
     ControllerClass=None
     MovementAnims(0)="flyloop"
     MovementAnims(1)="flyloop"
     MovementAnims(2)="flyloop"
     MovementAnims(3)="flyloop"
     Mesh=SkeletalMesh'ShrekCharacters.fairy'
     bUnlit=True
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
	 Physics=PHYS_None
}
