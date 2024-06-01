//================================================================================
// Env_Alarm.
//================================================================================

class Env_Alarm extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.1,Color=(B=0,G=0,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=255,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.8,Color=(B=0,G=0,R=255,A=0))
        FadeOut=true
        MaxParticles=2
        StartLocationRange=(X=(Min=-2,Max=2),Y=(Min=-2,Max=2),Z=(Min=-2,Max=2))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.7,Max=0.7),Y=(Min=0.7,Max=0.7),Z=(Min=0.7,Max=0.7))
        StartSizeRange=(X=(Min=15,Max=15),Y=(Min=15,Max=15),Z=(Min=5,Max=15))
        UniformSize=true
        ParticlesPerSecond=4
        Texture=Texture'Shrek2_EFX.Gen_Particle.fire_spot2'
        LifetimeRange=(Min=0.2,Max=0.5)
    end object
    Emitters(0)=SpriteEmitter1
    Begin Object name=BeamEmitter1 class=BeamEmitter
        Opacity=0.5
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=0,G=0,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.3,Color=(B=0,G=0,R=168,A=0))
        FadeOut=true
        MaxParticles=5
        StartSizeRange=(X=(Min=70,Max=70),Y=(Min=70,Max=70),Z=(Min=70,Max=0))
        Texture=Texture'Shrek2_EFX.Gen_Particle.sparkle'
        LifetimeRange=(Min=0.5,Max=1)
        StartVelocityRange=(X=(Min=-10,Max=10),Y=(Min=-10,Max=10),Z=(Min=-10,Max=10))
    end object
    Emitters(1)=BeamEmitter1
    fTimeSoFar=2493.644
    AmbientSound=Sound'FGM_laboratory.alarm_loop1'
    Tag=Env_Alarm
    Location=(X=-749,Y=-740,Z=-278)
    SoundRadius=50
    TransientSoundVolume=0.2
    bSelected=true
}
