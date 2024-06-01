//================================================================================
// Shrek_Slide.
//================================================================================

class Shrek_Slide extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter6 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=55)
        Opacity=0.75
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=47,G=64,R=81,A=0))
        ColorScale(1)=(RelativeTime=0.999999,Color=(B=168,G=193,R=219,A=0))
        MaxParticles=45
        SpinParticles=true
        SpinCCWorCW=(X=0.2,Y=0.2,Z=0.2)
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        UseSizeScale=true
        SizeScale(0)=(RelativeTime=0.1,RelativeSize=0.6)
        StartSizeRange=(X=(Min=45,Max=50),Y=(Min=45,Max=50),Z=(Min=45,Max=50))
        UniformSize=true
        InitialParticlesPerSecond=5000
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        LifetimeRange=(Min=0.95,Max=1.3)
        RelativeWarmupTime=0.85
    end object
    Emitters(0)=SpriteEmitter6
    fTimeSoFar=732.7091
}
