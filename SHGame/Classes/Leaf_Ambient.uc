//================================================================================
// Leaf_Ambient.
//================================================================================

class Leaf_Ambient extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        MaxParticles=80
        StartLocationRange=(X=(Min=-4000,Max=4000),Y=(Min=-4000,Max=4000),Z=(Min=0,Max=0))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.2,Max=0.2),Y=(Min=0.2,Max=0.2),Z=(Min=0.2,Max=0.2))
        StartSizeRange=(X=(Min=5,Max=10),Y=(Min=5,Max=10),Z=(Min=5,Max=10))
        UniformSize=true
        DrawStyle=PTDS_AlphaBlend
        Texture=Texture'Shrek2_EFX.Gen_Particle.leaf'
        LifetimeRange=(Min=4,Max=20)
        StartVelocityRange=(X=(Min=0,Max=60),Y=(Min=0,Max=80),Z=(Min=-100,Max=-150))
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=1707.659
}
