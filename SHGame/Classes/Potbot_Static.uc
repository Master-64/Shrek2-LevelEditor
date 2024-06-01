//================================================================================
// Potbot_Static.
//================================================================================

class Potbot_Static extends Shrk2_Pickup_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        Opacity=0.9
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000015,Color=(B=251,G=138,R=36,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=132,R=132,A=0))
        ColorScale(2)=(RelativeTime=0.9,Color=(B=255,G=0,R=0,A=0))
        FadeOut=true
        MaxParticles=5
        StartLocationOffset=(X=0,Y=0,Z=10)
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        StartSizeRange=(X=(Min=25,Max=50),Y=(Min=25,Max=50),Z=(Min=25,Max=50))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.rings'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=-20,Max=20),Z=(Min=-20,Max=20))
    end object
    Emitters(0)=SpriteEmitter2
    Begin Object name=SpriteEmitter4 class=SpriteEmitter
        Opacity=0.8
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000001,Color=(B=128,G=0,R=128,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=0,G=255,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.99995,Color=(B=128,G=0,R=255,A=0))
        ColorScaleRepeats=0.5
        StartLocationRange=(X=(Min=-20,Max=20),Y=(Min=-20,Max=20),Z=(Min=0,Max=0))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.8,Max=0.8),Y=(Min=0.8,Max=0.8),Z=(Min=0.8,Max=0.8))
        StartSizeRange=(X=(Min=5,Max=6),Y=(Min=5,Max=6),Z=(Min=5,Max=6))
        UniformSize=true
        ParticlesPerSecond=2
        Texture=Texture'Shrek2_EFX.Gen_Particle.Coin'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.8,Max=1.5)
        StartVelocityRange=(X=(Min=-30,Max=30),Y=(Min=-30,Max=30),Z=(Min=0,Max=0))
    end object
    Emitters(1)=SpriteEmitter4
    fTimeSoFar=2788.974
}
