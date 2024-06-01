//================================================================================
// FGM_Explode.
//================================================================================

class FGM_Explode extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter150 class=SpriteEmitter
        DampingFactorRange=(X=(Min=0.2,Max=0.2),Y=(Min=0.2,Max=0.2),Z=(Min=0.2,Max=0.2))
        Opacity=0.7
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.5,Color=(B=192,G=128,R=128,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=255,G=128,R=255,A=0))
        FadeOut=true
        MaxParticles=5
        RespawnDeadParticles=false
        AutoResetTimeRange=(Min=0.5,Max=0.5)
        SpinCCWorCW=(X=5,Y=5,Z=5)
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0.3,RelativeSize=20)
        SizeScale(1)=(RelativeTime=1,RelativeSize=-1)
        StartSizeRange=(X=(Min=30,Max=30),Y=(Min=30,Max=30),Z=(Min=0,Max=0))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.starburst'
        LifetimeRange=(Min=1,Max=0.5)
        StartVelocityRadialRange=(Min=1,Max=1)
    end object
    Emitters(0)=SpriteEmitter150
    Begin Object name=SpriteEmitter151 class=SpriteEmitter
        Opacity=0.3
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=255,G=128,R=255,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=128,G=0,R=128,A=0))
        ColorScale(2)=(RelativeTime=0,Color=(B=255,G=128,R=255,A=0))
        FadeOutStartTime=2
        FadeOut=true
        FadeInEndTime=0.3
        FadeIn=true
        MaxParticles=75
        RespawnDeadParticles=false
        StartLocationShape=PTLS_Sphere
        SphereRadiusRange=(Min=20,Max=20)
        SpinParticles=true
        UseRegularSizeScale=false
        StartSizeRange=(X=(Min=200,Max=200),Y=(Min=200,Max=200),Z=(Min=50,Max=50))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        LifetimeRange=(Min=6,Max=6)
        InitialDelayRange=(Min=0.4,Max=0.4)
        StartVelocityRange=(X=(Min=-100,Max=100),Y=(Min=-150,Max=150),Z=(Min=-100,Max=100))
        StartVelocityRadialRange=(Min=10,Max=10)
        GetVelocityDirectionFrom=PTVD_AddRadial
        UseVelocityScale=true
        VelocityScale(0)=(RelativeTime=6,RelativeVelocity=(X=-10,Y=-10,Z=-10))
    end object
    Emitters(1)=SpriteEmitter151
    Begin Object name=SpriteEmitter152 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.3,Color=(B=255,G=128,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=128,R=255,A=0))
        ColorScale(2)=(RelativeTime=1,Color=(B=255,G=128,R=255,A=0))
        FadeOutStartTime=0.3
        FadeOut=true
        MaxParticles=1
        LowScale=0.1
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=3,RelativeSize=100)
        StartSizeRange=(X=(Min=30,Max=30),Y=(Min=30,Max=30),Z=(Min=0,Max=0))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.circle_blow'
        InitialDelayRange=(Min=0.4,Max=0.4)
    end object
    Emitters(2)=SpriteEmitter152
    Begin Object name=SpriteEmitter153 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=255,G=128,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=255,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.7,Color=(B=255,G=255,R=255,A=0))
        FadeOut=true
        MaxParticles=150
        RespawnDeadParticles=false
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=0.5,Max=0.5),Z=(Min=0.5,Max=0.5))
        StartSizeRange=(X=(Min=5,Max=5),Y=(Min=5,Max=5),Z=(Min=5,Max=5))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.Les_Sparkle_04'
        LifetimeRange=(Min=5,Max=5)
        InitialDelayRange=(Min=0.4,Max=0.4)
        StartVelocityRange=(X=(Min=-200,Max=200),Y=(Min=-200,Max=200),Z=(Min=-200,Max=200))
        UseVelocityScale=true
    end object
    Emitters(3)=SpriteEmitter153
    Begin Object name=SpriteEmitter154 class=SpriteEmitter
        Opacity=0.5
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.2,Color=(B=255,G=255,R=255,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=255,G=128,R=255,A=0))
        FadeOut=true
        MaxParticles=3
        RespawnDeadParticles=false
        UseSizeScale=true
        StartSizeRange=(X=(Min=200,Max=200),Y=(Min=100,Max=100),Z=(Min=100,Max=100))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.light_red'
        LifetimeRange=(Min=2,Max=2)
        InitialDelayRange=(Min=0.4,Max=0.4)
    end object
    Emitters(4)=SpriteEmitter154
    fTimeSoFar=7036.91
}
