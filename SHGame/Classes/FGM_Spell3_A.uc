//================================================================================
// FGM_Spell3_A.
//================================================================================

class FGM_Spell3_A extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        FadeOut=true
        CoordinateSystem=PTCS_Relative
        MaxParticles=6
        LowScale=0.3
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.8,Max=0.8),Y=(Min=0.8,Max=0.8),Z=(Min=0.8,Max=0.8))
        StartSizeRange=(X=(Min=45,Max=50),Y=(Min=45,Max=50),Z=(Min=45,Max=50))
        UniformSize=true
        InitialParticlesPerSecond=5000
        Texture=Texture'Shrek2_EFX.Gen_Particle.elecbuzz'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=-3,Max=3),Y=(Min=-3,Max=3),Z=(Min=-3,Max=3))
        WarmupTicksPerSecond=0.8
        RelativeWarmupTime=1
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Opacity=0.85
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=255,G=255,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=0,R=0,A=0))
        ColorScale(2)=(RelativeTime=0.999,Color=(B=128,G=64,R=0,A=0))
        FadeOut=true
        MaxParticles=30
        LowScale=0.2
        StartSizeRange=(X=(Min=20,Max=20),Y=(Min=20,Max=20),Z=(Min=20,Max=20))
        UniformSize=true
        InitialParticlesPerSecond=5000
        Texture=Texture'Shrek2_EFX.Gen_Particle.fire_spot2'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=3)
    end object
    Emitters(1)=SpriteEmitter1
    fTimeSoFar=2110.018
}
