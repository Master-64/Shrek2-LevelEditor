//================================================================================
// Creature_Explode.
//================================================================================

class Creature_Explode extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-100)
        DampingFactorRange=(X=(Min=0.2,Max=0.2),Y=(Min=0.2,Max=0.2),Z=(Min=0.2,Max=0.2))
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=0,G=128,R=128,A=0))
        ColorScale(1)=(RelativeTime=0.9,Color=(B=0,G=128,R=128,A=0))
        FadeOutStartTime=0.1
        FadeOut=true
        MaxParticles=5
        RespawnDeadParticles=false
        AutoResetTimeRange=(Min=0.5,Max=0.5)
        StartLocationOffset=(X=0,Y=0,Z=-20)
        StartLocationRange=(X=(Min=-6,Max=6),Y=(Min=-6,Max=6),Z=(Min=0,Max=0))
        SpinParticles=true
        SpinCCWorCW=(X=5,Y=5,Z=5)
        SpinsPerSecondRange=(X=(Min=1,Max=2),Y=(Min=1,Max=2),Z=(Min=1,Max=2))
        UseSizeScale=true
        StartSizeRange=(X=(Min=70,Max=70),Y=(Min=70,Max=70),Z=(Min=70,Max=70))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.big_spell'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.7,Max=1)
        StartVelocityRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=0,Max=0))
        StartVelocityRadialRange=(Min=1,Max=1)
   end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-20)
        Opacity=0.3
        FadeOutStartTime=0.5
        FadeOut=true
        FadeInEndTime=0.3
        FadeIn=true
        MaxParticles=30
        RespawnDeadParticles=false
        StartLocationOffset=(X=0,Y=0,Z=-25)
        SpinParticles=true
        UseSizeScale=true
        StartSizeRange=(X=(Min=50,Max=50),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
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
        StartVelocityRange=(X=(Min=75,Max=-75),Y=(Min=75,Max=-75),Z=(Min=0,Max=0))
        StartVelocityRadialRange=(Min=10,Max=10)
   end object
    Emitters(1)=SpriteEmitter1
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=100)
        Opacity=0.4
        FadeOutStartTime=0.3
        FadeOut=true
        MaxParticles=15
        LowScale=0.1
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=40,Max=-40),Y=(Min=40,Max=-40),Z=(Min=0,Max=-20))
        SpinParticles=true
        StartSizeRange=(X=(Min=3,Max=3),Y=(Min=3,Max=3),Z=(Min=3,Max=3))
        UniformSize=true
        InitialParticlesPerSecond=5000
        Texture=Texture'Shrek2_EFX.Gen_Particle.Les_Sparkle_04'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.7,Max=0.7)
        InitialDelayRange=(Min=0.1,Max=0.1)
        StartVelocityRange=(X=(Min=40,Max=-40),Y=(Min=40,Max=-40),Z=(Min=30,Max=30))
   end object
    Emitters(2)=SpriteEmitter2
    fTimeSoFar=3652.608
}
