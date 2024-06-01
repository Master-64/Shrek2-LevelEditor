//================================================================================
// Tree_Rise.
//================================================================================

class Tree_Rise extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter19 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        Opacity=0.75
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0.000125,Color=(B=64,G=255,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=128,G=128,R=0,A=0))
        ColorScale(2)=(RelativeTime=0.99999,Color=(B=193,G=255,R=132,A=0))
        FadeOutStartTime=0.85
        FadeOut=true
        MaxParticles=5
        RespawnDeadParticles=false
        StartLocationOffset=(X=0,Y=0,Z=20)
        StartLocationShape=PTLS_Sphere
        SphereRadiusRange=(Min=1,Max=5)
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=5)
        StartSizeRange=(X=(Min=60,Max=60),Y=(Min=60,Max=60),Z=(Min=60,Max=60))
        UniformSize=true
        InitialParticlesPerSecond=40
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_ball1'
        LifetimeRange=(Min=0.5,Max=1)
    end object
    Emitters(0)=SpriteEmitter19
    fTimeSoFar=360.2356
}
