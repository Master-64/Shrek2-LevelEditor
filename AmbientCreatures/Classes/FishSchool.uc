//================================================================================
// FishSchool.
//================================================================================

class FishSchool extends TransientAmbientCreature;

function Vector InitialLocation(Vector CurrentLocation)
{
}

function float MaxHiddenTime()
{
}

function Possess(Pawn aPawn)
{
}

function Vector PickDestination(TransientAmbientPawn P)
{
}

function PickSlaveDestination(TransientAmbientPawn P)
{
}

defaultproperties
{
    PawnTypes=Class'BiterFish'
    bOffCameraSpawns=false
    bUnderWaterCreatures=true
    NumSlaves=19
    SoundRadius=32
    SoundVolume=32
    CollisionRadius=50
    CollisionHeight=40
    bCollideWorld=true
}