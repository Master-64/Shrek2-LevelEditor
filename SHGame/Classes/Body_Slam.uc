//================================================================================
// Body_Slam.
//================================================================================

class Body_Slam extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        Opacity=0.55
        FadeOut=true
        MaxParticles=1
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=-3,Max=3),Y=(Min=-3,Max=3),Z=(Min=0,Max=0))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=5)
        StartSizeRange=(X=(Min=60,Max=60),Y=(Min=60,Max=60),Z=(Min=0,Max=0))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.circle_blow'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
    end object
    Emitters(0)=SpriteEmitter2
    Begin Object name=SpriteEmitter3 class=SpriteEmitter
        Acceleration=(X=100,Y=-100,Z=20)
        Opacity=0.4
        ColorScale(0)=(RelativeTime=0,Color=(B=64,G=128,R=128,A=0))
        FadeOutStartTime=0.3
        FadeOut=true
        MaxParticles=50
        LowScale=0.2
        RespawnDeadParticles=false
        StartLocationOffset=(X=0,Y=0,Z=-10)
        SpinParticles=true
        StartSizeRange=(X=(Min=30,Max=30),Y=(Min=30,Max=30),Z=(Min=30,Max=30))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=200,Max=-200),Y=(Min=200,Max=-200),Z=(Min=0,Max=0))
        StartVelocityRadialRange=(Min=-100,Max=100)
    end object
    Emitters(1)=SpriteEmitter3
    fTimeSoFar=3491.573
}
