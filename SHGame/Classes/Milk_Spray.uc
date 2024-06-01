//================================================================================
// Milk_Spray.
//================================================================================

class Milk_Spray extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Opacity=0.5
        FadeOut=true
        MaxParticles=25
        RespawnDeadParticles=false
        SpinsPerSecondRange=(X=(Min=0.5,Max=1),Y=(Min=0.5,Max=1),Z=(Min=0.5,Max=1))
        StartSizeRange=(X=(Min=140,Max=200),Y=(Min=140,Max=200),Z=(Min=140,Max=200))
        UniformSize=true
        ParticlesPerSecond=10
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_ball1'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1.5,Max=2.5)
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        FadeOut=true
        MaxParticles=25
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        StartSizeRange=(X=(Min=100,Max=150),Y=(Min=100,Max=150),Z=(Min=100,Max=150))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.waterdrop'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.5,Max=1)
    end object
    Emitters(1)=SpriteEmitter1
    fTimeSoFar=809.5051
}
