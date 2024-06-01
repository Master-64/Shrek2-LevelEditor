//================================================================================
// Potion7a.
//================================================================================

class Potion7a extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=255,G=0,R=255,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=255,G=196,R=255,A=0))
        FadeOutStartTime=1
        FadeOut=true
        FadeInEndTime=0.5
        FadeIn=true
        MaxParticles=15
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=-50,Max=50),Y=(Min=-50,Max=50),Z=(Min=-50,Max=50))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.2,Max=0.2),Y=(Min=0.05,Max=0.05),Z=(Min=0.05,Max=0.05))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0,RelativeSize=0.25)
        SizeScale(1)=(RelativeTime=1,RelativeSize=3)
        UniformSize=true
        InitialParticlesPerSecond=100
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.75,Max=0.75)
        StartVelocityRange=(X=(Min=-20,Max=20),Y=(Min=-20,Max=20),Z=(Min=-20,Max=20))
    end object
    Emitters(0)=SpriteEmitter1
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=128,G=0,R=80,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=228,G=172,R=22,A=0))
        FadeOutStartTime=-0.05
        FadeOut=true
        MaxParticles=15
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=-25,Max=25),Y=(Min=-25,Max=25),Z=(Min=-25,Max=25))
        SpinParticles=true
        SpinCCWorCW=(X=0.25,Y=0.25,Z=0.25)
        SpinsPerSecondRange=(X=(Min=0.12,Max=0.12),Y=(Min=0.12,Max=0.12),Z=(Min=0,Max=0))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0,RelativeSize=0.1)
        SizeScale(1)=(RelativeTime=1,RelativeSize=1.5)
        UniformSize=true
        InitialParticlesPerSecond=100
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.75,Max=0.75)
        StartVelocityRange=(X=(Min=-10,Max=10),Y=(Min=-10,Max=10),Z=(Min=-10,Max=10))
    end object
    Emitters(1)=SpriteEmitter2
    fTimeSoFar=1124.297
}
