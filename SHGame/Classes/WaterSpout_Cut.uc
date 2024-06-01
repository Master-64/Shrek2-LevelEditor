//================================================================================
// WaterSpout_Cut.
//================================================================================

class WaterSpout_Cut extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=255,G=0,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=128,R=0,A=0))
        ColorScale(2)=(RelativeTime=0.99,Color=(B=255,G=255,R=128,A=0))
        MaxParticles=8
        StartSizeRange=(X=(Min=-120,Max=-120),Y=(Min=-120,Max=-120),Z=(Min=-120,Max=-120))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.watrfall'
        LifetimeRange=(Min=0.5,Max=1)
        StartVelocityRange=(X=(Min=-50,Max=50),Y=(Min=-50,Max=50),Z=(Min=50,Max=50))
        WarmupTicksPerSecond=0.8
        RelativeWarmupTime=1
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-170)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=255,G=128,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=255,R=128,A=0))
        ColorScale(2)=(RelativeTime=0.99,Color=(B=255,G=255,R=255,A=0))
        FadeOutStartTime=0.85
        FadeOut=true
        MaxParticles=25
        StartLocationOffset=(X=0,Y=0,Z=50)
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.2,Max=0.2),Y=(Min=0.2,Max=0.2),Z=(Min=0.2,Max=0.2))
        StartSizeRange=(X=(Min=50,Max=50),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.dazzl3'
        LifetimeRange=(Min=3,Max=4)
        StartVelocityRange=(X=(Min=-80,Max=80),Y=(Min=-80,Max=80),Z=(Min=140,Max=200))
        WarmupTicksPerSecond=0.8
        RelativeWarmupTime=1
    end object
    Emitters(1)=SpriteEmitter1
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-280)
        Opacity=0.2
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=255,G=128,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=177,R=100,A=0))
        ColorScale(2)=(RelativeTime=0.99,Color=(B=255,G=128,R=0,A=0))
        StartLocationOffset=(X=15,Y=15,Z=0)
        StartSizeRange=(X=(Min=200,Max=200),Y=(Min=200,Max=200),Z=(Min=200,Max=200))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.water'
        LifetimeRange=(Min=2,Max=4)
        StartVelocityRange=(X=(Min=-20,Max=20),Y=(Min=-20,Max=20),Z=(Min=300,Max=400))
        WarmupTicksPerSecond=1
        RelativeWarmupTime=2
    end object
    Emitters(2)=SpriteEmitter2
    fTimeSoFar=5131.698
}
