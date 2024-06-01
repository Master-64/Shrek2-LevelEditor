//================================================================================
// Vent_Flame_warning.
//================================================================================

class Vent_Flame_warning extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter0 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-20)
        Opacity=0.75
        UseColorScale=true
        FadeOut=true
        StartLocationOffset=(X=-20,Y=0,Z=-10)
        UseRotationFrom=PTRS_Actor
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.1,Max=0.1),Y=(Min=0.1,Max=0.1),Z=(Min=0.1,Max=0.1))
        StartSizeRange=(X=(Min=15,Max=20),Y=(Min=15,Max=20),Z=(Min=15,Max=20))
        UniformSize=true
        InitialParticlesPerSecond=5000
        AutomaticInitialSpawning=false
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_anim'
        TextureUSubdivisions=3
        TextureVSubdivisions=3
        BlendBetweenSubdivisions=true
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=1)
        StartVelocityRange=(X=(Min=0,Max=-25),Y=(Min=-65,Max=65),Z=(Min=0,Max=0))
    end object
    Emitters(0)=SpriteEmitter0
    fTimeSoFar=3968.03
}
