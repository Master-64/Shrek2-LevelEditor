//================================================================================
// Pull_TreeB.
//================================================================================

class Pull_TreeB extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-60)
        UseCollision=true
        DampingFactorRange=(X=(Min=0.2,Max=0.2),Y=(Min=0.2,Max=0.2),Z=(Min=0.2,Max=0.2))
        UseColorScale=true
        ColorScale(0)=(RelativeTime=1,Color=(B=37,G=37,R=75,A=0))
        ColorScale(1)=(RelativeTime=2,Color=(B=0,G=85,R=0,A=0))
        ColorScale(2)=(RelativeTime=0.75,Color=(B=33,G=33,R=65,A=255))
        ColorScale(3)=(RelativeTime=1,Color=(B=0,G=72,R=0,A=255))
        FadeOutStartTime=5.34
        MaxParticles=18
        RespawnDeadParticles=false
        AutoResetTimeRange=(Min=0.5,Max=0.5)
        StartLocationRange=(X=(Min=-6,Max=6),Y=(Min=-6,Max=6),Z=(Min=0,Max=0))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.6,Max=0.6),Y=(Min=0.6,Max=0.6),Z=(Min=0.6,Max=0.6))
        StartSpinRange=(X=(Min=0.25,Max=0.25),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        UseSizeScale=true
        SizeScaleRepeats=100
        StartSizeRange=(X=(Min=4,Max=35),Y=(Min=1,Max=20),Z=(Min=1,Max=20))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.tree'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=2,Max=3)
        StartVelocityRange=(X=(Min=-100,Max=100),Y=(Min=-100,Max=100),Z=(Min=-60,Max=100))
        StartVelocityRadialRange=(Min=1,Max=5)
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=MeshEmitter0 class=MeshEmitter
        StaticMesh=StaticMesh'Shrek2_EFX_SM.Beanstalk.Cookie_CrumbShape'
        Acceleration=(X=0,Y=0,Z=-600)
        UseCollision=true
        ExtentMultiplier=(X=0.5,Y=0.5,Z=0.5)
        DampingFactorRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=0.5,Max=0.5))
        LowScale=0.5
        RespawnDeadParticles=false
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.8,Max=0.8),Y=(Min=0.8,Max=0.8),Z=(Min=0.8,Max=0.8))
        UseSizeScale=true
        StartSizeRange=(X=(Min=0.25,Max=0.5),Y=(Min=0.25,Max=0.5),Z=(Min=0.25,Max=0.5))
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        SecondsBeforeInactive=0
        LifetimeRange=(Min=2,Max=3)
        StartVelocityRange=(X=(Min=-40,Max=40),Y=(Min=-40,Max=40),Z=(Min=-40,Max=60))
    end object
    Emitters(1)=MeshEmitter0
    fTimeSoFar=1292.835
}
