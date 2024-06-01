//================================================================================
// Pull_TreeA.
//================================================================================

class Pull_TreeA extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter5 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-400)
        DampingFactorRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=0.1,Max=0.5))
        UseMaxCollisions=true
        MaxCollisions=(Min=2,Max=3)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.0001,Color=(B=64,G=64,R=128,A=255))
        ColorScale(1)=(RelativeTime=0.4,Color=(B=10,G=38,R=54,A=255))
        ColorScale(2)=(RelativeTime=0.5,Color=(B=44,G=44,R=86,A=128))
        ColorScale(3)=(RelativeTime=0.999999,Color=(B=16,G=40,R=48,A=0))
        MaxParticles=20
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=5,Max=-5),Y=(Min=5,Max=-5),Z=(Min=0,Max=0))
        StartLocationPolarRange=(X=(Min=0,Max=0),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=-1,Max=1),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=80,Max=80),Y=(Min=80,Max=80),Z=(Min=80,Max=80))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.Apple'
        SecondsBeforeInactive=0
        StartVelocityRange=(X=(Min=-60,Max=60),Y=(Min=-60,Max=60),Z=(Min=10,Max=80))
        VelocityScale(0)=(RelativeTime=0,RelativeVelocity=(X=0,Y=0,Z=-120))
        VelocityScale(1)=(RelativeTime=0.5,RelativeVelocity=(X=0,Y=0,Z=120))
        VelocityScale(2)=(RelativeTime=0.75,RelativeVelocity=(X=20,Y=20,Z=0))
        WarmupTicksPerSecond=0.1
        RelativeWarmupTime=1
    end object
    Emitters(0)=SpriteEmitter5
    fTimeSoFar=1651.896
}
