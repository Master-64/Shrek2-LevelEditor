//================================================================================
// FGM_Spell1_A.
//================================================================================

class FGM_Spell1_A extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter4 class=SpriteEmitter
        Opacity=0.8
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=252,G=216,R=248,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=170,G=0,R=170,A=0))
        ColorScale(2)=(RelativeTime=0.99,Color=(B=255,G=0,R=0,A=0))
        FadeOut=true
        CoordinateSystem=PTCS_Relative
        MaxParticles=15
        LowScale=0.2
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.8,Max=0.8),Y=(Min=0.8,Max=0.8),Z=(Min=0.8,Max=0.8))
        StartSizeRange=(X=(Min=14,Max=14),Y=(Min=14,Max=14),Z=(Min=14,Max=14))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.elecswirl'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=-10,Max=10),Y=(Min=-10,Max=10),Z=(Min=-10,Max=10))
    end object
    Emitters(0)=SpriteEmitter4
    Begin Object name=SpriteEmitter5 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=255,G=0,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.99,Color=(B=247,G=9,R=199,A=0))
        FadeOut=true
        MaxParticles=45
        LowScale=0.2
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.3,Max=0.3),Y=(Min=0.3,Max=0.3),Z=(Min=0.3,Max=0.3))
        StartSizeRange=(X=(Min=11,Max=15),Y=(Min=11,Max=15),Z=(Min=11,Max=15))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.dazzl1'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=-5,Max=5),Y=(Min=-5,Max=5),Z=(Min=-5,Max=5))
        WarmupTicksPerSecond=0.8
        RelativeWarmupTime=1
    end object
    Emitters(1)=SpriteEmitter5
    Begin Object name=SpriteEmitter6 class=SpriteEmitter
        Opacity=0.75
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=216,G=29,R=80,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=136,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.99,Color=(B=215,G=0,R=155,A=0))
        CoordinateSystem=PTCS_Relative
        MaxParticles=3
        StartSizeRange=(X=(Min=8,Max=12),Y=(Min=8,Max=12),Z=(Min=8,Max=12))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.fire_spot2'
        SecondsBeforeInactive=0
        WarmupTicksPerSecond=0.8
        RelativeWarmupTime=1
    end object
    Emitters(2)=SpriteEmitter6
    fTimeSoFar=1562.448
}
