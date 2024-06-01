//================================================================================
// Save_Fairy.
//================================================================================

class Save_Fairy extends Shrk2_Pickup_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=255,G=255,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.35,Color=(B=255,G=255,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.7,Color=(B=255,G=255,R=128,A=0))
        ColorScale(3)=(RelativeTime=0.999,Color=(B=128,G=255,R=255,A=0))
        FadeOut=true
        CoordinateSystem=PTCS_Relative
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.7,Max=0.7),Y=(Min=0.7,Max=0.7),Z=(Min=0.7,Max=0.7))
        StartSizeRange=(X=(Min=10,Max=10),Y=(Min=10,Max=10),Z=(Min=10,Max=10))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.dazzl2'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1.2)
        StartVelocityRange=(X=(Min=-20,Max=20),Y=(Min=-20,Max=20),Z=(Min=50,Max=70))
        WarmupTicksPerSecond=0.35
        RelativeWarmupTime=1
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=1551.873
}
