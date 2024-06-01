//================================================================================
// FGM_Spell2_A.
//================================================================================

class FGM_Spell2_A extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter11 class=SpriteEmitter
        FadeOut=true
        CoordinateSystem=PTCS_Relative
        MaxParticles=8
        LowScale=0.3
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.8,Max=0.8),Y=(Min=0.8,Max=0.8),Z=(Min=0.8,Max=0.8))
        StartSizeRange=(X=(Min=14,Max=14),Y=(Min=14,Max=14),Z=(Min=14,Max=14))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.big_spell'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=-5,Max=5),Y=(Min=-5,Max=5),Z=(Min=-5,Max=5))
        WarmupTicksPerSecond=0.75
        RelativeWarmupTime=1
    end object
    Emitters(0)=SpriteEmitter11
    Begin Object name=SpriteEmitter12 class=SpriteEmitter
        Acceleration=(X=-30,Y=-30,Z=20)
        Opacity=0.5
        FadeOut=true
        LowScale=0.2
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.5,Max=1),Y=(Min=0.5,Max=1),Z=(Min=0.5,Max=1))
        StartSizeRange=(X=(Min=11,Max=15),Y=(Min=11,Max=15),Z=(Min=11,Max=15))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.big_spell2'
        UseRandomSubdivision=true
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.8,Max=1)
    end object
    Emitters(1)=SpriteEmitter12
    Begin Object name=SpriteEmitter13 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=25)
        Opacity=0.35
        FadeOut=true
        LowScale=0.2
        StartLocationOffset=(X=0,Y=0,Z=12)
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        StartSizeRange=(X=(Min=21,Max=25),Y=(Min=21,Max=25),Z=(Min=21,Max=25))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.mist'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
    end object
    Emitters(2)=SpriteEmitter13
    fTimeSoFar=2382.485
}
