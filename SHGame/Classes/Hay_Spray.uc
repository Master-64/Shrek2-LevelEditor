//================================================================================
// Hay_Spray.
//================================================================================

class Hay_Spray extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-100)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=0,G=128,R=128,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=0,G=210,R=210,A=0))
        ColorScale(2)=(RelativeTime=0.999,Color=(B=64,G=128,R=128,A=0))
        FadeOut=true
        MaxParticles=25
        RespawnDeadParticles=false
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.3,Max=0.3),Y=(Min=0.3,Max=0.3),Z=(Min=0.3,Max=0.3))
        StartSizeRange=(X=(Min=30,Max=30),Y=(Min=30,Max=30),Z=(Min=30,Max=30))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.hair'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1.2)
        StartVelocityRange=(X=(Min=-45,Max=45),Y=(Min=-45,Max=45),Z=(Min=90,Max=90))
        WarmupTicksPerSecond=0.35
        RelativeWarmupTime=1
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=431.3533
}
