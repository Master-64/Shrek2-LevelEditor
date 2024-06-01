//================================================================================
// Bounce_A.
//================================================================================

class Bounce_A extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-100)
        UseCollision=true
        DampingFactorRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=1,Max=1))
        UseCollisionPlanes=true
        CollisionPlanes(0)=(W=400,X=0,Y=0,Z=1)
        FadeOutStartTime=0.7
        FadeOut=true
        FadeInEndTime=0.1
        FadeIn=true
        MaxParticles=5
        AutoResetTimeRange=(Min=0.5,Max=0.5)
        StartLocationRange=(X=(Min=-15,Max=15),Y=(Min=-15,Max=15),Z=(Min=0,Max=0))
        SphereRadiusRange=(Min=100,Max=100)
        StartLocationPolarRange=(X=(Min=65536,Max=65536),Y=(Min=0,Max=65536),Z=(Min=50,Max=50))
        SpinParticles=true
        SpinCCWorCW=(X=0,Y=0,Z=0)
        SpinsPerSecondRange=(X=(Min=-1,Max=1),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        StartSpinRange=(X=(Min=-1,Max=1),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        RotationNormal=(X=1,Y=0,Z=0)
        SizeScale(0)=(RelativeTime=0.5,RelativeSize=0.1)
        SizeScale(1)=(RelativeTime=0.9,RelativeSize=2)
        StartSizeRange=(X=(Min=3,Max=7),Y=(Min=3,Max=7),Z=(Min=3,Max=7))
        UniformSize=true
        InitialParticlesPerSecond=1000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.bigleaf'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=0,Max=120))
        VelocityScale(0)=(RelativeTime=0.01,RelativeVelocity=(X=0,Y=0,Z=0))
        VelocityScale(1)=(RelativeTime=0.5,RelativeVelocity=(X=0.1,Y=0.1,Z=0.1))
        VelocityScale(2)=(RelativeTime=1,RelativeVelocity=(X=0.75,Y=0.75,Z=0.75))
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-120)
        Opacity=0.5
        FadeOutStartTime=0.5
        FadeOut=true
        MaxParticles=20
        StartLocationOffset=(X=0,Y=0,Z=-20)
        StartLocationRange=(X=(Min=30,Max=-30),Y=(Min=30,Max=-30),Z=(Min=0,Max=0))
        SpinParticles=true
        StartSizeRange=(X=(Min=3,Max=3),Y=(Min=3,Max=3),Z=(Min=3,Max=3))
        UniformSize=true
        InitialParticlesPerSecond=5000
        Texture=Texture'Shrek2_EFX.Gen_Particle.Les_Sparkle_04'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=100,Max=150))
    end object
    Emitters(1)=SpriteEmitter1
    fTimeSoFar=5637.233
}
