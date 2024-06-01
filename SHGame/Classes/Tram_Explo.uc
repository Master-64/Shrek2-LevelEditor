//================================================================================
// Tram_Explo.
//================================================================================

class Tram_Explo extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Acceleration=(X=2,Y=2,Z=-40)
        DampingFactorRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=0.1,Max=0.5))
        UseMaxCollisions=true
        MaxCollisions=(Min=2,Max=3)
        Opacity=0.85
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.0001,Color=(B=64,G=64,R=64,A=255))
        ColorScale(1)=(RelativeTime=0.4,Color=(B=78,G=78,R=154,A=255))
        ColorScale(2)=(RelativeTime=0.5,Color=(B=44,G=44,R=86,A=128))
        ColorScale(3)=(RelativeTime=0.999999,Color=(B=119,G=156,R=168,A=0))
        MaxParticles=8
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=5,Max=-5),Y=(Min=5,Max=-5),Z=(Min=0,Max=0))
        StartLocationPolarRange=(X=(Min=0,Max=0),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=-1,Max=1),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=140,Max=200),Y=(Min=140,Max=200),Z=(Min=140,Max=200))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smk1'
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=-60,Max=60),Y=(Min=-60,Max=60),Z=(Min=10,Max=80))
        VelocityScale(0)=(RelativeTime=0,RelativeVelocity=(X=0,Y=0,Z=-120))
        VelocityScale(1)=(RelativeTime=0.5,RelativeVelocity=(X=0,Y=0,Z=120))
        VelocityScale(2)=(RelativeTime=0.75,RelativeVelocity=(X=20,Y=20,Z=0))
    end object
    Emitters(0)=SpriteEmitter1
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-200)
        FadeOutStartTime=0.75
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.5,Max=0.5),Y=(Min=0.5,Max=0.5),Z=(Min=0.5,Max=0.5))
        StartSizeRange=(X=(Min=20,Max=20),Y=(Min=20,Max=20),Z=(Min=20,Max=20))
        UniformSize=true
        DrawStyle=PTDS_AlphaBlend
        Texture=Texture'Shrek2_EFX.Gen_Particle.Citizen'
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=-100,Max=100),Y=(Min=-100,Max=100),Z=(Min=-100,Max=200))
    end object
    Emitters(1)=SpriteEmitter2
    Begin Object name=MeshEmitter1 class=MeshEmitter
        StaticMesh=StaticMesh'Shrek2_EFX_SM.Beanstalk.Rock_BitShape'
        UseParticleColor=true
        Acceleration=(X=0,Y=0,Z=-100)
        UseCollision=true
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=131,G=86,R=86,A=0))
        ColorScale(1)=(RelativeTime=0.99999,Color=(B=85,G=97,R=108,A=0))
        RespawnDeadParticles=false
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        StartSizeRange=(X=(Min=2,Max=4),Y=(Min=2,Max=4),Z=(Min=1,Max=2))
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=-100,Max=100),Y=(Min=-100,Max=100),Z=(Min=100,Max=200))
    end object
    Emitters(2)=MeshEmitter1
    fTimeSoFar=1935.914
}
