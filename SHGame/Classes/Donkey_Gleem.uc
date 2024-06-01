//================================================================================
// Donkey_Gleem.
//================================================================================

class Donkey_Gleem extends Shrk2_Frontend_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        FadeOutStartTime=0.5
        FadeOut=true
        MaxParticles=1
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.5,Max=0.5),Y=(Min=0.5,Max=0.5),Z=(Min=0,Max=0))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0,RelativeSize=0)
        SizeScale(1)=(RelativeTime=0.5,RelativeSize=3)
        SizeScale(2)=(RelativeTime=1.6,RelativeSize=-5)
        StartSizeRange=(X=(Min=35,Max=35),Y=(Min=45,Max=45),Z=(Min=1,Max=1))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.Les_Sparkle_04'
        LifetimeRange=(Min=1.5,Max=1.5)
        GetVelocityDirectionFrom=PTVD_AddRadial
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=3849.071
}
