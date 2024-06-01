//================================================================================
// Potion1a.
//================================================================================

class Potion1a extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=MeshEmitter1 class=MeshEmitter
        StaticMesh=StaticMesh'Shrek2_EFX_SM.Beanstalk.glasspiece'
        UseMeshBlendMode=false
        RenderTwoSided=true
        UseParticleColor=true
        Acceleration=(X=0,Y=0,Z=-900)
        UseCollision=true
        ExtentMultiplier=(X=1.5,Y=1.5,Z=1)
        DampingFactorRange=(X=(Min=0.5,Max=0.5),Y=(Min=0.5,Max=0.5),Z=(Min=0.5,Max=0.5))
        MaxCollisions=(Min=2,Max=2)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=160,G=0,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.999999,Color=(B=160,G=0,R=0,A=0))
        FadeOutStartTime=0.8
        FadeOut=true
        MaxParticles=7
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
        StartSizeRange=(X=(Min=0.65,Max=0.65),Y=(Min=0.65,Max=0.65),Z=(Min=0.65,Max=0.65))
        InitialParticlesPerSecond=100
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.fire2'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1.5,Max=2.25)
        StartVelocityRange=(X=(Min=-70,Max=70),Y=(Min=-70,Max=70),Z=(Min=150,Max=300))
        UseVelocityScale=true
    end object
    Emitters(0)=MeshEmitter1
    Begin Object name=SpriteEmitter14 class=SpriteEmitter
        Acceleration=(X=-5,Y=5,Z=-60)
        FadeOut=true
        MaxParticles=30
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=10,Max=-10),Y=(Min=10,Max=-10),Z=(Min=-25,Max=-25))
        SpinParticles=true
        StartSizeRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        UniformSize=true
        InitialParticlesPerSecond=500
        Texture=Texture'Shrek2_EFX.Gen_Particle.sparkle'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=20,Max=-20),Y=(Min=20,Max=-20),Z=(Min=75,Max=75))
    end object
    Emitters(1)=SpriteEmitter14
    fTimeSoFar=8868.953
}
