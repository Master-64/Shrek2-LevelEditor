//================================================================================
// Handsome_Strength.
//================================================================================

class Handsome_Strength extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=BeamEmitter0 class=BeamEmitter
        BeamDistanceRange=(Min=0,Max=5)
        LowFrequencyNoiseRange=(X=(Min=-1,Max=1),Y=(Min=-1,Max=1),Z=(Min=0,Max=0))
        HighFrequencyNoiseRange=(X=(Min=-8,Max=8),Y=(Min=-8,Max=8),Z=(Min=0,Max=0))
        HighFrequencyPoints=3
        UseBranching=true
        BranchProbability=(Min=1,Max=1)
        BranchSpawnAmountRange=(Min=1,Max=1)
        LinkupLifetime=true
        Acceleration=(X=20,Y=20,Z=100)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=255,G=128,R=128,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=0,G=0,R=0,A=0))
        ColorScale(2)=(RelativeTime=1,Color=(B=255,G=128,R=128,A=0))
        FadeOut=true
        MaxParticles=50
        LowScale=0.5
        StartLocationOffset=(X=0,Y=0,Z=40)
        StartLocationRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=-20,Max=20))
        UseRotationFrom=PTRS_Normal
        UseSizeScale=true
        StartSizeRange=(X=(Min=2,Max=2),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        InitialParticlesPerSecond=500
        Texture=Texture'Shrek2_EFX.Gen_Particle.Lightning'
        LifetimeRange=(Min=2,Max=4)
        StartVelocityRange=(X=(Min=-2,Max=2),Y=(Min=-2,Max=2),Z=(Min=-1,Max=1))
    end object
    Emitters(0)=BeamEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        UseDirectionAs=PTDU_Scale
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=255,G=128,R=128,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=64,G=0,R=0,A=0))
        ColorScale(2)=(RelativeTime=1,Color=(B=255,G=128,R=128,A=0))
        ColorScaleRepeats=2
        MaxParticles=1
        StartLocationOffset=(X=-8,Y=-5,Z=45)
        StartSizeRange=(X=(Min=25,Max=25),Y=(Min=50,Max=50),Z=(Min=0,Max=0))
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.light_blu'
    end object
    Emitters(1)=SpriteEmitter1
    fTimeSoFar=4498.893
}
