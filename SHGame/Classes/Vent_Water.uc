//================================================================================
// Vent_Water.
//================================================================================

class Vent_Water extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Acceleration=(X=0,Y=-50,Z=-150)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=255,G=128,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.9999,Color=(B=255,G=255,R=128,A=0))
        FadeOutStartTime=0.8
        CoordinateSystem=PTCS_Relative
        MaxParticles=80
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.7,Max=2),Y=(Min=0.7,Max=2),Z=(Min=0.7,Max=2))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=4)
        StartSizeRange=(X=(Min=15,Max=15),Y=(Min=15,Max=15),Z=(Min=15,Max=15))
        UniformSize=true
        InitialParticlesPerSecond=5000
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.light_blu'
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=600,Max=600),Z=(Min=40,Max=60))
        StartVelocityRadialRange=(Min=10,Max=10)
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-50)
        Opacity=0.8
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=255,G=255,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.9,Color=(B=255,G=255,R=0,A=0))
        FadeOut=true
        MaxParticles=30
        LowScale=0.1
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.5,Max=0.5),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=10,Max=10),Y=(Min=10,Max=10),Z=(Min=10,Max=10))
        UniformSize=true
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.waterdrop'
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=50,Max=-50),Y=(Min=70,Max=90),Z=(Min=50,Max=-50))
    end object
    Emitters(1)=SpriteEmitter1
    fTimeSoFar=5280.369
}
