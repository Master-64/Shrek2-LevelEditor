//================================================================================
// Potion_Love_tree.
//================================================================================

class Potion_Love_tree extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter1 class=SpriteEmitter
        Acceleration=(X=0,Y=20,Z=-20)
        Opacity=0.85
        FadeOutStartTime=0.95
        FadeOut=true
        MaxParticles=5
        UseSizeScale=true
        SizeScale(0)=(RelativeTime=0.8,RelativeSize=0.5)
        StartSizeRange=(X=(Min=60,Max=75),Y=(Min=60,Max=75),Z=(Min=60,Max=75))
        UniformSize=true
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.lovely'
        SecondsBeforeInactive=0
        LifetimeRange=(Min=1,Max=4)
        StartVelocityRange=(X=(Min=45,Max=45),Y=(Min=60,Max=60),Z=(Min=75,Max=75))
        RelativeWarmupTime=0.5
    end object
    Emitters(0)=SpriteEmitter1
    fTimeSoFar=1092.727
}
