//================================================================================
// Shower_Drip.
//================================================================================

class Shower_Drip extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Opacity=0.3
        FadeOut=true
        StartLocationRange=(X=(Min=-8,Max=8),Y=(Min=-8,Max=8),Z=(Min=0,Max=0))
        UseRegularSizeScale=false
        StartSizeRange=(X=(Min=3,Max=3),Y=(Min=20,Max=20),Z=(Min=0,Max=0))
        UniformSize=true
        InitialParticlesPerSecond=5000
        Texture=Texture'Shrek2_EFX.Gen_Particle.rain'
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=-100,Max=-100))
    end object
    Emitters(0)=SpriteEmitter1
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        Opacity=0.4
        MaxParticles=8
        StartLocationOffset=(X=0,Y=0,Z=-40)
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.8,Max=0.8),Y=(Min=0.8,Max=0.8),Z=(Min=0.8,Max=0.8))
        StartSizeRange=(X=(Min=50,Max=100),Y=(Min=50,Max=100),Z=(Min=50,Max=100))
        UniformSize=true
        InitialParticlesPerSecond=5000
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        WarmupTicksPerSecond=0.8
        RelativeWarmupTime=1
    end object
    Emitters(1)=SpriteEmitter2
    fTimeSoFar=834.1737
}
