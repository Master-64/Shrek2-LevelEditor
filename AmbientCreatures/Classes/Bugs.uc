//================================================================================
// Bugs.
//================================================================================

class Bugs extends TransientAmbientCreature;

var() float SwarmTightness;

function SetSwarmTightness()
{
}

function float GetSwarmTightness()
{
}

function float MaxHiddenTime()
{
}

function Possess(Pawn aPawn)
{
}

defaultproperties
{
    SwarmTightness=0.8
    PredatorType=Class'WanderingBirds'
    bOffCameraSpawns=false
    NumSlaves=19
    SoundRadius=32
    SoundVolume=32
    CollisionRadius=50
    CollisionHeight=20
    bCollideWorld=true
}