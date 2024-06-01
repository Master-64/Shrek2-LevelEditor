//================================================================================
// Mice_Potion.
//================================================================================

class Mice_Potion extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter5 class=SpriteEmitter
        Acceleration=(X=2,Y=2,Z=-40)
        DampingFactorRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=0.1,Max=0.5))
        UseMaxCollisions=true
        MaxCollisions=(Min=2,Max=3)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.0001,Color=(B=91,G=0,R=91,A=255))
        ColorScale(1)=(RelativeTime=0.4,Color=(B=128,G=0,R=128,A=255))
        ColorScale(2)=(RelativeTime=0.75,Color=(B=255,G=128,R=128,A=128))
        ColorScale(3)=(RelativeTime=0.999999,Color=(B=0,G=0,R=0,A=0))
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=5,Max=-5),Y=(Min=5,Max=-5),Z=(Min=0,Max=0))
        StartLocationPolarRange=(X=(Min=0,Max=0),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=-1,Max=1),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=70,Max=70),Y=(Min=70,Max=70),Z=(Min=70,Max=70))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smk1'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=-60,Max=60),Y=(Min=-60,Max=60),Z=(Min=-20,Max=30))
        VelocityScale(0)=(RelativeTime=0,RelativeVelocity=(X=0,Y=0,Z=-120))
        VelocityScale(1)=(RelativeTime=0.5,RelativeVelocity=(X=0,Y=0,Z=120))
        VelocityScale(2)=(RelativeTime=0.75,RelativeVelocity=(X=20,Y=20,Z=0))
    end object
    Emitters(0)=SpriteEmitter5
    Begin Object name=SpriteEmitter6 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=128,G=0,R=128,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=128,R=128,A=0))
        ColorScale(2)=(RelativeTime=0.999,Color=(B=128,G=0,R=128,A=0))
        RespawnDeadParticles=false
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.4,Max=0.4),Y=(Min=0.4,Max=0.4),Z=(Min=0.4,Max=0.4))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.Apple'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.5,Max=1)
        StartVelocityRange=(X=(Min=-80,Max=80),Y=(Min=-80,Max=80),Z=(Min=-60,Max=75))
    end object
    Emitters(1)=SpriteEmitter6
    fTimeSoFar=1227.638
}
