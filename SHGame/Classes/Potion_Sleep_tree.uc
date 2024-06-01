//================================================================================
// Potion_Sleep_tree.
//================================================================================

class Potion_Sleep_tree extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Opacity=0.85
        FadeOutStartTime=0.8
        FadeOut=true
        MaxParticles=5
        UseSizeScale=true
        SizeScale(0)=(RelativeTime=0.8,RelativeSize=0.5)
        StartSizeRange=(X=(Min=60,Max=75),Y=(Min=60,Max=75),Z=(Min=60,Max=75))
        UniformSize=true
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.sleepy'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=3,Max=6)
        StartVelocityRange=(X=(Min=-30,Max=-30),Y=(Min=-30,Max=-30),Z=(Min=30,Max=30))
        RelativeWarmupTime=0.5
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=999.1586
}
