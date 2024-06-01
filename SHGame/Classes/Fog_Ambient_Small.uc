//================================================================================
// Fog_Ambient_Small.
//================================================================================

class Fog_Ambient_Small extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        UseDirectionAs=PTDU_Normal
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=128,G=128,R=0,A=0))
        ColorScale(1)=(RelativeTime=1,Color=(B=0,G=128,R=0,A=0))
        FadeOutStartTime=5
        FadeOut=true
        FadeInEndTime=2
        FadeIn=true
        UseActorForces=true
        MaxParticles=5
        ResetAfterChange=true
        StartLocationRange=(X=(Min=-20,Max=20),Y=(Min=-20,Max=20),Z=(Min=-10,Max=0))
        SpinParticles=true
        DampRotation=true
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=0,RelativeSize=6)
        SizeScale(1)=(RelativeTime=1,RelativeSize=6)
        StartSizeRange=(X=(Min=80,Max=80),Y=(Min=80,Max=80),Z=(Min=40,Max=40))
        InitialParticlesPerSecond=1000
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smoke2'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        LifetimeRange=(Min=15,Max=20)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=0,Max=0),Z=(Min=-5,Max=0))
    end object
    Emitters(0)=SpriteEmitter1
    fTimeSoFar=496.2472
}
