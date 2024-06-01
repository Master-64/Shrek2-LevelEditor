//================================================================================
// Hero_Ribbon.
//================================================================================

class Hero_Ribbon extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=RibbonEmitter0 class=RibbonEmitter
        SampleRate=0.02
        DecayRate=2
        NumPoints=25
        RibbonWidth=6
        GetPointAxisFrom=3
        RibbonTextureUScale=0.9
        RibbonTextureVScale=0.9
        BoneNameStart=righthand
        BoneNameEnd=righthand
        bDecayPointsWhenStopped=true
        bUseBones=true
        bUseBoneDistance=true
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=128,G=128,R=128,A=0))
        ColorScale(1)=(RelativeTime=0,Color=(B=255,G=255,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.25,Color=(B=0,G=0,R=0,A=0))
        ColorScale(3)=(RelativeTime=1,Color=(B=0,G=0,R=0,A=0))
        FadeOutFactor=(W=2,X=2,Y=2,Z=2)
        RespawnDeadParticles=false
        InitialParticlesPerSecond=100
        Texture=Texture'ShCharacters.PiB_blur'
        LifetimeRange=(Min=1.5,Max=1.5)
    end object
    Emitters(0)=RibbonEmitter0
}
