//================================================================================
// Laser_End.
//================================================================================

class Laser_End extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        UseDirectionAs=PTDU_Up
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=128,G=128,R=255,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=0,G=0,R=255,A=0))
        FadeOutStartTime=0.1
        FadeOut=true
        MaxParticles=25
        ResetAfterChange=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0,RelativeSize=0.1)
        SizeScale(1)=(RelativeTime=1,RelativeSize=0.4)
        StartSizeRange=(X=(Min=10,Max=10),Y=(Min=300,Max=200),Z=(Min=150,Max=150))
        InitialParticlesPerSecond=2000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.sparkle'
        LifetimeRange=(Min=0.3,Max=0.3)
        StartVelocityRange=(X=(Min=-300,Max=300),Y=(Min=-300,Max=300),Z=(Min=-300,Max=300))
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=155,G=188,R=255,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=0,G=0,R=0,A=0))
        MaxParticles=12
        RespawnDeadParticles=false
        StartLocationOffset=(X=0,Y=0,Z=5)
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0,RelativeSize=0.1)
        SizeScale(1)=(RelativeTime=1,RelativeSize=1)
        StartSizeRange=(X=(Min=25,Max=25),Y=(Min=25,Max=25),Z=(Min=25,Max=25))
        UniformSize=true
        InitialParticlesPerSecond=1000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.smk1'
        BlendBetweenSubdivisions=true
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=-25,Max=-25),Y=(Min=0,Max=0),Z=(Min=15,Max=35))
    end object
    Emitters(1)=SpriteEmitter1
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        UseDirectionAs=PTDU_Up
        Acceleration=(X=0,Y=0,Z=-950)
        UseCollision=true
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=132,G=204,R=253,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=26,G=32,R=57,A=0))
        FadeOutStartTime=0.5
        FadeOut=true
        ResetAfterChange=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0,RelativeSize=0.1)
        SizeScale(1)=(RelativeTime=1,RelativeSize=0.1)
        StartSizeRange=(X=(Min=40,Max=40),Y=(Min=60,Max=60),Z=(Min=60,Max=60))
        InitialParticlesPerSecond=1000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.sparkle'
        LifetimeRange=(Min=2,Max=2)
        StartVelocityRange=(X=(Min=-200,Max=200),Y=(Min=50,Max=200),Z=(Min=0,Max=200))
    end object
    Emitters(2)=SpriteEmitter2
    Begin Object name=SpriteEmitter3 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        ProjectionNormal=(X=1,Y=0,Z=0)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=0,G=0,R=255,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=0,G=0,R=0,A=0))
        MaxParticles=3
        RespawnDeadParticles=false
        StartSizeRange=(X=(Min=30,Max=30),Y=(Min=30,Max=30),Z=(Min=30,Max=30))
        InitialParticlesPerSecond=1000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.dust'
        LifetimeRange=(Min=1,Max=1)
    end object
    Emitters(3)=SpriteEmitter3
    fTimeSoFar=2854.855
}
