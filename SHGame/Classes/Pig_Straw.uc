//================================================================================
// Pig_Straw.
//================================================================================

class Pig_Straw extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Acceleration=(X=2,Y=2,Z=-40)
        DampingFactorRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=0.1,Max=0.5))
        UseMaxCollisions=true
        MaxCollisions=(Min=2,Max=3)
        Opacity=0.5
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=0,G=0,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.1,Color=(B=0,G=128,R=255,A=0))
        FadeOut=true
        MaxParticles=8
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=5,Max=-5),Y=(Min=5,Max=-5),Z=(Min=0,Max=0))
        StartLocationPolarRange=(X=(Min=0,Max=0),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
        AcceptsProjectors=true
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=-1,Max=1),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=200,Max=300),Y=(Min=200,Max=300),Z=(Min=100,Max=200))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=-100,Max=100),Y=(Min=-100,Max=100),Z=(Min=50,Max=100))
        VelocityScale(0)=(RelativeTime=0,RelativeVelocity=(X=0,Y=0,Z=-120))
        VelocityScale(1)=(RelativeTime=0.5,RelativeVelocity=(X=0,Y=0,Z=120))
        VelocityScale(2)=(RelativeTime=0.75,RelativeVelocity=(X=20,Y=20,Z=0))
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-700)
        Opacity=0.5
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=0,G=191,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.9999,Color=(B=128,G=255,R=255,A=0))
        FadeOut=true
        MaxParticles=20
        RespawnDeadParticles=false
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=2,Max=2),Y=(Min=2,Max=2),Z=(Min=2,Max=2))
        StartSizeRange=(X=(Min=20,Max=30),Y=(Min=20,Max=30),Z=(Min=20,Max=30))
        UniformSize=true
        InitialParticlesPerSecond=5000
        Texture=Texture'Shrek2_EFX.Gen_Particle.hair'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=-300,Max=300),Y=(Min=-300,Max=300),Z=(Min=400,Max=500))
        WarmupTicksPerSecond=0.8
        RelativeWarmupTime=1
    end object
    Emitters(1)=SpriteEmitter1
    fTimeSoFar=2729.941
}
