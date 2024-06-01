//================================================================================
// FGM_Gas.
//================================================================================

class FGM_Gas extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-10)
        Opacity=0.7
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=191,G=128,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=221,G=187,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.9999,Color=(B=255,G=255,R=255,A=0))
        FadeOut=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=5)
        StartSizeRange=(X=(Min=15,Max=30),Y=(Min=20,Max=40),Z=(Min=0,Max=0))
        UniformSize=true
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.water'
        LifetimeRange=(Min=2,Max=2)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=50,Max=50))
        WarmupTicksPerSecond=0.5
        RelativeWarmupTime=0.8
    end object
    Emitters(0)=SpriteEmitter2
    Begin Object name=SpriteEmitter3 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-10)
        Opacity=0.7
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=255,G=128,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=128,R=255,A=0))
        ColorScale(2)=(RelativeTime=1,Color=(B=255,G=255,R=255,A=0))
        FadeOut=true
        FadeInEndTime=1
        FadeIn=true
        MaxParticles=30
        LowScale=0.2
        StartLocationOffset=(X=0,Y=0,Z=100)
        StartLocationShape=PTLS_Sphere
        SphereRadiusRange=(Min=-25,Max=20)
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0,Max=0.1),Y=(Min=0,Max=0.2),Z=(Min=0,Max=0))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=0)
        SizeScaleRepeats=-1
        StartSizeRange=(X=(Min=75,Max=75),Y=(Min=75,Max=75),Z=(Min=100,Max=100))
        UniformSize=true
        InitialParticlesPerSecond=5000
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        InitialDelayRange=(Min=0.5,Max=0.5)
        StartVelocityRange=(X=(Min=-50,Max=50),Y=(Min=-50,Max=50),Z=(Min=0,Max=0))
        UseVelocityScale=true
    end object
    Emitters(1)=SpriteEmitter3
    fTimeSoFar=1230.149
}
