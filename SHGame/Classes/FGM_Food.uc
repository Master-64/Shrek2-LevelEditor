//================================================================================
// FGM_Food.
//================================================================================

class FGM_Food extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter133 class=SpriteEmitter
        DampingFactorRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=0.1,Max=0.5))
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=204,G=254,R=255,A=255))
        ColorScale(1)=(RelativeTime=0.1,Color=(B=213,G=255,R=213,A=255))
        ColorScale(2)=(RelativeTime=0.8,Color=(B=184,G=232,R=254,A=128))
        ColorScale(3)=(RelativeTime=1,Color=(B=119,G=164,R=255,A=0))
        FadeOutStartTime=-0.05
        FadeOut=true
        MaxParticles=30
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=-25,Max=25),Y=(Min=-25,Max=25),Z=(Min=-25,Max=25))
        StartMassRange=(Min=5,Max=5)
        SpinParticles=true
        SpinCCWorCW=(X=0.25,Y=0.25,Z=0.25)
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0,RelativeSize=0.1)
        SizeScale(1)=(RelativeTime=1,RelativeSize=1.5)
        StartSizeRange=(X=(Min=20,Max=40),Y=(Min=20,Max=40),Z=(Min=20,Max=40))
        UniformSize=true
        InitialParticlesPerSecond=100
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.waterdrop'
        BlendBetweenSubdivisions=true
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.1,Max=0.5)
        StartVelocityRange=(X=(Min=-100,Max=100),Y=(Min=-100,Max=100),Z=(Min=-100,Max=100))
        VelocityScale(0)=(RelativeTime=0,RelativeVelocity=(X=0,Y=0,Z=-120))
        VelocityScale(1)=(RelativeTime=0.5,RelativeVelocity=(X=0,Y=0,Z=120))
        VelocityScale(2)=(RelativeTime=0.75,RelativeVelocity=(X=20,Y=20,Z=0))
    end object
    Emitters(0)=SpriteEmitter133
    Begin Object name=MeshEmitter93 class=MeshEmitter
        StaticMesh=StaticMesh'Shrek2_EFX_SM.Beanstalk.Apple_BitShape'
        UseParticleColor=true
        Acceleration=(X=0,Y=0,Z=-200)
        UseCollision=true
        ExtentMultiplier=(X=1.5,Y=1.5,Z=1)
        DampingFactorRange=(X=(Min=0.5,Max=0.5),Y=(Min=0.5,Max=0.5),Z=(Min=0.5,Max=0.5))
        MaxCollisions=(Min=2,Max=2)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=168,G=168,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.3,Color=(B=179,G=255,R=179,A=0))
        ColorScale(2)=(RelativeTime=0.6,Color=(B=145,G=181,R=255,A=0))
        ColorScale(3)=(RelativeTime=0.9,Color=(B=156,G=222,R=243,A=0))
        FadeIn=true
        MaxParticles=3
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
        InitialParticlesPerSecond=3
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.fire2'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.75,Max=0.75)
        StartVelocityRange=(X=(Min=-250,Max=250),Y=(Min=-250,Max=250),Z=(Min=-250,Max=250))
    end object
    Emitters(1)=MeshEmitter93
    fTimeSoFar=6024.261
}
