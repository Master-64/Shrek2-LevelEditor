//================================================================================
// Potion_Sleep.
//================================================================================

class Potion_Sleep extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Opacity=0.85
        FadeOutStartTime=0.8
        FadeOut=true
        MaxParticles=5
        UseSizeScale=true
        SizeScale(0)=(RelativeTime=0.8,RelativeSize=0.5)
        StartSizeRange=(X=(Min=10,Max=15),Y=(Min=10,Max=15),Z=(Min=10,Max=15))
        UniformSize=true
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.sleepy'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=4)
        StartVelocityRange=(X=(Min=0,Max=-8),Y=(Min=0,Max=-8),Z=(Min=30,Max=30))
        RelativeWarmupTime=0.5
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=737.1077
}
