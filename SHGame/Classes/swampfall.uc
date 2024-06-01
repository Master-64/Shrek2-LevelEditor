//================================================================================
// swampfall.
//================================================================================

class swampfall extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter3 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        Opacity=0.2
        ColorScale(0)=(RelativeTime=0.5,Color=(B=128,G=128,R=0,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=128,G=128,R=0,A=0))
        FadeOutStartTime=0.5
        FadeOut=true
        MaxParticles=3
        ResetAfterChange=true
        LowScale=0.2
        StartLocationRange=(X=(Min=-3,Max=3),Y=(Min=-3,Max=3),Z=(Min=0,Max=0))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=3)
        StartSizeRange=(X=(Min=200,Max=200),Y=(Min=100,Max=100),Z=(Min=100,Max=100))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.WaterRing'
        LifetimeRange=(Min=3.5,Max=4)
    end object
    Emitters(0)=SpriteEmitter3
    fTimeSoFar=1827.028
}
