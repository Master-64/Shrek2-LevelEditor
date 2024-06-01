//================================================================================
// sewer_mist.
//================================================================================

class sewer_mist extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter3 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-200)
        Opacity=0.5
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.2,Color=(B=0,G=128,R=128,A=0))
        ColorScale(1)=(RelativeTime=0.9,Color=(B=0,G=128,R=128,A=0))
        FadeOutStartTime=3
        FadeOut=true
        MaxParticles=75
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.5,Max=1),Y=(Min=0.5,Max=1),Z=(Min=0.5,Max=1))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0,RelativeSize=2)
        StartSizeRange=(X=(Min=75,Max=125),Y=(Min=75,Max=125),Z=(Min=75,Max=100))
        UniformSize=true
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        LifetimeRange=(Min=1,Max=1.5)
        StartVelocityRange=(X=(Min=150,Max=-150),Y=(Min=150,Max=-150),Z=(Min=0,Max=0))
        StartVelocityRadialRange=(Min=200,Max=200)
    end object
    Emitters(0)=SpriteEmitter3
    Begin Object name=SpriteEmitter14 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-150)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.5,Color=(B=128,G=255,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.9,Color=(B=0,G=255,R=255,A=0))
        FadeOut=true
        MaxParticles=100
        LowScale=0.1
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0,Max=0.3),Y=(Min=0,Max=0.3),Z=(Min=0,Max=0.5))
        UseSizeScale=true
        UseRegularSizeScale=false
        StartSizeRange=(X=(Min=15,Max=15),Y=(Min=30,Max=30),Z=(Min=30,Max=30))
        UniformSize=true
        InitialParticlesPerSecond=5000
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.waterdrop'
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=80,Max=-80),Y=(Min=80,Max=-80),Z=(Min=50,Max=100))
        StartVelocityRadialRange=(Min=-200,Max=200)
    end object
    Emitters(1)=SpriteEmitter14
    fTimeSoFar=3672.419
}
