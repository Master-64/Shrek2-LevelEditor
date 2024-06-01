//================================================================================
// Blue_Beam.
//================================================================================

class Blue_Beam extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=BeamEmitter1 class=BeamEmitter
        Opacity=0.6
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.1,Color=(B=255,G=0,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=253,G=45,R=118,A=0))
        MaxParticles=3
        StartSizeRange=(X=(Min=50,Max=100),Y=(Min=50,Max=100),Z=(Min=100,Max=200))
        ParticlesPerSecond=10
        Texture=Texture'Shrek2_EFX.Gen_Particle.Blue_Beam'
        StartVelocityRange=(X=(Min=35,Max=100),Y=(Min=35,Max=100),Z=(Min=35,Max=100))
    end object
    Emitters(0)=BeamEmitter1
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Opacity=0.8
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.1,Color=(B=255,G=0,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.4,Color=(B=199,G=12,R=124,A=0))
        FadeOutStartTime=0.95
        FadeOut=true
        MaxParticles=5
        StartLocationRange=(X=(Min=-10,Max=20),Y=(Min=0,Max=-10),Z=(Min=0,Max=-10))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0,Max=0.5),Y=(Min=0,Max=0.5),Z=(Min=0,Max=0.5))
        StartSizeRange=(X=(Min=55,Max=60),Y=(Min=55,Max=60),Z=(Min=55,Max=60))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.smk1'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
    end object
    Emitters(1)=SpriteEmitter0
    fTimeSoFar=1339.926
}
