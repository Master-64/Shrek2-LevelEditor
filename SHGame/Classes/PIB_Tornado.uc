//================================================================================
// PIB_Tornado.
//================================================================================

class PIB_Tornado extends Shrk2_Enemy_FX;

defaultproperties
{
    Begin Object name=SpriteEmitter7 class=SpriteEmitter
        Opacity=0.65
        FadeOut=true
        StartLocationOffset=(X=0,Y=0,Z=-15)
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=7)
        StartSizeRange=(X=(Min=15,Max=15),Y=(Min=15,Max=15),Z=(Min=15,Max=15))
        UniformSize=true
        DrawStyle=PTDS_Brighten
        Texture=Texture'Shrek2_EFX.Gen_Particle.smoke2'
        LifetimeRange=(Min=1,Max=2)
        StartVelocityRange=(X=(Min=-5,Max=5),Y=(Min=-5,Max=5),Z=(Min=0,Max=20))
        WarmupTicksPerSecond=0.8
        RelativeWarmupTime=1
    end object
    Emitters(0)=SpriteEmitter7
    Begin Object name=SpriteEmitter8 class=SpriteEmitter
        Acceleration=(X=0,Y=0,Z=-50)
        FadeOut=true
        CoordinateSystem=PTCS_Relative
        MaxParticles=15
        StartLocationOffset=(X=0,Y=0,Z=10)
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=2,Max=2),Y=(Min=2,Max=2),Z=(Min=2,Max=2))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale(0)=(RelativeTime=1,RelativeSize=2)
        StartSizeRange=(X=(Min=2,Max=4),Y=(Min=2,Max=4),Z=(Min=2,Max=4))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.hair'
        LifetimeRange=(Min=2,Max=2)
        StartVelocityRange=(X=(Min=-30,Max=30),Y=(Min=-30,Max=30),Z=(Min=0,Max=50))
    end object
    Emitters(1)=SpriteEmitter8
    Begin Object name=SpriteEmitter9 class=SpriteEmitter
        Opacity=0.85
        UseColorScale=true
        ColorScale(0)=(RelativeTime=0,Color=(B=29,G=73,R=122,A=0))
        ColorScale(1)=(RelativeTime=0.5,Color=(B=27,G=44,R=95,A=0))
        ColorScale(2)=(RelativeTime=0.999999,Color=(B=228,G=242,R=248,A=0))
        CoordinateSystem=PTCS_Relative
        MaxParticles=5
        StartSizeRange=(X=(Min=35,Max=40),Y=(Min=35,Max=40),Z=(Min=35,Max=40))
        UniformSize=true
        Texture=Texture'Shrek2_EFX.Gen_Particle.smok_ball1'
        WarmupTicksPerSecond=0.8
        RelativeWarmupTime=1
    end object
    Emitters(2)=SpriteEmitter9
    fTimeSoFar=7083.981
}
