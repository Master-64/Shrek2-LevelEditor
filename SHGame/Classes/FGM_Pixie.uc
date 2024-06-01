//================================================================================
// FGM_Pixie.
//================================================================================

class FGM_Pixie extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=30)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=255,G=255,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=255,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.999,Color=(B=128,G=0,R=255,A=0))
        MaxParticles=8
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        StartSizeRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.pixie_dust'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=3)
        StartVelocityRange=(X=(Min=-10,Max=10),Y=(Min=-10,Max=10),Z=(Min=0,Max=0))
    end object
    Emitters(0)=SpriteEmitter2
    fTimeSoFar=602.3542
}
