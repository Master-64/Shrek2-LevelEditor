//================================================================================
// FairyG_poof.
//================================================================================

class FairyG_poof extends Shrk2_Storybook2_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        FadeOut=true
        RespawnDeadParticles=false
        StartLocationShape=PTLS_Sphere
        RevolutionsPerSecondRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=1,Max=1))
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.2,Max=0.2),Y=(Min=0,Max=0),Z=(Min=0,Max=0))
        UseSizeScale=true
        StartSizeRange=(X=(Min=75,Max=75),Y=(Min=75,Max=75),Z=(Min=100,Max=100))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_AlphaBlend
        Texture=Texture'Shrek2_EFX.storybook_particles.poof'
        LifetimeRange=(Min=2,Max=2)
        StartVelocityRange=(X=(Min=-100,Max=100),Y=(Min=-100,Max=100),Z=(Min=2,Max=2))
        UseVelocityScale=true
        VelocityScale(0)=(RelativeTime=1,RelativeVelocity=(X=0,Y=0,Z=0))
    end object
    Emitters(0)=SpriteEmitter0
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        FadeOut=true
        MaxParticles=1
        RespawnDeadParticles=false
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=0,Max=0))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=2.4)
        StartSizeRange=(X=(Min=50,Max=50),Y=(Min=50,Max=50),Z=(Min=50,Max=50))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_AlphaBlend
        Texture=Texture'Shrek2_EFX.storybook_particles.poof'
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=2,Max=2))
        UseVelocityScale=true
        VelocityScale(0)=(RelativeTime=1,RelativeVelocity=(X=0,Y=0,Z=0))
    end object
    Emitters(1)=SpriteEmitter1
    fTimeSoFar=1198.703
}
