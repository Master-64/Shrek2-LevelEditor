//================================================================================
// Potion_Misty.
//================================================================================

class Potion_Misty extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-5)
        UseCollision=true
        Opacity=0.25
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.1,Color=(B=255,G=128,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=255,R=0,A=0))
        ColorScale(2)=(RelativeTime=1,Color=(B=255,G=255,R=255,A=0))
        ColorScaleRepeats=15
        ColorMultiplierRange=(X=(Min=255,Max=255),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        FadeOutStartTime=2
        FadeOut=true
        FadeInEndTime=0.1
        FadeIn=true
        CoordinateSystem=PTCS_Relative
        MaxParticles=50
        EffectAxis=PTEA_PositiveZ
        SpinParticles=true
        SpinCCWorCW=(X=5,Y=0,Z=0)
        SpinsPerSecondRange=(X=(Min=0.3,Max=0.5),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        StartSpinRange=(X=(Min=-1,Max=1),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1.5,RelativeSize=0)
        StartSizeRange=(X=(Min=3,Max=6),Y=(Min=5,Max=5),Z=(Min=5,Max=5))
        UniformSize=true
        UseSkeletalLocationAs=PTSU_SpawnOffset
        RelativeBoneIndexRange=(Min=0.3,Max=1)
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.Les_Sparkle_04'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=2.5,Max=2.5)
        StartVelocityRange=(X=(Min=-20,Max=20),Y=(Min=-20,Max=20),Z=(Min=0,Max=0))
        StartVelocityRadialRange=(Min=-20,Max=30)
        GetVelocityDirectionFrom=PTVD_AddRadial
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Opacity=0.3
        UseColorScale=true
        FadeOutStartTime=1.8
        FadeOut=true
        FadeInEndTime=0.2
        FadeIn=true
        CoordinateSystem=PTCS_Relative
        MaxParticles=150
        EffectAxis=PTEA_PositiveZ
        SpinParticles=true
        SpinCCWorCW=(X=5,Y=0,Z=0)
        SpinsPerSecondRange=(X=(Min=-0.5,Max=0.5),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        StartSpinRange=(X=(Min=-1,Max=1),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0.1,RelativeSize=2)
        SizeScale(1)=(RelativeTime=1,RelativeSize=5)
        StartSizeRange=(X=(Min=5,Max=6),Y=(Min=5,Max=5),Z=(Min=5,Max=5))
        UniformSize=true
        UseSkeletalLocationAs=PTSU_SpawnOffset
        RelativeBoneIndexRange=(Min=0.3,Max=1)
        ParticlesPerSecond=20
        InitialParticlesPerSecond=5000
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.FF_SmallPuff'
        SecondsBeforeInactive=0
        StartVelocityRange=(X=(Min=-20,Max=20),Y=(Min=-20,Max=20),Z=(Min=-20,Max=0))
    end object
    Emitters(1)=SpriteEmitter1
    fTimeSoFar=337.5214
}
