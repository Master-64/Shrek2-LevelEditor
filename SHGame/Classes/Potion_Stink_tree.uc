//================================================================================
// Potion_Stink_tree.
//================================================================================

class Potion_Stink_tree extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-5)
        UseCollision=true
        DampingFactorRange=(X=(Min=0.2,Max=0.2),Y=(Min=0.2,Max=0.2),Z=(Min=0.2,Max=0.2))
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=64,G=128,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.2,Color=(B=0,G=255,R=0,A=255))
        ColorScale(2)=(RelativeTime=0.75,Color=(B=0,G=128,R=0,A=255))
        ColorScale(3)=(RelativeTime=0.9999,Color=(B=0,G=255,R=0,A=0))
        FadeOutStartTime=5.34
        FadeInFactor=(W=1,X=5,Y=5,Z=5)
        FadeInEndTime=1
        FadeIn=true
        CoordinateSystem=PTCS_Relative
        MaxParticles=25
        AutoResetTimeRange=(Min=0.5,Max=0.5)
        StartLocationRange=(X=(Min=-6,Max=6),Y=(Min=-6,Max=6),Z=(Min=0,Max=0))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.25,Max=1),Y=(Min=0,Max=1),Z=(Min=0,Max=1))
        StartSpinRange=(X=(Min=0.25,Max=0.25),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        UseSizeScale=true
        SizeScaleRepeats=100
        StartSizeRange=(X=(Min=20,Max=100),Y=(Min=20,Max=100),Z=(Min=20,Max=100))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.flower_Pwr'
        BlendBetweenSubdivisions=true
        LifetimeRange=(Min=2.5,Max=3)
        StartVelocityRange=(X=(Min=-50,Max=50),Y=(Min=-50,Max=50),Z=(Min=0,Max=100))
        StartVelocityRadialRange=(Min=1,Max=5)
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Acceleration=(X=-5,Y=-5,Z=-10)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=0,G=128,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=0,G=255,R=0,A=0))
        FadeOutStartTime=2
        FadeOut=true
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.4,Max=0.4),Y=(Min=0.4,Max=0.4),Z=(Min=0.4,Max=0.4))
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=4,RelativeSize=-5)
        StartSizeRange=(X=(Min=100,Max=200),Y=(Min=100,Max=200),Z=(Min=100,Max=200))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.mist'
        BlendBetweenSubdivisions=true
        StartVelocityRange=(X=(Min=50,Max=-75),Y=(Min=-75,Max=75),Z=(Min=100,Max=100))
        StartVelocityRadialRange=(Min=0,Max=5)
    end object
    Emitters(1)=SpriteEmitter1
    fTimeSoFar=1597.293
}
