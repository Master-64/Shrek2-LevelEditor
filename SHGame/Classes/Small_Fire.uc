//================================================================================
// Small_Fire.
//================================================================================

class Small_Fire extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=5)
        Opacity=0.3
        UseColorScale=true
        FadeOutStartTime=0.35
        FadeOut=true
        FadeInEndTime=0.1
        FadeIn=true
        StartLocationOffset=(X=0,Y=0,Z=5)
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1.5,RelativeSize=0)
        StartSizeRange=(X=(Min=40,Max=50),Y=(Min=40,Max=50),Z=(Min=10,Max=10))
        UniformSize=true
        ParticlesPerSecond=0.01
        Texture=Texture'Shrek2_EFX.Gen_Particle.Torch_Fire'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        BlendBetweenSubdivisions=true
        UseRandomSubdivision=true
        LifetimeRange=(Min=0.5,Max=1)
        WarmupTicksPerSecond=0.7
        RelativeWarmupTime=1
    end object
    Emitters(0)=SpriteEmitter1
    Begin Object name=SpriteEmitter3 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-10)
        FadeOut=true
        StartLocationOffset=(X=0,Y=0,Z=20)
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.3,Max=0.3),Y=(Min=0.3,Max=0.3),Z=(Min=0.3,Max=0.3))
        StartSizeRange=(X=(Min=35,Max=35),Y=(Min=35,Max=35),Z=(Min=35,Max=35))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.mist'
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=0,Max=80))
    end object
    Emitters(1)=SpriteEmitter3
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        FadeOut=true
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        StartSizeRange=(X=(Min=2,Max=2),Y=(Min=2,Max=2),Z=(Min=2,Max=2))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.big_spell2'
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=-12,Max=12),Y=(Min=-12,Max=12),Z=(Min=0,Max=80))
    end object
    Emitters(2)=SpriteEmitter2
    fTimeSoFar=2051.828
}
