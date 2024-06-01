//================================================================================
// SpMove_Explod.
//================================================================================

class SpMove_Explod extends Shrk2_Pickup_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-60)
        UseCollision=true
        DampingFactorRange=(X=(Min=0.2,Max=0.2),Y=(Min=0.2,Max=0.2),Z=(Min=0.2,Max=0.2))
        UseColorScale=true
        ColorScale(0)=(RelativeTime=1,Color=(B=255,G=0,R=0,A=0))
        ColorScale(1)=(RelativeTime=2,Color=(B=0,G=0,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.75,Color=(B=0,G=255,R=255,A=255))
        ColorScale(3)=(RelativeTime=1,Color=(B=0,G=0,R=0,A=255))
        FadeOutStartTime=5.34
        RespawnDeadParticles=false
        AutoResetTimeRange=(Min=0.5,Max=0.5)
        StartLocationRange=(X=(Min=-6,Max=6),Y=(Min=-6,Max=6),Z=(Min=0,Max=0))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.25,Max=0.5),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        StartSpinRange=(X=(Min=0.25,Max=0.25),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        UseSizeScale=true
        SizeScaleRepeats=100
        StartSizeRange=(X=(Min=4,Max=35),Y=(Min=1,Max=20),Z=(Min=1,Max=20))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.dazzl2'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.8,Max=1)
        StartVelocityRange=(X=(Min=-15,Max=15),Y=(Min=-15,Max=15),Z=(Min=0,Max=80))
        StartVelocityRadialRange=(Min=1,Max=5)
    end object
    Emitters(0)=SpriteEmitter1
    fTimeSoFar=77.88269
}
