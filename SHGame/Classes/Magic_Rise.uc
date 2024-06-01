//================================================================================
// Magic_Rise.
//================================================================================

class Magic_Rise extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.1,Color=(B=0,G=0,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=0,R=0,A=0))
        ColorScale(2)=(RelativeTime=0.8,Color=(B=128,G=0,R=128,A=128))
        FadeOutStartTime=0.9
        FadeOut=true
        CoordinateSystem=PTCS_Relative
        MaxParticles=25
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.7,Max=0.7),Y=(Min=0.7,Max=0.7),Z=(Min=0.7,Max=0.7))
        StartSizeRange=(X=(Min=15,Max=30),Y=(Min=15,Max=30),Z=(Min=15,Max=30))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.dazzl1'
        SecondsBeforeInactive=0
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=100,Max=100))
        StartVelocityRadialRange=(Min=10,Max=10)
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=779.8659
}
