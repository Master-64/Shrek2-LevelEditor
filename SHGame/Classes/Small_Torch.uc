//================================================================================
// Small_Torch.
//================================================================================

class Small_Torch extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter14 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=5)
        Opacity=0.75
        UseColorScale=true
        FadeOutStartTime=0.35
        FadeOut=true
        FadeInEndTime=0.1
        FadeIn=true
        MaxParticles=5
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1.5,RelativeSize=0)
        StartSizeRange=(X=(Min=30,Max=30),Y=(Min=30,Max=30),Z=(Min=50,Max=50))
        UniformSize=true
        ParticlesPerSecond=0.01
        Texture=Texture'Shrek2_EFX.Gen_Particle.Torch_Fire'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        BlendBetweenSubdivisions=true
        UseRandomSubdivision=true
        LifetimeRange=(Min=0.5,Max=1)
    end object
    Emitters(0)=SpriteEmitter14
    fTimeSoFar=1492.039
}
