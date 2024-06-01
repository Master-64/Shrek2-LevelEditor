//================================================================================
// Rain_Storm.
//================================================================================

class Rain_Storm extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        UseDirectionAs=PTDU_Up
        Opacity=0.3
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=192,G=128,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=192,G=128,R=0,A=0))
        MaxParticles=2000
        StartLocationRange=(X=(Min=-2000,Max=2000),Y=(Min=-2000,Max=2000),Z=(Min=0,Max=0))
        UseRegularSizeScale=false
        StartSizeRange=(X=(Min=3,Max=3),Y=(Min=50,Max=50),Z=(Min=0,Max=0))
        Texture=Texture'Shrek2_EFX.Gen_Particle.rain'
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=-10000,Max=-10000))
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=3044.689
}
