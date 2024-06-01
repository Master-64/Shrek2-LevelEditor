//================================================================================
// Rain_Ambient.
//================================================================================

class Rain_Ambient extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-1000)
        Opacity=0.5
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=192,G=128,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=192,G=128,R=0,A=0))
        MaxParticles=200
        StartLocationRange=(X=(Min=-1000,Max=1000),Y=(Min=-1000,Max=1000),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=3,Max=3),Y=(Min=10,Max=10),Z=(Min=10,Max=10))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.rain'
        LifetimeRange=(Min=4,Max=20)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=-100,Max=-150))
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=2167.907
}
