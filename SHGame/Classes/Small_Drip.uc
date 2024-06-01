//================================================================================
// Small_Drip.
//================================================================================

class Small_Drip extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter57 class=SpriteEmitter
        FadeOut=true
        MaxParticles=4
        StartSizeRange=(X=(Min=3,Max=3),Y=(Min=10,Max=10),Z=(Min=0,Max=0))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.rain'
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=-80,Max=-80))
    end object
    Emitters(0)=SpriteEmitter57
    Begin Object name=SpriteEmitter59 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        Opacity=0.25
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=255,G=255,R=185,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=255,R=179,A=0))
        FadeOut=true
        MaxParticles=6
        StartLocationOffset=(X=0,Y=0,Z=-100)
        StartLocationRange=(X=(Min=3,Max=-3),Y=(Min=3,Max=-3),Z=(Min=0,Max=0))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=5)
        StartSizeRange=(X=(Min=15,Max=15),Y=(Min=15,Max=15),Z=(Min=15,Max=15))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.WaterRing'
    end object
    Emitters(1)=SpriteEmitter59
    fTimeSoFar=41467.18
}
