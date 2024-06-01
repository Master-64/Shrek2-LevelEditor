//================================================================================
// Atrium_Drip.
//================================================================================

class Atrium_Drip extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        Opacity=0.25
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=255,G=255,R=185,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=255,R=179,A=0))
        FadeOut=true
        MaxParticles=6
        StartLocationRange=(X=(Min=3,Max=-3),Y=(Min=3,Max=-3),Z=(Min=0,Max=0))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=5)
        StartSizeRange=(X=(Min=15,Max=15),Y=(Min=15,Max=15),Z=(Min=15,Max=15))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.WaterRing'
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=1100.282
}
