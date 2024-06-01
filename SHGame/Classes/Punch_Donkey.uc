//================================================================================
// Punch_Donkey.
//================================================================================

class Punch_Donkey extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Opacity=0.75
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=0,G=242,R=242,A=0))
        ColorScaleRepeats=2
        FadeOut=true
        MaxParticles=1
        RespawnDeadParticles=false
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        UseSizeScale=true
        SizeScale(0)=(RelativeTime=1,RelativeSize=50)
        SizeScaleRepeats=2
        StartSizeRange=(X=(Min=80,Max=300),Y=(Min=80,Max=300),Z=(Min=80,Max=80))
        UniformSize=true
        InitialParticlesPerSecond=5000
        Texture=Texture'Shrek2_EFX.Gen_Particle.starburst'
        LifetimeRange=(Min=0.2,Max=0.2)
        WarmupTicksPerSecond=0.8
        RelativeWarmupTime=1
    end object
    Emitters(0)=SpriteEmitter1
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=255,G=255,R=255,A=0))
        FadeOut=true
        MaxParticles=1
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=2)
        SizeScaleRepeats=0.5
        StartSizeRange=(X=(Min=40,Max=40),Y=(Min=40,Max=40),Z=(Min=40,Max=40))
        UniformSize=true
        InitialParticlesPerSecond=5000
        Texture=Texture'Shrek2_EFX.Gen_Particle.light_yel'
        LifetimeRange=(Min=0.2,Max=0.2)
        WarmupTicksPerSecond=0.8
        RelativeWarmupTime=1
    end object
    Emitters(1)=SpriteEmitter2
    Begin Object name=SpriteEmitter3 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=0,G=32,R=64,A=0))
        ColorScale(1)=(RelativeTime=0.7,Color=(B=255,G=255,R=255,A=0))
        FadeOut=true
        MaxParticles=30
        RespawnDeadParticles=false
        SpinsPerSecondRange=(X=(Min=0.1,Max=0.1),Y=(Min=0.1,Max=0.1),Z=(Min=0.1,Max=0.1))
        UseSizeScale=true
        StartSizeRange=(X=(Min=20,Max=25),Y=(Min=20,Max=25),Z=(Min=-5,Max=5))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=-50,Max=50),Y=(Min=-50,Max=50),Z=(Min=-50,Max=50))
    end object
    Emitters(2)=SpriteEmitter3
    fTimeSoFar=1967.12
}
