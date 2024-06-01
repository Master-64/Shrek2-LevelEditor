//================================================================================
// PotionBottles.
//================================================================================

class PotionBottles extends shpawn
  Config(User);

var() float RotSpeed;
var Class<Emitter> DestroyEmitterName;
var bool bSpawnPotionTimerOnBlowUp;
var bool bPotionBeginOnBlowUp;
var() array<Sound> BreakSounds;

function BlowUp()
{
}

function Landed(Vector N)
{
}

function HitWall(Vector HitNormal, Actor HitWall)
{
}

function FellOutOfWorld(Actor.eKillZType KillType)
{
}

defaultproperties
{
     RotSpeed=65535.000000
     bCanBePickedUp=True
     ControllerClass=Class'SHGame.PotionBottleController'
     DrawScale=5.000000
     bCollideActors=False
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
}
