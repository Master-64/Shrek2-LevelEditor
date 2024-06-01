//================================================================================
// SpMove_Twirl.
//================================================================================

class SpMove_Twirl extends Shrk2_Pickup_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=2,Color=(B=255,G=0,R=0,A=64))
        ColorScale(1)=(RelativeTime=1,Color=(B=255,G=255,R=128,A=64))
        ColorScale(2)=(RelativeTime=0,Color=(B=253,G=0,R=177,A=255))
        MaxParticles=5
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=2,Max=2),Y=(Min=2,Max=2),Z=(Min=2,Max=2))
        StartSizeRange=(X=(Min=22,Max=26),Y=(Min=22,Max=26),Z=(Min=22,Max=26))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.dazzl3'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.125,Max=0.5)
        VelocityLossRange=(X=(Min=-5,Max=5),Y=(Min=-5,Max=5),Z=(Min=-10,Max=5))
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=220.3412
}
