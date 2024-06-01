//================================================================================
// Donkey_Spinblur.
//================================================================================

class Donkey_Spinblur extends Shrk2_Player_FX;

defaultproperties
{
    Begin Object name=RibbonEmitter0 class=RibbonEmitter
        SampleRate=0.02
        DecayRate=0.2
        NumPoints=100
        GetPointAxisFrom=3
        RibbonTextureUScale=0.9
        RibbonTextureVScale=0.9
        BoneNameStart=righthand
        BoneNameEnd=righthand
        RibbonPoints(0)=(Location=(X=-743.175537,Y=1191.756470,Z=-186.512863),AxisNormal=(X=0,Y=0,Z=1),Width=20)
        RibbonPoints(1)=(Location=(X=-743.175537,Y=1191.756470,Z=-186.512863),AxisNormal=(X=0,Y=0,Z=1),Width=20)
        bDecayPoints=false
        bDecayPointsWhenStopped=true
        bUseBones=true
        bUseBoneDistance=true
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=128,G=128,R=128,A=0))
        ColorScale(1)=(RelativeTime=0,Color=(B=255,G=255,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.25,Color=(B=128,G=128,R=128,A=0))
        ColorScale(3)=(RelativeTime=1,Color=(B=0,G=0,R=0,A=0))
        FadeOutFactor=(W=2,X=2,Y=2,Z=2)
        RespawnDeadParticles=false
        UseRotationFrom=PTRS_Offset
        RotationOffset=(Pitch=0,Yaw=16932,Roll=0)
        InitialParticlesPerSecond=100
        DrawStyle=PTDS_Brighten
        Texture=Texture'ShCharacters.donkeyspin_blur'
        LifetimeRange=(Min=2,Max=2)
    end object
    Emitters(0)=RibbonEmitter0
}
