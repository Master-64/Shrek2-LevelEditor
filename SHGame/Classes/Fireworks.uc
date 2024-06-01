//================================================================================
// Fireworks.
//================================================================================

class Fireworks extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter156 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-100)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.2,Color=(B=0,G=255,R=255,A=0))
        ColorScale(1)=(RelativeTime=0,Color=(B=255,G=255,R=255,A=0))
        FadeOutFactor=(W=3,X=2,Y=2,Z=2)
        FadeOutStartTime=0.7
        FadeOut=true
        MaxParticles=150
        LowScale=0.2
        RespawnDeadParticles=false
        StartLocationShape=PTLS_Sphere
        SphereRadiusRange=(Min=-25,Max=25)
        UseSizeScale=true
        SizeScale(0)=(RelativeTime=1,RelativeSize=-1)
        StartSizeRange=(X=(Min=10,Max=10),Y=(Min=100,Max=100),Z=(Min=0,Max=0))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.light_red'
        StartVelocityRange=(X=(Min=-100,Max=100),Y=(Min=-100,Max=100),Z=(Min=-50,Max=140))
        StartVelocityRadialRange=(Min=-20,Max=20)
        GetVelocityDirectionFrom=PTVD_AddRadial
        UseVelocityScale=true
        VelocityScale(0)=(RelativeTime=1.5,RelativeVelocity=(X=0,Y=0,Z=0))
    end object
    Emitters(0)=SpriteEmitter156
    Begin Object name=SpriteEmitter157 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-50)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.5,Color=(B=0,G=0,R=255,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=255,G=255,R=255,A=0))
        ColorScaleRepeats=20
        FadeOut=true
        MaxParticles=150
        LowScale=0.2
        RespawnDeadParticles=false
        StartLocationRange=(X=(Min=-50,Max=50),Y=(Min=-100,Max=100),Z=(Min=-100,Max=50))
        SphereRadiusRange=(Min=-150,Max=50)
        StartSizeRange=(X=(Min=2,Max=2),Y=(Min=2,Max=2),Z=(Min=0,Max=0))
        UniformSize=true
        InitialParticlesPerSecond=5000
        Texture=Texture'Shrek2_EFX.Gen_Particle.Les_Sparkle_04'
        LifetimeRange=(Min=1,Max=1)
        InitialDelayRange=(Min=2,Max=2)
        StartVelocityRange=(X=(Min=10,Max=-10),Y=(Min=10,Max=-10),Z=(Min=0,Max=0))
    end object
    Emitters(1)=SpriteEmitter157
    Begin Object name=SpriteEmitter159 class=SpriteEmitter
        Opacity=0.7
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=255,G=255,R=255,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=0,G=0,R=0,A=0))
        MaxParticles=500
        LowScale=0.2
        AutoResetTimeRange=(Min=1,Max=2)
        StartLocationOffset=(X=0,Y=1,Z=0)
        AddLocationFromOtherEmitter=0
        UseSizeScale=true
        SizeScale(0)=(RelativeTime=1,RelativeSize=-1)
        StartSizeRange=(X=(Min=5,Max=5),Y=(Min=5,Max=5),Z=(Min=1,Max=1))
        UniformSize=true
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.light_red'
        LifetimeRange=(Min=0.1,Max=0.5)
        ResetOnTrigger=true
    end object
    Emitters(2)=SpriteEmitter159
    Begin Object name=SpriteEmitter161 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-100)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.2,Color=(B=0,G=255,R=255,A=0))
        ColorScale(1)=(RelativeTime=0,Color=(B=255,G=255,R=255,A=0))
        FadeOut=true
        MaxParticles=25
        LowScale=0.2
        RespawnDeadParticles=false
        UseSizeScale=true
        StartSizeRange=(X=(Min=20,Max=20),Y=(Min=10,Max=10),Z=(Min=10,Max=10))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.light_red'
        LifetimeRange=(Min=1.5,Max=1.5)
        StartVelocityRange=(X=(Min=-100,Max=100),Y=(Min=-100,Max=100),Z=(Min=-50,Max=100))
        StartVelocityRadialRange=(Min=-100,Max=100)
        GetVelocityDirectionFrom=PTVD_AddRadial
        UseVelocityScale=true
        VelocityScale(0)=(RelativeTime=1,RelativeVelocity=(X=0,Y=0,Z=0))
    end object
    Emitters(3)=SpriteEmitter161
    fTimeSoFar=8684.654
}
