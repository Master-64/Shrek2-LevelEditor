//================================================================================
// swamp_mist.
//================================================================================

class swamp_mist extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter5 class=SpriteEmitter
        Acceleration=(X=300,Y=-500,Z=25)
        Opacity=0.2
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.5,Color=(B=128,G=128,R=0,A=0))
        FadeOutStartTime=3.5
        FadeOut=true
        MaxParticles=100
        LowScale=0.2
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.5,Max=1),Y=(Min=0.5,Max=1),Z=(Min=0.5,Max=1))
        StartSizeRange=(X=(Min=100,Max=100),Y=(Min=50,Max=50),Z=(Min=600,Max=600))
        UniformSize=true
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        LifetimeRange=(Min=3,Max=4)
        StartVelocityRange=(X=(Min=500,Max=-500),Y=(Min=150,Max=200),Z=(Min=50,Max=50))
        StartVelocityRadialRange=(Min=200,Max=200)
    end object
    Emitters(0)=SpriteEmitter5
    fTimeSoFar=2054.22
}
