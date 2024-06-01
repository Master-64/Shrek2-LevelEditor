//================================================================================
// FGM_Spell2_D.
//================================================================================

class FGM_Spell2_D extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter17 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=60)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=0,G=0,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.999,Color=(B=0,G=255,R=255,A=0))
        CoordinateSystem=PTCS_Relative
        MaxParticles=8
        LowScale=0.2
        RespawnDeadParticles=false
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.4,Max=0.4),Y=(Min=0.4,Max=0.4),Z=(Min=0.4,Max=0.4))
        StartSizeRange=(X=(Min=50,Max=50),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.mist'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=-10,Max=10),Y=(Min=-10,Max=10),Z=(Min=0,Max=10))
    end object
    Emitters(0)=SpriteEmitter17
    fTimeSoFar=381.7793
}
