//================================================================================
// Torch_Burn.
//================================================================================

class Torch_Burn extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Opacity=0.8
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.2,Color=(B=0,G=255,R=255,A=0))
        FadeOut=true
        CoordinateSystem=PTCS_Relative
        MaxParticles=6
        StartLocationRange=(X=(Min=-4,Max=4),Y=(Min=-2,Max=0),Z=(Min=0,Max=0))
        UseSizeScale=true
        SizeScale(0)=(RelativeTime=1,RelativeSize=0)
        StartSizeRange=(X=(Min=20,Max=20),Y=(Min=20,Max=20),Z=(Min=15,Max=15))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.Torch_Fire2'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        UseRandomSubdivision=true
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=30,Max=30))
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Opacity=0.45
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.1,Color=(B=0,G=128,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=0,G=255,R=255,A=0))
        FadeOut=true
        MaxParticles=6
        StartLocationOffset=(X=0,Y=0,Z=25)
        StartLocationRange=(X=(Min=-6,Max=6),Y=(Min=-6,Max=0),Z=(Min=0,Max=0))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.5,Max=0.5),Y=(Min=0.5,Max=0.5),Z=(Min=0.5,Max=0.5))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=3)
        StartSizeRange=(X=(Min=15,Max=15),Y=(Min=15,Max=15),Z=(Min=15,Max=15))
        UniformSize=true
        ParticlesPerSecond=6
        Texture=Texture'Shrek2_EFX.Gen_Particle.smk1'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=30,Max=30))
    end object
    Emitters(1)=SpriteEmitter1
    Begin Object name=SpriteEmitter3 class=SpriteEmitter
        Opacity=0.4
        CoordinateSystem=PTCS_Relative
        MaxParticles=2
        StartSizeRange=(X=(Min=8,Max=8),Y=(Min=8,Max=8),Z=(Min=8,Max=8))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.fire_spot2'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
    end object
    Emitters(2)=SpriteEmitter3
    fTimeSoFar=3748.091
}
