//================================================================================
// Birds.
//================================================================================

class Birds extends TransientAmbientCreature
  Abstract;

var() int MinFlockSize;
var() int MaxFlockSize;

defaultproperties
{
    MinSpawnDist=1500
    MaxSpawnDist=15000
    SoundRadius=32
    SoundVolume=32
    CollisionRadius=80
    CollisionHeight=60
    bCollideWorld=true
}