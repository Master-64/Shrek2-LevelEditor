//================================================================================
// Potion_Strngth.
//================================================================================

class Potion_Strngth extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Acceleration=(X=-20,Y=-20,Z=30)
        Opacity=0.85
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.0125,Color=(B=0,G=0,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.8,Color=(B=255,G=255,R=255,A=0))
        ColorScaleRepeats=10
        FadeOutStartTime=0.65
        FadeOut=true
        MaxParticles=5
        StartLocationRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=20,Max=20))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.8,Max=0.8),Y=(Min=0.8,Max=0.8),Z=(Min=0.8,Max=0.8))
        StartSpinRange=(X=(Min=20,Max=10),Y=(Min=20,Max=10),Z=(Min=20,Max=10))
        SizeScale(0)=(RelativeTime=0.85,RelativeSize=0.2)
        StartSizeRange=(X=(Min=2,Max=3),Y=(Min=2,Max=3),Z=(Min=2,Max=3))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.sparkle'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.85,Max=1.2)
        StartVelocityRange=(X=(Min=-20,Max=40),Y=(Min=-20,Max=40),Z=(Min=5,Max=10))
        RelativeWarmupTime=0.85
    end object
    Emitters(0)=SpriteEmitter1
    fTimeSoFar=1524.944
}
