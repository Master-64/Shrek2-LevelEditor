//================================================================================
// range_attack.
//================================================================================

class range_attack extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        FadeOut=true
        MaxParticles=1
        RespawnDeadParticles=false
        SpinParticles=true
        SpinCCWorCW=(X=-1,Y=0,Z=0)
        SpinsPerSecondRange=(X=(Min=2,Max=2),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=10)
        StartSizeRange=(X=(Min=50,Max=50),Y=(Min=50,Max=50),Z=(Min=100,Max=100))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.range_attack'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
    end object
    Emitters(0)=SpriteEmitter0
}
