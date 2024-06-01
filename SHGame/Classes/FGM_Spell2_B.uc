//================================================================================
// FGM_Spell2_B.
//================================================================================

class FGM_Spell2_B extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter14 class=SpriteEmitter
        Acceleration=(X=5,Y=5,Z=-70)
        UseCollision=true
        DampingFactorRange=(X=(Min=0.2,Max=0.2),Y=(Min=0.2,Max=0.2),Z=(Min=0.2,Max=0.2))
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=0,G=0,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=0,G=128,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.999,Color=(B=0,G=255,R=255,A=0))
        FadeOutStartTime=5.34
        FadeOut=true
        MaxParticles=30
        LowScale=0.2
        RespawnDeadParticles=false
        AutoResetTimeRange=(Min=0.5,Max=0.5)
        StartLocationRange=(X=(Min=-6,Max=6),Y=(Min=-6,Max=6),Z=(Min=0,Max=0))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.8,Max=1),Y=(Min=0.8,Max=1),Z=(Min=0.8,Max=1))
        StartSpinRange=(X=(Min=0.25,Max=0.25),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        UseSizeScale=true
        SizeScaleRepeats=100
        StartSizeRange=(X=(Min=10,Max=15),Y=(Min=10,Max=15),Z=(Min=10,Max=15))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.big_spell2'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=3)
        StartVelocityRange=(X=(Min=-55,Max=55),Y=(Min=-55,Max=55),Z=(Min=0,Max=150))
        StartVelocityRadialRange=(Min=1,Max=5)
    end object
    Emitters(0)=SpriteEmitter14
    Begin Object name=SpriteEmitter15 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=35)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=0,G=255,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.999,Color=(B=0,G=128,R=255,A=0))
        LowScale=0.2
        RespawnDeadParticles=false
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.4,Max=0.4),Y=(Min=0,Max=0),Z=(Min=0.4,Max=0.4))
        StartSizeRange=(X=(Min=15,Max=25),Y=(Min=15,Max=25),Z=(Min=15,Max=25))
        UniformSize=true
        InitialParticlesPerSecond=5000
        Texture=Texture'Shrek2_EFX.Gen_Particle.mist'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.4,Max=1)
        WarmupTicksPerSecond=0.4
        RelativeWarmupTime=1
    end object
    Emitters(1)=SpriteEmitter15
    fTimeSoFar=1175.233
}
