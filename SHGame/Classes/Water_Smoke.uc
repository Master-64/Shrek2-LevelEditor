//================================================================================
// Water_Smoke.
//================================================================================

class Water_Smoke extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Opacity=0.7
        FadeOut=true
        MaxParticles=6
        StartLocationRange=(X=(Min=20,Max=60),Y=(Min=20,Max=60),Z=(Min=0,Max=0))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.5,Max=1),Y=(Min=0.5,Max=1),Z=(Min=0.5,Max=1))
        StartSizeRange=(X=(Min=600,Max=600),Y=(Min=600,Max=600),Z=(Min=600,Max=600))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.smk1'
        StartVelocityRange=(X=(Min=100,Max=100),Y=(Min=100,Max=100),Z=(Min=200,Max=200))
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=384.859
}
