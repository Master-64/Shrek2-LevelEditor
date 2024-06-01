//================================================================================
// Cherry_Trail.
//================================================================================

class Cherry_Trail extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter6 class=SpriteEmitter
        Opacity=0.2
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=0,G=0,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=24,G=19,R=210,A=0))
        ColorScale(2)=(RelativeTime=0.999,Color=(B=0,G=0,R=151,A=0))
        FadeOut=true
        MaxParticles=35
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        SizeScale(0)=(RelativeTime=1,RelativeSize=2)
        StartSizeRange=(X=(Min=30,Max=30),Y=(Min=30,Max=30),Z=(Min=30,Max=30))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.fire_spot2'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.8,Max=1)
    end object
    Emitters(0)=SpriteEmitter6
    fTimeSoFar=258.0635
}
