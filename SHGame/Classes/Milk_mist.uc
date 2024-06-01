//================================================================================
// Milk_mist.
//================================================================================

class Milk_mist extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter55 class=SpriteEmitter
        Opacity=0.3
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.5,Color=(B=255,G=255,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=200,R=200,A=0))
        FadeOutStartTime=3
        FadeOut=true
        MaxParticles=150
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.5,Max=1),Y=(Min=0.5,Max=1),Z=(Min=0.5,Max=1))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0,RelativeSize=2)
        StartSizeRange=(X=(Min=150,Max=200),Y=(Min=150,Max=200),Z=(Min=150,Max=200))
        UniformSize=true
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        LifetimeRange=(Min=1,Max=1.5)
        StartVelocityRange=(X=(Min=300,Max=-200),Y=(Min=300,Max=-200),Z=(Min=300,Max=-200))
        StartVelocityRadialRange=(Min=200,Max=200)
    end object
    Emitters(0)=SpriteEmitter55
    Begin Object name=SpriteEmitter56 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-100)
        Opacity=0.3
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=255,G=200,R=200,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=255,G=200,R=200,A=0))
        FadeOut=true
        MaxParticles=200
        LowScale=0.1
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0,Max=0.3),Y=(Min=0,Max=0.3),Z=(Min=0,Max=0.5))
        UseSizeScale=true
        UseRegularSizeScale=false
        StartSizeRange=(X=(Min=25,Max=75),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
        UniformSize=true
        InitialParticlesPerSecond=5000
        Texture=Texture'Shrek2_EFX.Gen_Particle.waterdrop'
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=200,Max=-200),Y=(Min=200,Max=-200),Z=(Min=50,Max=100))
        StartVelocityRadialRange=(Min=-300,Max=100)
    end object
    Emitters(1)=SpriteEmitter56
    fTimeSoFar=10701.2
}
