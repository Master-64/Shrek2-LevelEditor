//================================================================================
// Bellow_Blow.
//================================================================================

class Bellow_Blow extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter3 class=SpriteEmitter
        Acceleration=(X=0,Y=-600,Z=0)
        Opacity=0.45
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=255,G=255,R=255,A=0))
        ColorScale(1)=(RelativeTime=0.99999,Color=(B=0,G=0,R=0,A=0))
        FadeOutStartTime=0.8
        FadeOut=true
        CoordinateSystem=PTCS_Relative
        MaxParticles=80
        RespawnDeadParticles=false
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.7,Max=2),Y=(Min=0.7,Max=2),Z=(Min=0.7,Max=2))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=10)
        StartSizeRange=(X=(Min=15,Max=15),Y=(Min=15,Max=30),Z=(Min=15,Max=30))
        UniformSize=true
        InitialParticlesPerSecond=5000
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
        ResetOnTrigger=true
        StartVelocityRange=(X=(Min=100,Max=-100),Y=(Min=600,Max=600),Z=(Min=0,Max=0))
        StartVelocityRadialRange=(Min=10,Max=10)
    end object
    Emitters(0)=SpriteEmitter3
    fTimeSoFar=3348.014
}
