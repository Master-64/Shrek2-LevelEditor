//================================================================================
// petal_chomp.
//================================================================================

class petal_chomp extends Shrk2_Frontend_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        FadeOut=true
        MaxParticles=5
        SpinsPerSecondRange=(X=(Min=0.2,Max=0.2),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        UseSizeScale=true
        StartSizeRange=(X=(Min=15,Max=15),Y=(Min=15,Max=15),Z=(Min=100,Max=100))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_AlphaBlend
        Texture=Texture'Shrek2_EFX.storybook_particles.petals'
        LifetimeRange=(Min=2,Max=2)
        StartVelocityRange=(X=(Min=-50,Max=50),Y=(Min=-50,Max=50),Z=(Min=2,Max=2))
        UseVelocityScale=true
        VelocityScale(0)=(RelativeTime=1,RelativeVelocity=(X=0,Y=0,Z=0))
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        MaxParticles=4
        StartLocationRange=(X=(Min=-15,Max=15),Y=(Min=-15,Max=15),Z=(Min=0,Max=0))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.5,Max=0.5),Y=(Min=0.5,Max=0.5),Z=(Min=0,Max=0))
        UseSizeScale=true
        StartSizeRange=(X=(Min=5,Max=5),Y=(Min=5,Max=5),Z=(Min=100,Max=100))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.waterdrop'
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=-50,Max=50),Y=(Min=-50,Max=50),Z=(Min=0,Max=0))
    end object
    Emitters(1)=SpriteEmitter2
    fTimeSoFar=1386.264
}
