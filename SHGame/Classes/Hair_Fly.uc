//================================================================================
// Hair_Fly.
//================================================================================

class Hair_Fly extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter3 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-80)
        UseCollision=true
        DampingFactorRange=(X=(Min=0.2,Max=0.2),Y=(Min=0.2,Max=0.2),Z=(Min=0.2,Max=0.2))
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=16,G=107,R=190,A=0))
        ColorScale(1)=(RelativeTime=0.999,Color=(B=45,G=104,R=170,A=0))
        FadeOutStartTime=5.34
        RespawnDeadParticles=false
        AutoResetTimeRange=(Min=0.5,Max=0.5)
        StartLocationRange=(X=(Min=-6,Max=6),Y=(Min=-6,Max=6),Z=(Min=0,Max=0))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.25,Max=0.5),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        StartSpinRange=(X=(Min=0.25,Max=0.25),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        UseSizeScale=true
        SizeScaleRepeats=100
        StartSizeRange=(X=(Min=7,Max=4),Y=(Min=7,Max=4),Z=(Min=7,Max=4))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.hair'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.8,Max=1)
        StartVelocityRange=(X=(Min=-15,Max=15),Y=(Min=-15,Max=15),Z=(Min=0,Max=80))
        StartVelocityRadialRange=(Min=1,Max=5)
    end object
    Emitters(0)=SpriteEmitter3
    fTimeSoFar=324.4807
}
