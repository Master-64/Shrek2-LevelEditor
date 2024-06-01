//================================================================================
// Env_Torch.
//================================================================================

class Env_Torch extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=5)
        Opacity=0.75
        UseColorScale=true
        FadeOutStartTime=0.35
        FadeOut=true
        FadeInEndTime=0.1
        FadeIn=true
        MaxParticles=25
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1.5,RelativeSize=0)
        StartSizeRange=(X=(Min=22,Max=15),Y=(Min=3,Max=3),Z=(Min=14,Max=14))
        UniformSize=true
        ParticlesPerSecond=0.01
        Texture=Texture'Shrek2_EFX.Gen_Particle.Torch_Fire'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        BlendBetweenSubdivisions=true
        UseRandomSubdivision=true
        LifetimeRange=(Min=0.5,Max=1)
    end object
    Emitters(0)=SpriteEmitter2
    fTimeSoFar=1707.978
}
