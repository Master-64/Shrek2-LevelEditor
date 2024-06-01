//================================================================================
// Mush_Bang.
//================================================================================

class Mush_Bang extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-150)
        DampingFactorRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=0.1,Max=0.5))
        UseMaxCollisions=true
        MaxCollisions=(Min=2,Max=3)
        Opacity=0.8
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=255,G=255,R=255,A=255))
        ColorScale(1)=(RelativeTime=0.1,Color=(B=98,G=98,R=255,A=255))
        ColorScale(2)=(RelativeTime=0.8,Color=(B=128,G=128,R=255,A=128))
        ColorScale(3)=(RelativeTime=1,Color=(B=0,G=53,R=164,A=0))
        FadeOutStartTime=0.3
        FadeOut=true
        MaxParticles=30
        RespawnDeadParticles=false
        StartLocationOffset=(X=0,Y=0,Z=-20)
        StartLocationRange=(X=(Min=5,Max=-5),Y=(Min=5,Max=-5),Z=(Min=0,Max=0))
        StartLocationPolarRange=(X=(Min=0,Max=0),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
        AcceptsProjectors=true
        SpinParticles=true
        SpinCCWorCW=(X=0.2,Y=0.2,Z=0.2)
        SpinsPerSecondRange=(X=(Min=-1,Max=1),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=40,Max=70),Y=(Min=40,Max=70),Z=(Min=40,Max=70))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=100,Max=-100),Y=(Min=100,Max=-100),Z=(Min=40,Max=70))
        StartVelocityRadialRange=(Min=-50,Max=50)
        VelocityScale(0)=(RelativeTime=0,RelativeVelocity=(X=0,Y=0,Z=-120))
        VelocityScale(1)=(RelativeTime=0.5,RelativeVelocity=(X=0,Y=0,Z=120))
        VelocityScale(2)=(RelativeTime=0.75,RelativeVelocity=(X=20,Y=20,Z=0))
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=MeshEmitter0 class=MeshEmitter
        StaticMesh=StaticMesh'Shrek2_EFX_SM.Beanstalk.Shroom_BitShape'
        Acceleration=(X=0,Y=0,Z=-900)
        UseCollision=true
        ExtentMultiplier=(X=1.5,Y=1.5,Z=1)
        DampingFactorRange=(X=(Min=0.5,Max=0.5),Y=(Min=0.5,Max=0.5),Z=(Min=0.5,Max=0.5))
        MaxCollisions=(Min=2,Max=2)
        FadeOutStartTime=0.8
        FadeOut=true
        MaxParticles=8
        RespawnDeadParticles=false
        MeshSpawning=PTMS_Random
        MeshScaleRange=(X=(Min=0.25,Max=0.5),Y=(Min=0.25,Max=0.5),Z=(Min=0.25,Max=0.5))
        RevolutionCenterOffsetRange=(X=(Min=10,Max=50),Y=(Min=10,Max=50),Z=(Min=2,Max=5))
        RevolutionsPerSecondRange=(X=(Min=1,Max=2),Y=(Min=1,Max=2),Z=(Min=1,Max=2))
        UseRevolutionScale=true
        RevolutionScale(0)=(RelativeTime=0,RelativeRevolution=(X=5,Y=5,Z=5))
        RevolutionScale(1)=(RelativeTime=1,RelativeRevolution=(X=0.25,Y=0.25,Z=0.25))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0,Max=0),Y=(Min=1,Max=2),Z=(Min=1,Max=2))
        DampRotation=true
        RotationDampingFactorRange=(X=(Min=0.5,Max=1),Y=(Min=0.5,Max=1),Z=(Min=0.5,Max=1))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0.7,RelativeSize=2)
        InitialParticlesPerSecond=100
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.fire2'
        LifetimeRange=(Min=1.5,Max=2.25)
        StartVelocityRange=(X=(Min=-150,Max=150),Y=(Min=-150,Max=150),Z=(Min=250,Max=750))
    end object
    Emitters(1)=MeshEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Acceleration=(X=30,Y=0,Z=0)
        FadeOut=true
        MaxParticles=50
        LowScale=0.2
        RespawnDeadParticles=false
        StartSizeRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        UniformSize=true
        InitialParticlesPerSecond=200
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_AlphaBlend
        Texture=Texture'Shrek2_EFX.Gen_Particle.pollen'
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=50,Max=-50),Y=(Min=50,Max=-50),Z=(Min=0,Max=30))
    end object
    Emitters(2)=SpriteEmitter1
    fTimeSoFar=2210.095
}
