//================================================================================
// Potion_Love.
//================================================================================

class Potion_Love extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter2 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-20)
        Opacity=0.85
        FadeOutStartTime=0.95
        FadeOut=true
        MaxParticles=5
        UseSizeScale=true
        SizeScale(0)=(RelativeTime=0.8,RelativeSize=0.5)
        StartSizeRange=(X=(Min=10,Max=25),Y=(Min=10,Max=25),Z=(Min=10,Max=25))
        UniformSize=true
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.lovely'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=4)
        StartVelocityRange=(X=(Min=-10,Max=10),Y=(Min=-10,Max=10),Z=(Min=80,Max=80))
        RelativeWarmupTime=0.5
    end object
    Emitters(0)=SpriteEmitter2
    fTimeSoFar=952.9614
}
