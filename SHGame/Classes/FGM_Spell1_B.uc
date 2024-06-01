//================================================================================
// FGM_Spell1_B.
//================================================================================

class FGM_Spell1_B extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter7 class=SpriteEmitter
        Acceleration=(X=5,Y=5,Z=-100)
        UseCollision=true
        DampingFactorRange=(X=(Min=0.2,Max=0.2),Y=(Min=0.2,Max=0.2),Z=(Min=0.2,Max=0.2))
        Opacity=0.5
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=252,G=3,R=108,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=128,G=0,R=128,A=0))
        ColorScale(2)=(RelativeTime=0.75,Color=(B=251,G=4,R=48,A=255))
        ColorScale(3)=(RelativeTime=0.999,Color=(B=255,G=0,R=255,A=255))
        FadeOutStartTime=5.34
        FadeOut=true
        MaxParticles=25
        LowScale=0.2
        RespawnDeadParticles=false
        AutoResetTimeRange=(Min=0.5,Max=0.5)
        StartLocationRange=(X=(Min=-6,Max=6),Y=(Min=-6,Max=6),Z=(Min=0,Max=0))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        StartSpinRange=(X=(Min=0.25,Max=0.25),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        UseSizeScale=true
        SizeScaleRepeats=100
        StartSizeRange=(X=(Min=20,Max=35),Y=(Min=20,Max=35),Z=(Min=20,Max=35))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.dazzl1'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.8,Max=1)
        StartVelocityRange=(X=(Min=-100,Max=120),Y=(Min=-100,Max=120),Z=(Min=-80,Max=20))
        StartVelocityRadialRange=(Min=1,Max=5)
    end object
    Emitters(0)=SpriteEmitter7
    fTimeSoFar=337.0009
}
