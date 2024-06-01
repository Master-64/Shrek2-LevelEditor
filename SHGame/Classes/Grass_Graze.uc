//================================================================================
// Grass_Graze.
//================================================================================

class Grass_Graze extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter14 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-60)
        UseCollision=true
        DampingFactorRange=(X=(Min=0.2,Max=0.2),Y=(Min=0.2,Max=0.2),Z=(Min=0.2,Max=0.2))
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=128,G=128,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.99999,Color=(B=0,G=128,R=0,A=0))
        FadeOutStartTime=5.34
        FadeOut=true
        MaxParticles=4
        RespawnDeadParticles=false
        AutoResetTimeRange=(Min=0.5,Max=0.5)
        StartLocationRange=(X=(Min=-6,Max=6),Y=(Min=-6,Max=6),Z=(Min=0,Max=0))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.4,Max=0.4),Y=(Min=0.4,Max=0.4),Z=(Min=0.4,Max=0.4))
        StartSpinRange=(X=(Min=0.25,Max=0.25),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        UseSizeScale=true
        SizeScaleRepeats=100
        StartSizeRange=(X=(Min=16,Max=20),Y=(Min=16,Max=20),Z=(Min=16,Max=20))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.hair'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.8,Max=1)
        StartVelocityRange=(X=(Min=-20,Max=20),Y=(Min=-20,Max=20),Z=(Min=0,Max=30))
        StartVelocityRadialRange=(Min=1,Max=5)
    end object
    Emitters(0)=SpriteEmitter14
    fTimeSoFar=206.5264
}
