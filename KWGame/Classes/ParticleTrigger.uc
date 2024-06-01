//================================================================================
// ParticleTrigger.
//================================================================================

class ParticleTrigger extends Dispatcher;

#exec TEXTURE IMPORT NAME=ParticleTrigger FILE=Texture\ParticleTrigger.tga FLAGS=2

var(Dispatcher) bool bParticleInstant;

function EnableEmission(Emitter pFX)
{
}

defaultproperties
{
     Texture=Texture'ParticleTrigger'
}
