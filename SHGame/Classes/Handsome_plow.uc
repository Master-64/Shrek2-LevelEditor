//================================================================================
// Handsome_plow.
//================================================================================

class Handsome_plow extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter4 class=SpriteEmitter
        Opacity=0.7
        FadeOut=true
        MaxParticles=50
        LowScale=0.2
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=30,Max=-30),Y=(Min=30,Max=-30),Z=(Min=30,Max=-30))
        StartSizeRange=(X=(Min=50,Max=60),Y=(Min=50,Max=60),Z=(Min=0,Max=0))
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
        StartVelocityRange=(X=(Min=80,Max=-80),Y=(Min=80,Max=-80),Z=(Min=50,Max=-50))
    end object
    Emitters(0)=SpriteEmitter4
    Begin Object name=SpriteEmitter5 class=SpriteEmitter
        FadeOut=true
        MaxParticles=1
        RespawnDeadParticles=false
        UseSizeScale=true
        SizeScale(0)=(RelativeTime=0,RelativeSize=15)
        StartSizeRange=(X=(Min=100,Max=200),Y=(Min=100,Max=100),Z=(Min=100,Max=100))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.starburst'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.5,Max=0.5)
    end object
    Emitters(1)=SpriteEmitter5
    Begin Object name=MeshEmitter0 class=MeshEmitter
        StaticMesh=StaticMesh'Shrek2_EFX_SM.Beanstalk.handsome_boot'
        RenderTwoSided=true
        Acceleration=(X=0,Y=0,Z=-200)
        UseCollision=true
        DampingFactorRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=0.5,Max=0.5))
        MaxParticles=2
        RespawnDeadParticles=false
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.5,Max=0.5),Y=(Min=0.5,Max=0.5),Z=(Min=0,Max=0))
        InitialParticlesPerSecond=10
        AutomaticInitialSpawning=false
        SecondsBeforeInactive=0
        LifetimeRange=(Min=3,Max=3)
        StartVelocityRange=(X=(Min=20,Max=40),Y=(Min=20,Max=-20),Z=(Min=75,Max=75))
    end object
    Emitters(2)=MeshEmitter0
    fTimeSoFar=2342.3
}
