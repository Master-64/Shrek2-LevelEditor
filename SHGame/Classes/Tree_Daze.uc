//================================================================================
// Tree_Daze.
//================================================================================

class Tree_Daze extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter45 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=255,G=0,R=0,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=255,G=255,R=0,A=0))
        ColorScale(2)=(RelativeTime=0.99999,Color=(B=255,G=0,R=0,A=0))
        FadeOutStartTime=1
        FadeInEndTime=0.05
        FadeIn=true
        MaxParticles=40
        ResetAfterChange=true
        SpinsPerSecondRange=(X=(Min=-0.02,Max=0.02),Y=(Min=-0.02,Max=0.02),Z=(Min=-0.02,Max=0.02))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0,RelativeSize=6)
        SizeScale(1)=(RelativeTime=0.5,RelativeSize=3)
        SizeScale(2)=(RelativeTime=1,RelativeSize=6)
        SizeScaleRepeats=3
        StartSizeRange=(X=(Min=25,Max=25),Y=(Min=25,Max=25),Z=(Min=25,Max=25))
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.ringu'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=400,Max=400))
    end object
    Emitters(0)=SpriteEmitter45
    AutoReset=true
    fTimeSoFar=80.88026
}
