//================================================================================
// FGM_Spell2_C.
//================================================================================

class FGM_Spell2_C extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter16 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=40)
        UseCollision=true
        DampingFactorRange=(X=(Min=0.2,Max=0.2),Y=(Min=0.2,Max=0.2),Z=(Min=0.2,Max=0.2))
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=0,G=255,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.99,Color=(B=0,G=0,R=255,A=0))
        FadeOutStartTime=5.34
        FadeOut=true
        MaxParticles=35
        LowScale=0.2
        AutoResetTimeRange=(Min=0.5,Max=0.5)
        StartLocationRange=(X=(Min=-6,Max=6),Y=(Min=-6,Max=6),Z=(Min=0,Max=0))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        StartSpinRange=(X=(Min=0.25,Max=0.25),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        UseSizeScale=true
        SizeScaleRepeats=100
        StartSizeRange=(X=(Min=4,Max=5),Y=(Min=4,Max=5),Z=(Min=4,Max=5))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.big_spell2'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRadialRange=(Min=1,Max=5)
        WarmupTicksPerSecond=0.8
        RelativeWarmupTime=1
    end object
    Emitters(0)=SpriteEmitter16
    fTimeSoFar=1154.548
}
