//================================================================================
// hottub_mist.
//================================================================================

class hottub_mist extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter4 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-10)
        Opacity=0.5
        ColorScale(0)=(RelativeTime=0.2,Color=(B=0,G=128,R=128,A=0))
        ColorScale(1)=(RelativeTime=0.9,Color=(B=0,G=128,R=128,A=0))
        FadeOut=true
        MaxParticles=50
        LowScale=0.2
        StartLocationRange=(X=(Min=-50,Max=50),Y=(Min=-50,Max=50),Z=(Min=0,Max=0))
        SphereRadiusRange=(Min=-50,Max=50)
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.1,Max=0.1),Y=(Min=0.1,Max=0.1),Z=(Min=0.1,Max=0.1))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0,RelativeSize=2)
        StartSizeRange=(X=(Min=50,Max=50),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
        UniformSize=true
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        LifetimeRange=(Min=1.5,Max=2)
        StartVelocityRange=(X=(Min=-15,Max=15),Y=(Min=-15,Max=15),Z=(Min=0,Max=0))
        StartVelocityRadialRange=(Min=200,Max=200)
    end object
    Emitters(0)=SpriteEmitter4
    Begin Object name=SpriteEmitter5 class=SpriteEmitter
        Opacity=0.5
        ColorScale(0)=(RelativeTime=0.5,Color=(B=128,G=255,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.9,Color=(B=0,G=255,R=255,A=0))
        FadeOut=true
        MaxParticles=50
        LowScale=0.1
        StartLocationRange=(X=(Min=-50,Max=50),Y=(Min=-50,Max=50),Z=(Min=0,Max=0))
        SpinsPerSecondRange=(X=(Min=0,Max=0.3),Y=(Min=0,Max=0.3),Z=(Min=0,Max=0.5))
        UseSizeScale=true
        StartSizeRange=(X=(Min=-5,Max=-5),Y=(Min=5,Max=5),Z=(Min=5,Max=5))
        UniformSize=true
        InitialParticlesPerSecond=5000
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.bubble'
        LifetimeRange=(Min=0.5,Max=1)
        StartVelocityRadialRange=(Min=-200,Max=200)
    end object
    Emitters(1)=SpriteEmitter5
    fTimeSoFar=4347.854
}
