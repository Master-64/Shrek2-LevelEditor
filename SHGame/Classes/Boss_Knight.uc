//================================================================================
// Boss_Knight.
//================================================================================

class Boss_Knight extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=MeshEmitter1 class=MeshEmitter
        StaticMesh=StaticMesh'Shrek2_EFX_SM.Beanstalk.Rock_BitShape'
        UseParticleColor=true
        Acceleration=(X=0,Y=0,Z=-900)
        UseCollision=true
        ExtentMultiplier=(X=1.5,Y=1.5,Z=1)
        DampingFactorRange=(X=(Min=0.5,Max=0.5),Y=(Min=0.5,Max=0.5),Z=(Min=0.5,Max=0.5))
        MaxCollisions=(Min=2,Max=2)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=182,G=107,R=107,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=207,G=158,R=158,A=0))
        ColorScale(2)=(RelativeTime=0.9999,Color=(B=128,G=64,R=0,A=0))
        FadeIn=true
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
        StartSizeRange=(X=(Min=1,Max=3),Y=(Min=1,Max=3),Z=(Min=1,Max=1))
        InitialParticlesPerSecond=100
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.fire2'
        LifetimeRange=(Min=1.5,Max=2.25)
        StartVelocityRange=(X=(Min=-200,Max=200),Y=(Min=-200,Max=200),Z=(Min=200,Max=500))
    end object
    Emitters(0)=MeshEmitter1
    fTimeSoFar=692.1492
}
