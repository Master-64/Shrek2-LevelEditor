//================================================================================
// Lightning.
//================================================================================

class Lightning extends Shrk2_Storybook2_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        MaxParticles=1
        StartSizeRange=(X=(Min=35,Max=35),Y=(Min=45,Max=45),Z=(Min=1,Max=1))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_AlphaBlend
        Texture=Texture'Shrek2_EFX.Gen_Particle.Lightning'
        TextureUSubdivisions=2
        TextureVSubdivisions=1
        LifetimeRange=(Min=2,Max=2)
    end object
    Emitters(0)=SpriteEmitter2
    fTimeSoFar=1953.357
}
