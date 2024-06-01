//================================================================================
// celldoor_explode.
//================================================================================

class celldoor_explode extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        DampingFactorRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=0.1,Max=0.5))
        UseMaxCollisions=true
        MaxCollisions=(Min=2,Max=3)
        Opacity=0.8
        FadeOut=true
        MaxParticles=30
        LowScale=0.5
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=5,Max=-5),Y=(Min=5,Max=-5),Z=(Min=5,Max=-5))
        StartLocationPolarRange=(X=(Min=0,Max=0),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
        AcceptsProjectors=true
        SpinParticles=true
        SpinCCWorCW=(X=0.2,Y=0.2,Z=0.2)
        SpinsPerSecondRange=(X=(Min=-1,Max=1),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=40,Max=100),Y=(Min=40,Max=100),Z=(Min=40,Max=100))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=150,Max=-150),Y=(Min=150,Max=-150),Z=(Min=-100,Max=200))
        StartVelocityRadialRange=(Min=0,Max=5)
        VelocityScale(0)=(RelativeTime=0,RelativeVelocity=(X=0,Y=0,Z=-120))
        VelocityScale(1)=(RelativeTime=0.5,RelativeVelocity=(X=0,Y=0,Z=120))
        VelocityScale(2)=(RelativeTime=0.75,RelativeVelocity=(X=20,Y=20,Z=0))
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=MeshEmitter0 class=MeshEmitter
        StaticMesh=StaticMesh'Shrek2_EFX_SM.Beanstalk.door_cell_debris'
        RenderTwoSided=true
        Acceleration=(X=300,Y=0,Z=-700)
        UseCollision=true
        DampingFactorRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=0.1))
        LowScale=0.5
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=0,Max=0),Y=(Min=75,Max=-75),Z=(Min=75,Max=-75))
        SpinParticles=true
        SpinCCWorCW=(X=5,Y=5,Z=5)
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        UseRegularSizeScale=false
        StartSizeRange=(X=(Min=0.5,Max=1),Y=(Min=0.5,Max=1),Z=(Min=0.5,Max=1))
        InitialParticlesPerSecond=25
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Regular
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2.5)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=50,Max=-50),Z=(Min=300,Max=400))
        StartVelocityRadialRange=(Min=0,Max=5)
    end object
    Emitters(1)=MeshEmitter0
    fTimeSoFar=4812.955
}
