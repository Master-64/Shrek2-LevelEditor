//================================================================================
// Tear.
//================================================================================

class Tear extends Shrk2_Storybook2_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter3 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        MaxParticles=1
        StartSizeRange=(X=(Min=35,Max=35),Y=(Min=45,Max=45),Z=(Min=1,Max=1))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_AlphaBlend
        Texture=Texture'Shrek2_EFX.storybook_particles.Tear'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=2,Max=2)
    end object
    Emitters(0)=SpriteEmitter3
    fTimeSoFar=2060.285
}
