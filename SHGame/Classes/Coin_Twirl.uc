//================================================================================
// Coin_Twirl.
//================================================================================

class Coin_Twirl extends Shrk2_Pickup_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.1,Color=(B=255,G=255,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=0,G=255,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.8,Color=(B=255,G=255,R=255,A=0))
        FadeOut=true
        MaxParticles=4
        StartLocationRange=(X=(Min=-15,Max=15),Y=(Min=-15,Max=15),Z=(Min=-15,Max=15))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.7,Max=0.7),Y=(Min=0.7,Max=0.7),Z=(Min=0.7,Max=0.7))
        StartSizeRange=(X=(Min=4,Max=6),Y=(Min=4,Max=6),Z=(Min=4,Max=6))
        UniformSize=true
        ParticlesPerSecond=4
        Texture=Texture'Shrek2_EFX.Gen_Particle.sparkle'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2.5)
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=747.2117
}
