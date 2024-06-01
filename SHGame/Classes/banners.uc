//================================================================================
// banners.
//================================================================================

class banners extends Shrk2_Frontend_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter32 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        MaxParticles=1
        StartSizeRange=(X=(Min=35,Max=35),Y=(Min=50,Max=50),Z=(Min=1,Max=1))
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_AlphaBlend
        Texture=Texture'Shrek2_EFX.storybook_particles.Banners1'
        TextureUSubdivisions=1
        TextureVSubdivisions=2
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
    end object
    Emitters(0)=SpriteEmitter32
    fTimeSoFar=74093.95
}
