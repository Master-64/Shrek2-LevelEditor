//================================================================================
// Milk_Hose.
//================================================================================

class Milk_Hose extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter3 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-100)
        MaxParticles=15
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        StartSizeRange=(X=(Min=75,Max=75),Y=(Min=75,Max=75),Z=(Min=75,Max=75))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_ball1'
    end object
    Emitters(0)=SpriteEmitter3
    fTimeSoFar=396.1026
}
