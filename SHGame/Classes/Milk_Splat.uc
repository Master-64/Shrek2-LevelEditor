//================================================================================
// Milk_Splat.
//================================================================================

class Milk_Splat extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Opacity=0.8
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=255,G=255,R=234,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=221,G=221,R=221,A=0))
        FadeOutStartTime=0.5
        FadeOut=true
        FadeInEndTime=0.5
        FadeIn=true
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=-50,Max=50),Y=(Min=-50,Max=50),Z=(Min=-50,Max=50))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.2,Max=0.2),Y=(Min=0.05,Max=0.05),Z=(Min=0.05,Max=0.05))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0,RelativeSize=0.25)
        SizeScale(1)=(RelativeTime=1,RelativeSize=3)
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=-20,Max=20),Y=(Min=-20,Max=20),Z=(Min=-20,Max=20))
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=255,G=255,R=206,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=192,G=192,R=192,A=0))
        FadeOutStartTime=-0.05
        FadeOut=true
        MaxParticles=30
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=-25,Max=25),Y=(Min=-25,Max=25),Z=(Min=-25,Max=25))
        StartMassRange=(Min=5,Max=5)
        SpinParticles=true
        SpinCCWorCW=(X=0.25,Y=0.25,Z=0.25)
        SpinsPerSecondRange=(X=(Min=0.3,Max=0.3),Y=(Min=0.3,Max=0.3),Z=(Min=0,Max=0))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0,RelativeSize=0.1)
        SizeScale(1)=(RelativeTime=1,RelativeSize=1.5)
        StartSizeRange=(X=(Min=40,Max=40),Y=(Min=40,Max=40),Z=(Min=40,Max=40))
        UniformSize=true
        InitialParticlesPerSecond=100
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.waterdrop'
        BlendBetweenSubdivisions=true
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.75,Max=0.75)
        StartVelocityRange=(X=(Min=-150,Max=150),Y=(Min=-150,Max=150),Z=(Min=-150,Max=150))
    end object
    Emitters(1)=SpriteEmitter1
    fTimeSoFar=1228.57
}
