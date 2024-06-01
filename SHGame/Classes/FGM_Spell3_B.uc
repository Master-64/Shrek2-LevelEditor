//================================================================================
// FGM_Spell3_B.
//================================================================================

class FGM_Spell3_B extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=BeamEmitter0 class=BeamEmitter
        BeamEndPoints(0)=(ActorTag="None",offset=(X=(Min=-5000,Max=-2000),Y=(Min=0,Max=0),Z=(Min=-500,Max=-500)),Weight=1)
        LowFrequencyNoiseRange=(X=(Min=250,Max=-250),Y=(Min=250,Max=-250),Z=(Min=250,Max=-250))
        LowFrequencyPoints=2
        HighFrequencyNoiseRange=(X=(Min=20,Max=-20),Y=(Min=20,Max=-20),Z=(Min=20,Max=-20))
        HighFrequencyPoints=12
        LFScaleFactors(0)=(FrequencyScale=(X=0,Y=0,Z=0),RelativeLength=0.2)
        LFScaleFactors(1)=(FrequencyScale=(X=20,Y=20,Z=20),RelativeLength=1)
        HFScaleFactors(0)=(FrequencyScale=(X=0,Y=0,Z=0),RelativeLength=0.2)
        HFScaleFactors(1)=(FrequencyScale=(X=1,Y=1,Z=1),RelativeLength=1)
        UseLowFrequencyScale=true
        UseBranching=true
        BranchProbability=(Min=0.5,Max=0.2)
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.1,Color=(B=251,G=4,R=226,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=128,G=0,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.999,Color=(B=0,G=0,R=255,A=0))
        LowScale=0.3
        RespawnDeadParticles=false
        StartSizeRange=(X=(Min=5,Max=5),Y=(Min=5,Max=5),Z=(Min=5,Max=5))
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        Texture=Texture'Shrek2_EFX.Gen_Particle.elecswirl'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.25,Max=1)
        StartVelocityRange=(X=(Min=-1000,Max=1000),Y=(Min=-1000,Max=1000),Z=(Min=0,Max=0))
        WarmupTicksPerSecond=0.8
        RelativeWarmupTime=1
    end object
    Emitters(0)=BeamEmitter0
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=255,G=255,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=0,R=0,A=0))
        ColorScale(2)=(RelativeTime=0.999,Color=(B=255,G=255,R=0,A=0))
        FadeOut=true
        CoordinateSystem=PTCS_Relative
        MaxParticles=5
        RespawnDeadParticles=false
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        StartSizeRange=(X=(Min=40,Max=60),Y=(Min=40,Max=60),Z=(Min=40,Max=60))
        UniformSize=true
        InitialParticlesPerSecond=5000
        Texture=Texture'Shrek2_EFX.Gen_Particle.fire_spot2'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=0.25,Max=1)
        WarmupTicksPerSecond=0.5
        RelativeWarmupTime=1
    end object
    Emitters(1)=SpriteEmitter2
    fTimeSoFar=1867.113
}
