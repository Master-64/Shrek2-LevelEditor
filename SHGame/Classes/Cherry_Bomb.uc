//================================================================================
// Cherry_Bomb.
//================================================================================

class Cherry_Bomb extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter8 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        FadeOut=true
        MaxParticles=3
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=-3,Max=3),Y=(Min=-3,Max=3),Z=(Min=0,Max=0))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=5)
        StartSizeRange=(X=(Min=60,Max=60),Y=(Min=60,Max=60),Z=(Min=0,Max=0))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.red_wave'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
    end object
    Emitters(0)=SpriteEmitter8
    Begin Object name=SpriteEmitter9 class=SpriteEmitter
        Opacity=0.86
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=0,G=0,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=16,G=11,R=238,A=0))
        ColorScale(2)=(RelativeTime=0.999,Color=(B=35,G=33,R=133,A=0))
        RespawnDeadParticles=false
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.3,Max=0.5),Y=(Min=0.3,Max=0.5),Z=(Min=0.3,Max=0.5))
        StartSizeRange=(X=(Min=50,Max=80),Y=(Min=50,Max=80),Z=(Min=50,Max=80))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.flower_Pwr'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.5,Max=1)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=200,Max=200))
    end object
    Emitters(1)=SpriteEmitter9
    Begin Object name=SpriteEmitter10 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=255,G=255,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.1,Color=(B=0,G=0,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.999,Color=(B=5,G=0,R=232,A=0))
        FadeOut=true
        MaxParticles=1
        RespawnDeadParticles=false
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        UseSizeScale=true
        SizeScale(0)=(RelativeSize=1,RelativeSize=7)
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.fire_spot2'
        SecondsBeforeInactive=0
    end object
    Emitters(2)=SpriteEmitter10
    fTimeSoFar=2146.327
}
