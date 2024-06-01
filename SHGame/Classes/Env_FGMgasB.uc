//================================================================================
// Env_FGMgasB.
//================================================================================

class Env_FGMgasB extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=5)
        Opacity=0.7
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=255,G=0,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.9,Color=(B=255,G=128,R=255,A=0))
        FadeOut=true
        MaxParticles=20
        StartLocationOffset=(X=0,Y=0,Z=-10)
        UseRotationFrom=PTRS_Normal
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        UseSizeScale=true
        SizeScale(0)=(RelativeTime=0.6,RelativeSize=1)
        StartSizeRange=(X=(Min=15,Max=18),Y=(Min=15,Max=18),Z=(Min=15,Max=18))
        UniformSize=true
        InitialParticlesPerSecond=5000
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.water180'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        WarmupTicksPerSecond=0.6
        RelativeWarmupTime=1
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=50)
        Opacity=0.7
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=255,G=128,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.9,Color=(B=255,G=0,R=255,A=0))
        FadeOutStartTime=0.7
        FadeOut=true
        MaxParticles=40
        StartLocationOffset=(X=0,Y=0,Z=-25)
        StartLocationRange=(X=(Min=5,Max=-5),Y=(Min=5,Max=-5),Z=(Min=0,Max=0))
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=3)
        StartSizeRange=(X=(Min=5,Max=10),Y=(Min=5,Max=10),Z=(Min=5,Max=10))
        UniformSize=true
        InitialParticlesPerSecond=5000
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=30,Max=-30),Y=(Min=30,Max=-30),Z=(Min=-10,Max=-10))
        StartVelocityRadialRange=(Min=0,Max=5)
    end object
    Emitters(1)=SpriteEmitter1
    fTimeSoFar=3258.167
}
