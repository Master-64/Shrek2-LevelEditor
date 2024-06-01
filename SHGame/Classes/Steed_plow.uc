//================================================================================
// Steed_plow.
//================================================================================

class Steed_plow extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
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
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
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
    Emitters(1)=SpriteEmitter1
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-10)
        Opacity=0.8
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=192,G=128,R=128,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=192,G=128,R=128,A=0))
        ColorScale(2)=(RelativeTime=1,Color=(B=255,G=255,R=255,A=0))
        FadeOutStartTime=0.7
        FadeOut=true
        MaxParticles=50
        LowScale=0.2
        RespawnDeadParticles=false
        StartLocationOffset=(X=0,Y=0,Z=10)
        StartLocationRange=(X=(Min=-10,Max=10),Y=(Min=-10,Max=10),Z=(Min=-10,Max=10))
        StartLocationShape=PTLS_Sphere
        SphereRadiusRange=(Min=0,Max=20)
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.3,Max=1),Y=(Min=0.3,Max=1),Z=(Min=0,Max=1))
        StartSizeRange=(X=(Min=10,Max=10),Y=(Min=10,Max=10),Z=(Min=100,Max=100))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.hair'
        SecondsBeforeInactive=0
        StartVelocityRange=(X=(Min=-25,Max=25),Y=(Min=-25,Max=25),Z=(Min=-25,Max=25))
        UseVelocityScale=true
    end object
    Emitters(2)=SpriteEmitter2
    fTimeSoFar=2967.859
}
