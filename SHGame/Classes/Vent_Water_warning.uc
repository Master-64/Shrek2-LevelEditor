//================================================================================
// Vent_Water_warning.
//================================================================================

class Vent_Water_warning extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter3 class=SpriteEmitter
        Acceleration=(X=0,Y=-50,Z=-200)
        Opacity=0.8
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=255,G=128,R=128,A=0))
        ColorScale(1)=(RelativeTime=0.9,Color=(B=255,G=255,R=128,A=0))
        FadeOut=true
        MaxParticles=50
        LowScale=0.1
        UseRotationFrom=PTRS_Actor
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.5,Max=0.5),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=10,Max=10),Y=(Min=10,Max=10),Z=(Min=10,Max=10))
        UniformSize=true
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.waterdrop'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=50,Max=-50),Y=(Min=100,Max=120),Z=(Min=0,Max=-50))
    end object
    Emitters(0)=SpriteEmitter3
    fTimeSoFar=5347.939
}
