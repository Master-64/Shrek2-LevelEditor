//================================================================================
// Platform_Steam.
//================================================================================

class Platform_Steam extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Opacity=0.5
        FadeOutStartTime=0.8
        MaxParticles=30
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.7,Max=2),Y=(Min=0.7,Max=2),Z=(Min=0.7,Max=2))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=15)
        StartSizeRange=(X=(Min=2,Max=5),Y=(Min=50,Max=50),Z=(Min=2,Max=2))
        UniformSize=true
        InitialParticlesPerSecond=5000
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        LifetimeRange=(Min=0.6,Max=0.6)
        ResetOnTrigger=true
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=100,Max=100),Z=(Min=100,Max=100))
        StartVelocityRadialRange=(Min=10,Max=10)
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=3642.092
}
