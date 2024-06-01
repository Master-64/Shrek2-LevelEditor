//================================================================================
// LrgRain_Ambient.
//================================================================================

class LrgRain_Ambient extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter10 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=255,G=255,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=192,G=128,R=128,A=0))
        ColorScale(2)=(RelativeTime=0.999,Color=(B=255,G=255,R=213,A=0))
        FadeOut=true
        MaxParticles=400
        StartLocationRange=(X=(Min=-2000,Max=2000),Y=(Min=-2000,Max=2000),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=-5,Max=-5),Y=(Min=-5,Max=-5),Z=(Min=-20,Max=-20))
        UniformSize=true
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.rain'
        LifetimeRange=(Min=4,Max=8)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=-200,Max=-200))
    end object
    Emitters(0)=SpriteEmitter10
    fTimeSoFar=2034.807
}
