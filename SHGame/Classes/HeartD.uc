//================================================================================
// HeartD.
//================================================================================

class HeartD extends Shrk2_Frontend_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter11 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        MaxParticles=1
        Disabled=true
        StartSizeRange=(X=(Min=15,Max=15),Y=(Min=15,Max=15),Z=(Min=1,Max=1))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_AlphaBlend
        Texture=Texture'Shrek2_EFX.storybook_particles.Heart4'
        LifetimeRange=(Min=1,Max=1)
    end object
    Emitters(0)=SpriteEmitter11
    TriggerToggleSpawning=true
    fTimeSoFar=76430.02
}
