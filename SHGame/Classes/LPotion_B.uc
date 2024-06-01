//================================================================================
// LPotion_B.
//================================================================================

class LPotion_B extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Opacity=0.8
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.1,Color=(B=255,G=128,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=128,G=255,R=128,A=0))
        FadeOutStartTime=0.94
        FadeOut=true
        MaxParticles=8
        ResetAfterChange=true
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.7,Max=0.7),Y=(Min=0.7,Max=0.7),Z=(Min=0.7,Max=0.7))
        StartSizeRange=(X=(Min=50,Max=100),Y=(Min=50,Max=100),Z=(Min=50,Max=100))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.potion2'
        SecondsBeforeInactive=0
        StartVelocityRange=(X=(Min=-20,Max=20),Y=(Min=-20,Max=20),Z=(Min=-15,Max=15))
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Opacity=0.6
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.1,Color=(B=255,G=0,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=255,R=0,A=0))
        FadeOut=true
        MaxParticles=6
        ResetAfterChange=true
        StartLocationPolarRange=(X=(Min=-30,Max=30),Y=(Min=-30,Max=30),Z=(Min=-30,Max=30))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.4,Max=0.4),Y=(Min=0.4,Max=0.4),Z=(Min=0.4,Max=0.4))
        UniformSize=true
        ParticlesPerSecond=4
        Texture=Texture'Shrek2_EFX.Gen_Particle.smk1'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=3,Max=3.5)
        StartVelocityRange=(X=(Min=-40,Max=40),Y=(Min=-40,Max=40),Z=(Min=-40,Max=40))
    end object
    Emitters(1)=SpriteEmitter1
    fTimeSoFar=750.3629
}
