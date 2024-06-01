//================================================================================
// Regress_Transform.
//================================================================================

class Regress_Transform extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter6 class=SpriteEmitter
        Opacity=0.7
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=128,G=255,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.3,Color=(B=0,G=255,R=255,A=0))
        ColorScale(2)=(RelativeTime=4,Color=(B=255,G=255,R=255,A=0))
        FadeOutStartTime=4
        FadeOut=true
        FadeInEndTime=0.3
        MaxParticles=100
        LowScale=0.5
        StartLocationOffset=(X=0,Y=0,Z=-30)
        StartLocationShape=PTLS_Sphere
        StartLocationPolarRange=(X=(Min=-50,Max=50),Y=(Min=-50,Max=50),Z=(Min=0,Max=0))
        RevolutionCenterOffsetRange=(X=(Min=7,Max=7),Y=(Min=7,Max=7),Z=(Min=0,Max=0))
        RevolutionsPerSecondRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=0.3,Max=0.3))
        RevolutionScale(0)=(RelativeTime=3,RelativeRevolution=(X=0,Y=0,Z=10))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.5,Max=0.5),Y=(Min=0.5,Max=0.5),Z=(Min=0,Max=0))
        UseSizeScale=true
        UseRegularSizeScale=false
        StartSizeRange=(X=(Min=40,Max=40),Y=(Min=40,Max=40),Z=(Min=0,Max=0))
        UniformSize=true
        InitialParticlesPerSecond=5000
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        SpawnOnTriggerRange=(Min=150,Max=150)
        SpawnOnTriggerPPS=150
        StartVelocityRange=(X=(Min=-35,Max=35),Y=(Min=-35,Max=35),Z=(Min=0,Max=0))
        StartVelocityRadialRange=(Min=7,Max=7)
        GetVelocityDirectionFrom=PTVD_AddRadial
        UseVelocityScale=true
        VelocityScale(0)=(RelativeTime=0.2,RelativeVelocity=(X=1.5,Y=1.5,Z=-1))
        VelocityScale(1)=(RelativeTime=0.6,RelativeVelocity=(X=1,Y=1,Z=3))
        VelocityScale(2)=(RelativeTime=1,RelativeVelocity=(X=0,Y=0,Z=0))
    end object
    Emitters(0)=SpriteEmitter6
    Begin Object name=SpriteEmitter8 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-50)
        Opacity=0.4
        bAddOwnerVelocity=true
        FadeOutStartTime=0.3
        FadeOut=true
        MaxParticles=15
        LowScale=0.1
        StartLocationRange=(X=(Min=-50,Max=50),Y=(Min=-50,Max=50),Z=(Min=0,Max=-20))
        SpinParticles=true
        StartSizeRange=(X=(Min=3,Max=3),Y=(Min=3,Max=3),Z=(Min=3,Max=3))
        UniformSize=true
        InitialParticlesPerSecond=5000
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.Les_Sparkle_04'
        LifetimeRange=(Min=0.7,Max=0.7)
        InitialDelayRange=(Min=0.1,Max=0.1)
        SpawnOnTriggerRange=(Min=100,Max=100)
        SpawnOnTriggerPPS=100
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=100,Max=100))
        StartVelocityRadialRange=(Min=5,Max=5)
        GetVelocityDirectionFrom=PTVD_AddRadial
    end object
    Emitters(1)=SpriteEmitter8
    Begin Object name=SpriteEmitter10 class=SpriteEmitter
        Opacity=0.5
        bAddOwnerVelocity=true
        FadeInEndTime=0.2
        FadeIn=true
        LowScale=0.2
        StartLocationOffset=(X=0,Y=0,Z=120)
        StartLocationRange=(X=(Min=40,Max=-40),Y=(Min=40,Max=-40),Z=(Min=0,Max=0))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.5,Max=0.5),Y=(Min=0,Max=0.5),Z=(Min=0,Max=0))
        UseSizeScale=true
        StartSizeRange=(X=(Min=8,Max=8),Y=(Min=8,Max=8),Z=(Min=100,Max=100))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.big_spell2'
        SpawnOnTriggerRange=(Min=20,Max=20)
        SpawnOnTriggerPPS=20
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=-30,Max=-50))
        StartVelocityRadialRange=(Min=0,Max=15)
        GetVelocityDirectionFrom=PTVD_AddRadial
    end object
    Emitters(2)=SpriteEmitter10
    Begin Object name=SpriteEmitter11 class=SpriteEmitter
        Opacity=0.7
        FadeOut=true
        StartLocationOffset=(X=0,Y=0,Z=50)
        StartLocationRange=(X=(Min=-200,Max=200),Y=(Min=-200,Max=200),Z=(Min=-500,Max=500))
        StartLocationShape=PTLS_Sphere
        SphereRadiusRange=(Min=50,Max=50)
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.5,Max=0.5),Y=(Min=0.5,Max=0.5),Z=(Min=0,Max=0))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0,RelativeSize=0)
        SizeScale(1)=(RelativeTime=2,RelativeSize=5)
        StartSizeRange=(X=(Min=10,Max=10),Y=(Min=10,Max=10),Z=(Min=100,Max=100))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.big_spell2'
        LifetimeRange=(Min=2,Max=2)
        SpawnOnTriggerRange=(Min=40,Max=40)
        SpawnOnTriggerPPS=40
    end object
    Emitters(3)=SpriteEmitter11
    Begin Object name=SpriteEmitter12 class=SpriteEmitter
        FadeInEndTime=4
        FadeIn=true
        MaxParticles=1
        RespawnDeadParticles=false
        StartLocationOffset=(X=0,Y=0,Z=40)
        StartSizeRange=(X=(Min=200,Max=200),Y=(Min=200,Max=200),Z=(Min=100,Max=100))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.light_yel'
    end object
    Emitters(4)=SpriteEmitter12
    fTimeSoFar=21735.5
}
