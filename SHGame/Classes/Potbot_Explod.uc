//================================================================================
// Potbot_Explod.
//================================================================================

class Potbot_Explod extends Shrk2_Pickup_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter5 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-60)
        UseCollision=true
        DampingFactorRange=(X=(Min=0.2,Max=0.2),Y=(Min=0.2,Max=0.2),Z=(Min=0.2,Max=0.2))
        Opacity=0.8
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.1,Color=(B=0,G=0,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.2,Color=(B=128,G=255,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.75,Color=(B=0,G=255,R=255,A=255))
        ColorScale(3)=(RelativeTime=1,Color=(B=0,G=0,R=0,A=255))
        FadeOutFactor=(W=0.5,X=0.5,Y=0.5,Z=0.5)
        FadeOutStartTime=8
        FadeOut=true
        RespawnDeadParticles=false
        AutoResetTimeRange=(Min=0.5,Max=0.5)
        StartLocationRange=(X=(Min=-6,Max=6),Y=(Min=-6,Max=6),Z=(Min=0,Max=0))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.8,Max=0.8),Y=(Min=0.8,Max=0.8),Z=(Min=0.8,Max=0.8))
        StartSpinRange=(X=(Min=0.25,Max=0.25),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        UseSizeScale=true
        SizeScaleRepeats=100
        StartSizeRange=(X=(Min=30,Max=40),Y=(Min=30,Max=40),Z=(Min=30,Max=40))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.flower_Pwr'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1.3)
        StartVelocityRadialRange=(Min=1,Max=5)
    end object
    Emitters(0)=SpriteEmitter5
    fTimeSoFar=521.1566
}
