//================================================================================
// splash.
//================================================================================

class splash extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-400)
        Opacity=0.5
        FadeOutFactor=(W=1,X=2,Y=2,Z=2)
        FadeOutStartTime=0.1
        FadeOut=true
        MaxParticles=30
        RespawnDeadParticles=false
        StartLocationOffset=(X=0,Y=0,Z=-25)
        StartLocationRange=(X=(Min=20,Max=-50),Y=(Min=20,Max=-20),Z=(Min=0,Max=0))
        StartSizeRange=(X=(Min=75,Max=75),Y=(Min=50,Max=50),Z=(Min=10,Max=10))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.water'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=2,Max=2)
        StartVelocityRange=(X=(Min=50,Max=-50),Y=(Min=50,Max=-50),Z=(Min=100,Max=100))
        StartVelocityRadialRange=(Min=100,Max=100)
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-150)
        Opacity=0.5
        FadeOutStartTime=0.5
        FadeOut=true
        MaxParticles=150
        LowScale=0.1
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=20,Max=-20),Y=(Min=20,Max=-20),Z=(Min=0,Max=-20))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0,Max=0.5),Y=(Min=0,Max=0.5),Z=(Min=0,Max=0.5))
        StartSizeRange=(X=(Min=8,Max=8),Y=(Min=8,Max=8),Z=(Min=8,Max=8))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.waterdrop'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=40,Max=-40),Y=(Min=40,Max=-40),Z=(Min=75,Max=100))
        StartVelocityRadialRange=(Min=0,Max=5)
    end object
    Emitters(1)=SpriteEmitter1
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        Opacity=0.3
        FadeOutStartTime=0.5
        FadeOut=true
        MaxParticles=1
        LowScale=0.1
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(1)=(RelativeTime=1,RelativeSize=3)
        StartSizeRange=(X=(Min=30,Max=30),Y=(Min=30,Max=30),Z=(Min=30,Max=30))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.WaterRing'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=2,Max=3)
    end object
    Emitters(2)=SpriteEmitter2
    fTimeSoFar=9892.572
}
