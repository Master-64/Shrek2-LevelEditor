//================================================================================
// Env_BLight.
//================================================================================

class Env_BLight extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        Opacity=0.25
        CoordinateSystem=PTCS_Relative
        MaxParticles=4
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.25,Max=0.25),Y=(Min=0.25,Max=0.25),Z=(Min=0.25,Max=0.25))
        UniformSize=true
        InitialParticlesPerSecond=5000
        Texture=Texture'Shrek2_EFX.Gen_Particle.light_blu'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
        WarmupTicksPerSecond=1
        RelativeWarmupTime=1
    end object
    Emitters(0)=SpriteEmitter2
    fTimeSoFar=1596.222
}
