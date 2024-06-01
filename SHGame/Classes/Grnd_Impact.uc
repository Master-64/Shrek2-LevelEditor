//================================================================================
// Grnd_Impact.
//================================================================================

class Grnd_Impact extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-100)
        Opacity=0.1
        FadeOutStartTime=0.5
        FadeOut=true
        FadeInEndTime=0.2
        FadeIn=true
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=-25,Max=25),Y=(Min=-25,Max=25),Z=(Min=-10,Max=-10))
        SpinParticles=true
        SpinCCWorCW=(X=0.25,Y=0.25,Z=0.25)
        SpinsPerSecondRange=(X=(Min=0.12,Max=0.12),Y=(Min=0.12,Max=0.12),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=50,Max=50),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
        UniformSize=true
        InitialParticlesPerSecond=100
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=100,Max=-100),Y=(Min=100,Max=-100),Z=(Min=0,Max=0))
        StartVelocityRadialRange=(Min=10,Max=10)
    end object
    Emitters(0)=SpriteEmitter2
    fTimeSoFar=851.2073
}
