//================================================================================
// Potion_Shrink.
//================================================================================

class Potion_Shrink extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-30)
        Opacity=0.6
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.0125,Color=(B=0,G=128,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.8,Color=(B=255,G=255,R=255,A=0))
        ColorScaleRepeats=10
        FadeOutStartTime=0.65
        FadeOut=true
        MaxParticles=50
        StartLocationRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=20,Max=20))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        StartSpinRange=(X=(Min=20,Max=10),Y=(Min=20,Max=10),Z=(Min=20,Max=10))
        SizeScale(0)=(RelativeTime=0.85,RelativeSize=0.2)
        StartSizeRange=(X=(Min=1.5,Max=2),Y=(Min=1.5,Max=2),Z=(Min=1.5,Max=2))
        UniformSize=true
        InitialParticlesPerSecond=5000
        Texture=Texture'Shrek2_EFX.Gen_Particle.sparkle'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1.45)
        StartVelocityRange=(X=(Min=-60,Max=60),Y=(Min=-60,Max=60),Z=(Min=0,Max=0))
        WarmupTicksPerSecond=1
        RelativeWarmupTime=0.85
    end object
    Emitters(0)=SpriteEmitter2
    fTimeSoFar=2203.002
}
