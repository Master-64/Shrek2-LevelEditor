//================================================================================
// Milk_Gun.
//================================================================================

class Milk_Gun extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter3 class=SpriteEmitter
        Opacity=0.45
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=255,G=255,R=183,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=240,R=210,A=0))
        FadeOut=true
        CoordinateSystem=PTCS_Relative
        MaxParticles=8
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=3,Max=3),Y=(Min=3,Max=3),Z=(Min=3,Max=3))
        StartSizeRange=(X=(Min=30,Max=35),Y=(Min=30,Max=35),Z=(Min=30,Max=35))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.Milk_Bullet'
        SecondsBeforeInactive=0
        WarmupTicksPerSecond=0.8
        RelativeWarmupTime=1
    end object
    Emitters(0)=SpriteEmitter3
    Begin Object name=SpriteEmitter4 class=SpriteEmitter
        FadeOut=true
        MaxParticles=25
        StartSizeRange=(X=(Min=20,Max=35),Y=(Min=20,Max=35),Z=(Min=20,Max=35))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_ball1'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.75,Max=1)
        WarmupTicksPerSecond=0.8
        RelativeWarmupTime=1
    end object
    Emitters(1)=SpriteEmitter4
    fTimeSoFar=586.05
}
