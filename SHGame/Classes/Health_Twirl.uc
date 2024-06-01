//================================================================================
// Health_Twirl.
//================================================================================

class Health_Twirl extends Shrk2_Pickup_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Opacity=0.4
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=0,G=255,R=255,A=255))
        ColorScale(1)=(RelativeTime=0,Color=(B=64,G=128,R=255,A=255))
        ColorScale(2)=(RelativeTime=0,Color=(B=0,G=255,R=255,A=255))
        MaxParticles=3
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=-2,Max=5),Y=(Min=-2,Max=5),Z=(Min=-2,Max=5))
        StartSizeRange=(X=(Min=10,Max=20),Y=(Min=10,Max=20),Z=(Min=10,Max=20))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.rings'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.125,Max=0.5)
        VelocityLossRange=(X=(Min=-5,Max=5),Y=(Min=-5,Max=5),Z=(Min=-10,Max=5))
    end object
    Emitters(0)=SpriteEmitter1
    fTimeSoFar=203.598
}
