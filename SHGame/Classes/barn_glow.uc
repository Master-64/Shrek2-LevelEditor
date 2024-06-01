//================================================================================
// barn_glow.
//================================================================================

class barn_glow extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        ColorScale(0)=(RelativeTime=0.01,Color=(B=0,G=0,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.8,Color=(B=255,G=255,R=255,A=0))
        ColorScale(2)=(RelativeTime=2,Color=(B=255,G=255,R=255,A=0))
        FadeOut=true
        MaxParticles=50
        UseRotationFrom=PTRS_Actor
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=3)
        StartSizeRange=(X=(Min=50,Max=50),Y=(Min=300,Max=300),Z=(Min=100,Max=100))
        UniformSize=true
        ParticlesPerSecond=25
        InitialParticlesPerSecond=5000
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.light_blu'
        LifetimeRange=(Min=2,Max=2)
        StartVelocityRange=(X=(Min=200,Max=200),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        MaxAbsVelocity=(X=0,Y=0,Z=1000)
        VelocityScale(0)=(RelativeTime=0,RelativeVelocity=(X=0,Y=0,Z=-100))
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=2220.938
    LightType=LT_Pulse
    LightCone=100
}
