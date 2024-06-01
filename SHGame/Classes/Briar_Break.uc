//================================================================================
// Briar_Break.
//================================================================================

class Briar_Break extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=MeshEmitter4 class=MeshEmitter
        StaticMesh=StaticMesh'Shrek2_EFX_SM.Beanstalk.Briar_BitShape'
        Acceleration=(X=0,Y=0,Z=-900)
        UseCollision=true
        ExtentMultiplier=(X=1.5,Y=1.5,Z=1)
        DampingFactorRange=(X=(Min=0.5,Max=0.5),Y=(Min=0.5,Max=0.5),Z=(Min=0.5,Max=0.5))
        MaxCollisions=(Min=2,Max=2)
        FadeIn=true
        MaxParticles=35
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
        StartSizeRange=(X=(Min=0.5,Max=1),Y=(Min=0.5,Max=1),Z=(Min=0.5,Max=1))
        InitialParticlesPerSecond=100
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.fire2'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1.5,Max=2.25)
        StartVelocityRange=(X=(Min=-120,Max=120),Y=(Min=-120,Max=120),Z=(Min=100,Max=400))
    end object
    Emitters(0)=MeshEmitter4
    Begin Object name=SpriteEmitter5 class=SpriteEmitter
        Opacity=0.45
        MaxParticles=2
        RespawnDeadParticles=false
        StartSizeRange=(X=(Min=11,Max=11),Y=(Min=11,Max=11),Z=(Min=11,Max=11))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.fire_spot2'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.1,Max=0.2)
    end object
    Emitters(1)=SpriteEmitter5
    fTimeSoFar=433.1831
}
