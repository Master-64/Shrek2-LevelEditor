//================================================================================
// Vent_Steam.
//================================================================================

class Vent_Steam extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Acceleration=(X=0,Y=-450,Z=40)
        Opacity=0.7
        FadeOut=true
        CoordinateSystem=PTCS_Relative
        MaxParticles=125
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.3,Max=0.5),Y=(Min=0.3,Max=0.5),Z=(Min=0.5,Max=0.5))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0.35,RelativeSize=10)
        StartSizeRange=(X=(Min=20,Max=20),Y=(Min=20,Max=20),Z=(Min=10,Max=10))
        UniformSize=true
        InitialParticlesPerSecond=5000
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        LifetimeRange=(Min=3,Max=3)
        ResetOnTrigger=true
        StartVelocityRange=(X=(Min=50,Max=-50),Y=(Min=700,Max=700),Z=(Min=0,Max=50))
        StartVelocityRadialRange=(Min=10,Max=10)
    end object
    Emitters(0)=SpriteEmitter1
    fTimeSoFar=5278.994
}
