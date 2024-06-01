//================================================================================
// Lrg_Light_Beam.
//================================================================================

class Lrg_Light_Beam extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=BeamEmitter0 class=BeamEmitter
        BeamDistanceRange=(Min=1,Max=4)
        BeamEndPoints(0)=(ActorTag="None",offset=(X=(Min=1,Max=2),Y=(Min=1,Max=2),Z=(Min=1,Max=2)),Weight=2)
        Acceleration=(X=-10,Y=-10,Z=-10)
        MaxParticles=3
        ParticlesPerSecond=2
        InitialParticlesPerSecond=2
        Texture=Texture'Shrek2_EFX.Gen_Particle.beams'
        LifetimeRange=(Min=20,Max=20)
        StartVelocityRange=(X=(Min=40,Max=80),Y=(Min=40,Max=80),Z=(Min=-200,Max=-200))
        RelativeWarmupTime=3
    end object
    Emitters(0)=BeamEmitter0
    fTimeSoFar=1688.281
}
