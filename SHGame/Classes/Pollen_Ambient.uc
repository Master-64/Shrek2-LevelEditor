//================================================================================
// Pollen_Ambient.
//================================================================================

class Pollen_Ambient extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        MaxParticles=200
        StartLocationRange=(X=(Min=-4000,Max=4000),Y=(Min=-4000,Max=4000),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=5,Max=10),Y=(Min=5,Max=10),Z=(Min=5,Max=10))
        UniformSize=true
        DrawStyle=PTDS_AlphaBlend
        Texture=Texture'Shrek2_EFX.Gen_Particle.pollen'
        LifetimeRange=(Min=4,Max=20)
        StartVelocityRange=(X=(Min=0,Max=60),Y=(Min=0,Max=80),Z=(Min=-100,Max=-150))
    end object
    Emitters(0)=SpriteEmitter1
    fTimeSoFar=1568.377
}
