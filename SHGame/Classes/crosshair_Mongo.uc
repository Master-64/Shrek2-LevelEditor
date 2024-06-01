//================================================================================
// crosshair_Mongo.
//================================================================================

class crosshair_Mongo extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        MaxParticles=1
        RespawnDeadParticles=false
        StartLocationOffset=(X=0,Y=0,Z=50)
        SpinCCWorCW=(X=-1,Y=0,Z=0)
        SpinsPerSecondRange=(X=(Min=2,Max=2),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=10)
        StartSizeRange=(X=(Min=250,Max=250),Y=(Min=250,Max=250),Z=(Min=100,Max=100))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.crosshair_tx'
        LifetimeRange=(Min=0.05,Max=0.05)
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=242.1422
}
