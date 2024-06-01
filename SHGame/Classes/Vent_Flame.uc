//================================================================================
// Vent_Flame.
//================================================================================

class Vent_Flame extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter11 class=SpriteEmitter
        Opacity=0.8
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=0,G=0,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.3,Color=(B=0,G=128,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.5,Color=(B=0,G=255,R=255,A=0))
        ColorScale(3)=(RelativeTime=0.94,Color=(B=192,G=192,R=192,A=128))
        FadeOutStartTime=0.3
        FadeOut=true
        MaxParticles=50
        UseRotationFrom=PTRS_Actor
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.7,Max=2),Y=(Min=0.7,Max=2),Z=(Min=0.7,Max=2))
        UseSizeScale=true
        UseRegularSizeScale=false
        StartSizeRange=(X=(Min=15,Max=30),Y=(Min=15,Max=30),Z=(Min=15,Max=30))
        UniformSize=true
        ParticlesPerSecond=10
        InitialParticlesPerSecond=5000
        Texture=Texture'Shrek2_EFX.Gen_Particle.Torch_Fire'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        BlendBetweenSubdivisions=true
        UseSubdivisionScale=true
        LifetimeRange=(Min=1,Max=1)
        ResetOnTrigger=true
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=300,Max=300),Z=(Min=0,Max=0))
        StartVelocityRadialRange=(Min=10,Max=10)
    end object
    Emitters(0)=SpriteEmitter11
    Begin Object name=SpriteEmitter12 class=SpriteEmitter
        Opacity=0.75
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.00125,Color=(B=0,G=0,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.3,Color=(B=174,G=255,R=255,A=0))
        FadeOut=true
        MaxParticles=15
        UseRotationFrom=PTRS_Actor
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.6,Max=0.6),Y=(Min=0.6,Max=0.6),Z=(Min=0.6,Max=0.6))
        UseSizeScale=true
        UseRegularSizeScale=false
        StartSizeRange=(X=(Min=15,Max=35),Y=(Min=15,Max=35),Z=(Min=15,Max=35))
        UniformSize=true
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=40,Max=-40),Y=(Min=90,Max=90),Z=(Min=0,Max=0))
    end object
    Emitters(1)=SpriteEmitter12
    fTimeSoFar=3072.202
}
