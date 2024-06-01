//================================================================================
// Tree_Explo.
//================================================================================

class Tree_Explo extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-100)
        DampingFactorRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=0.1,Max=0.5))
        UseMaxCollisions=true
        MaxCollisions=(Min=2,Max=3)
        Opacity=0.6
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.1,Color=(B=141,G=199,R=199,A=255))
        ColorScale(1)=(RelativeTime=0.9,Color=(B=255,G=255,R=255,A=0))
        FadeOut=true
        MaxParticles=20
        RespawnDeadParticles=false
        StartLocationOffset=(X=0,Y=0,Z=50)
        StartLocationRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=-50,Max=50))
        StartLocationShape=PTLS_Sphere
        StartLocationPolarRange=(X=(Min=0,Max=0),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
        SpinParticles=true
        SpinCCWorCW=(X=0.2,Y=0.2,Z=0.2)
        SpinsPerSecondRange=(X=(Min=0.5,Max=0.5),Y=(Min=0.5,Max=0.5),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=150,Max=150),Y=(Min=150,Max=150),Z=(Min=100,Max=100))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        SecondsBeforeInactive=0
        LifetimeRange=(Min=2,Max=2)
        StartVelocityRange=(X=(Min=-100,Max=100),Y=(Min=-100,Max=100),Z=(Min=-150,Max=150))
        VelocityScale(0)=(RelativeTime=0.85,RelativeVelocity=(X=-2,Y=-2,Z=0))
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=MeshEmitter0 class=MeshEmitter
        StaticMesh=StaticMesh'Shrek2_EFX_SM.Beanstalk.Tree_SplntrShape'
        Acceleration=(X=0,Y=0,Z=-900)
        UseCollision=true
        ExtentMultiplier=(X=1.5,Y=1.5,Z=1)
        DampingFactorRange=(X=(Min=0.5,Max=0.5),Y=(Min=0.5,Max=0.5),Z=(Min=0.5,Max=0.5))
        MaxCollisions=(Min=2,Max=2)
        FadeIn=true
        MaxParticles=15
        LowScale=0.2
        RespawnDeadParticles=false
        MeshSpawning=PTMS_Random
        MeshScaleRange=(X=(Min=0.25,Max=0.5),Y=(Min=0.25,Max=0.5),Z=(Min=0.25,Max=0.5))
        RevolutionCenterOffsetRange=(X=(Min=10,Max=50),Y=(Min=10,Max=50),Z=(Min=2,Max=5))
        RevolutionsPerSecondRange=(X=(Min=1,Max=2),Y=(Min=1,Max=2),Z=(Min=1,Max=2))
        UseRevolutionScale=true
        RevolutionScale(0)=(RelativeTime=0,RelativeRevolution=(X=5,Y=5,Z=5))
        RevolutionScale(1)=(RelativeTime=1,RelativeRevolution=(X=0.25,Y=0.25,Z=0.25))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0,Max=0),Y=(Min=0.5,Max=1),Z=(Min=0.5,Max=1))
        DampRotation=true
        RotationDampingFactorRange=(X=(Min=0.5,Max=1),Y=(Min=0.5,Max=1),Z=(Min=0.5,Max=1))
        StartSizeRange=(X=(Min=0.7,Max=0.7),Y=(Min=0.7,Max=0.7),Z=(Min=0.7,Max=0.7))
        InitialParticlesPerSecond=100
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.fire2'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=2,Max=3)
        StartVelocityRange=(X=(Min=-100,Max=100),Y=(Min=-100,Max=100),Z=(Min=250,Max=700))
    end object
    Emitters(1)=MeshEmitter0
    fTimeSoFar=3600.409
}
