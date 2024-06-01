//================================================================================
// Pumk_Bang.
//================================================================================

class Pumk_Bang extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter6 class=SpriteEmitter
        Acceleration=(X=2,Y=2,Z=-40)
        DampingFactorRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=0.1,Max=0.5))
        UseMaxCollisions=true
        MaxCollisions=(Min=2,Max=3)
        Opacity=0.25
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=6,G=249,R=255,A=255))
        ColorScale(1)=(RelativeTime=0.1,Color=(B=221,G=255,R=255,A=255))
        ColorScale(2)=(RelativeTime=0.8,Color=(B=35,G=182,R=252,A=128))
        ColorScale(3)=(RelativeTime=1,Color=(B=0,G=53,R=164,A=0))
        FadeOut=true
        MaxParticles=8
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=5,Max=-5),Y=(Min=5,Max=-5),Z=(Min=0,Max=0))
        StartLocationPolarRange=(X=(Min=0,Max=0),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=2),Y=(Min=1,Max=2),Z=(Min=1,Max=2))
        StartSizeRange=(X=(Min=60,Max=80),Y=(Min=60,Max=80),Z=(Min=60,Max=80))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.pumpk_juc'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=10,Max=15),Y=(Min=10,Max=15),Z=(Min=60,Max=100))
        VelocityScale(0)=(RelativeTime=0,RelativeVelocity=(X=0,Y=0,Z=-120))
        VelocityScale(1)=(RelativeTime=0.5,RelativeVelocity=(X=0,Y=0,Z=120))
        VelocityScale(2)=(RelativeTime=0.75,RelativeVelocity=(X=20,Y=20,Z=0))
    end object
    Emitters(0)=SpriteEmitter6
    Begin Object name=MeshEmitter4 class=MeshEmitter
        StaticMesh=StaticMesh'Shrek2_EFX_SM.Beanstalk.Pumpk_BitShape'
        Acceleration=(X=0,Y=0,Z=-900)
        UseCollision=true
        ExtentMultiplier=(X=1.5,Y=1.5,Z=1)
        DampingFactorRange=(X=(Min=0.5,Max=0.5),Y=(Min=0.5,Max=0.5),Z=(Min=0.5,Max=0.5))
        MaxCollisions=(Min=2,Max=2)
        FadeIn=true
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
        InitialParticlesPerSecond=100
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.fire2'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1.5,Max=2.25)
        StartVelocityRange=(X=(Min=-150,Max=150),Y=(Min=-150,Max=150),Z=(Min=250,Max=750))
    end object
    Emitters(1)=MeshEmitter4
    fTimeSoFar=160.3852
}
