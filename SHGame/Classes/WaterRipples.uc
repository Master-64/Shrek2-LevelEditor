//================================================================================
// WaterRipples.
//================================================================================

class WaterRipples extends Shrk2_Env_FX;

var float fCurrTime;

defaultproperties
{
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        Opacity=0.2
        ColorScale(0)=(RelativeTime=0,Color=(B=248,G=245,R=203,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=201,G=147,R=114,A=0))
        FadeOut=true
        MaxParticles=6
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=-3,Max=3),Y=(Min=-3,Max=3),Z=(Min=0,Max=0))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=5)
        StartSizeRange=(X=(Min=5,Max=15),Y=(Min=5,Max=15),Z=(Min=100,Max=100))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.WaterRing'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.45,Max=1.5)
    end object
    Emitters(0)=SpriteEmitter2
    fTimeSoFar=446.4132
}
