//================================================================================
// waterstreak_ribbon.
//================================================================================

class waterstreak_ribbon extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=RibbonEmitter0 class=RibbonEmitter
        SampleRate=0.02
        DecayRate=1
        NumPoints=50
        RibbonWidth=50
        GetPointAxisFrom=0
        AxisNormal=(X=0,Y=1,Z=0)
        StartBoneOffset=(X=10,Y=0,Z=0)
        BoneNameStart=body_pelvis_joint
        BoneNameEnd=body_l_thigh_joint
        RibbonPoints(0)=(Location=(X=0,Y=0,Z=0),AxisNormal=(X=-0.305798,Y=0.948820,Z=0.078918),Width=50)
        bDecayPointsWhenStopped=true
        bUseBones=true
        bUseBoneDistance=true
        Opacity=0.5
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=128,G=128,R=128,A=0))
        ColorScale(1)=(RelativeTime=0,Color=(B=255,G=255,R=255,A=0))
        ColorScale(2)=(RelativeTime=0.25,Color=(B=0,G=0,R=0,A=0))
        ColorScale(3)=(RelativeTime=1,Color=(B=0,G=0,R=0,A=0))
        FadeOutFactor=(W=2,X=2,Y=2,Z=2)
        FadeOutStartTime=1
        FadeOut=true
        CoordinateSystem=PTCS_Relative
        RespawnDeadParticles=false
        StartLocationPolarRange=(X=(Min=100,Max=100),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        RotationOffset=(Pitch=0,Yaw=16384,Roll=0)
        UseRegularSizeScale=true
        UseSkeletalLocationAs=PTSU_SpawnOffset
        InitialParticlesPerSecond=100
        Texture=Texture'ShCharacters.water_streak'
        LifetimeRange=(Min=5,Max=5)
    end object
    Emitters(0)=RibbonEmitter0
}
