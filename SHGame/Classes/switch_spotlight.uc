//================================================================================
// switch_spotlight.
//================================================================================

class switch_spotlight extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        FadeOut=true
        MaxParticles=20
        UseRotationFrom=PTRS_Actor
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=3)
        StartSizeRange=(X=(Min=50,Max=50),Y=(Min=100,Max=100),Z=(Min=100,Max=100))
        UniformSize=true
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.LightCone'
        LifetimeRange=(Min=2,Max=2)
        StartVelocityRange=(X=(Min=100,Max=100),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=759.8276
    LightType=LT_Steady
    LightEffect=LE_Spotlight
    LightBrightness=150
    LightRadius=128
    LightSaturation=255
    LightCone=64
}
