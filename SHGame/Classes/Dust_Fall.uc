//================================================================================
// Dust_Fall.
//================================================================================

class Dust_Fall extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter4 class=SpriteEmitter
        Acceleration=(X=2,Y=2,Z=-40)
        DampingFactorRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=0.1,Max=0.5))
        UseMaxCollisions=true
        MaxCollisions=(Min=2,Max=3)
        Opacity=0.85
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=66,G=96,R=113,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=162,G=177,R=191,A=0))
        ColorScale(2)=(RelativeTime=0.99999,Color=(B=57,G=90,R=100,A=0))
        ColorScaleRepeats=0.000125
        MaxParticles=45
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=-20,Max=20),Y=(Min=-20,Max=20),Z=(Min=-20,Max=20))
        StartLocationPolarRange=(X=(Min=0,Max=0),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
        AcceptsProjectors=true
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=-1,Max=1),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=12,Max=12),Y=(Min=12,Max=12),Z=(Min=12,Max=12))
        UniformSize=true
        InitialParticlesPerSecond=60
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.85,Max=1.5)
        StartVelocityRange=(X=(Min=10,Max=-5),Y=(Min=10,Max=-5),Z=(Min=-100,Max=-120))
        VelocityScale(0)=(RelativeTime=0,RelativeVelocity=(X=0,Y=0,Z=-120))
        VelocityScale(1)=(RelativeTime=0.5,RelativeVelocity=(X=0,Y=0,Z=120))
        VelocityScale(2)=(RelativeTime=0.75,RelativeVelocity=(X=20,Y=20,Z=0))
    end object
    Emitters(0)=SpriteEmitter4
    Begin Object name=MeshEmitter3 class=MeshEmitter
        StaticMesh=StaticMesh'Shrek2_EFX_SM.Beanstalk.Cookie_CrumbShape'
        UseParticleColor=true
        Acceleration=(X=0,Y=0,Z=-300)
        FadeOut=true
        MaxParticles=5
        RespawnDeadParticles=false
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        StartSizeRange=(X=(Min=0.35,Max=0.35),Y=(Min=0.35,Max=0.35),Z=(Min=0.35,Max=0.35))
        InitialParticlesPerSecond=1000
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=-35,Max=35),Y=(Min=-35,Max=35),Z=(Min=0,Max=0))
    end object
    Emitters(1)=MeshEmitter3
    fTimeSoFar=3542.926
}
