//================================================================================
// Dust_Ambient.
//================================================================================

class Dust_Ambient extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Opacity=0.4
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.1,Color=(B=64,G=128,R=128,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=255,R=255,A=0))
        MaxParticles=80
        StartLocationRange=(X=(Min=-100,Max=100),Y=(Min=-100,Max=100),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=0.5,Max=1.5),Y=(Min=0.5,Max=2),Z=(Min=0.5,Max=2))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.dust'
        LifetimeRange=(Min=4,Max=20)
        StartVelocityRange=(X=(Min=0,Max=20),Y=(Min=0,Max=40),Z=(Min=-10,Max=-15))
    end object
    Emitters(0)=SpriteEmitter1
    fTimeSoFar=2652.456
}
