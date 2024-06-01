//================================================================================
// PotionSpawner.
//================================================================================

class PotionSpawner extends ShProps
  Config(User);

#exec TEXTURE IMPORT NAME=PotionSpawner FILE=Texture\PotionSpawner.tga FLAGS=2

var() Class<Emitter> fxClass;
var() float SpawnPeriod;
var() Class<Emitter> fxPotionLandedClass;
var() Vector SpawnOffset;
var() Vector fxOffset;
var() int LandingsTillDestroyed;
var() bool bKillByDestroyer;
var() int MaxNumPotions;
var int NumCurrentPotions;

defaultproperties
{
     fxClass=Class'SHGame.Potbot_Explod'
     SpawnPeriod=4.000000
     fxPotionLandedClass=Class'SHGame.Potbot_Explod'
     bKillByDestroyer=True
     MaxNumPotions=5
     CollisionRadius=10.000000
     CollisionHeight=10.000000
     bCollideActors=False
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
	 DrawType=DT_Sprite
	 Texture=Texture'PotionSpawner'
}
