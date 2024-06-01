//================================================================================
// SPotion_A.
//================================================================================

class SPotion_A extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Opacity=0.8
        FadeOut=true
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        StartSizeRange=(X=(Min=8,Max=35),Y=(Min=8,Max=35),Z=(Min=8,Max=35))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.potion1'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=10,Max=10),Y=(Min=10,Max=10),Z=(Min=40,Max=40))
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Opacity=0.5
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.1,Color=(B=128,G=0,R=128,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=48,G=7,R=237,A=0))
        ColorScaleRepeats=0.5
        MaxParticles=4
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.5,Max=0.5),Y=(Min=0.5,Max=0.5),Z=(Min=0.5,Max=0.5))
        StartSizeRange=(X=(Min=45,Max=38),Y=(Min=45,Max=38),Z=(Min=45,Max=38))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.smk1'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=20,Max=50))
    end object
    Emitters(1)=SpriteEmitter1
    fTimeSoFar=1160.873
}
