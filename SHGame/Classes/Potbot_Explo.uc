//================================================================================
// Potbot_Explo.
//================================================================================

class Potbot_Explo extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        Acceleration=(X=2,Y=2,Z=-40)
        DampingFactorRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=0.1,Max=0.5))
        UseMaxCollisions=true
        MaxCollisions=(Min=2,Max=3)
        Opacity=0.8
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000015,Color=(B=0,G=0,R=255,A=255))
        ColorScale(1)=(RelativeTime=0.1,Color=(B=255,G=0,R=0,A=255))
        ColorScale(2)=(RelativeTime=0.8,Color=(B=128,G=0,R=255,A=128))
        ColorScale(3)=(RelativeTime=1,Color=(B=0,G=53,R=164,A=0))
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=5,Max=-5),Y=(Min=5,Max=-5),Z=(Min=0,Max=0))
        StartLocationPolarRange=(X=(Min=0,Max=0),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=-1,Max=1),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=20,Max=25),Y=(Min=20,Max=25),Z=(Min=20,Max=25))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.dazzl2'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=-10,Max=10),Y=(Min=-10,Max=10),Z=(Min=60,Max=80))
        VelocityScale(0)=(RelativeTime=0,RelativeVelocity=(X=0,Y=0,Z=-120))
        VelocityScale(1)=(RelativeTime=0.5,RelativeVelocity=(X=0,Y=0,Z=120))
        VelocityScale(2)=(RelativeTime=0.75,RelativeVelocity=(X=20,Y=20,Z=0))
    end object
    Emitters(0)=SpriteEmitter2
    Begin Object name=SpriteEmitter4 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000015,Color=(B=255,G=0,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.3,Color=(B=0,G=0,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.99,Color=(B=0,G=255,R=255,A=0))
        FadeOutStartTime=0.9
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=-1,Max=1),Y=(Min=-1,Max=1),Z=(Min=0,Max=-1))
        StartSizeRange=(X=(Min=25,Max=50),Y=(Min=25,Max=50),Z=(Min=25,Max=50))
        UniformSize=true
        ParticlesPerSecond=10
        InitialParticlesPerSecond=8
        Texture=Texture'Shrek2_EFX.Gen_Particle.flower_Pwr'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=6)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=20,Max=30))
    end object
    Emitters(1)=SpriteEmitter4
    fTimeSoFar=1153.112
}
