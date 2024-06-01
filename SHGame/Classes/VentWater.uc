//================================================================================
// VentWater.
//================================================================================

class VentWater extends Vent
  Config(User);

function GetBumpSets()
{
}

defaultproperties
{
     fxPreGeyserClass=Class'SHGame.Vent_Water_warning'
     AnimNameWarning="Static"
     fxGeyserClass=Class'SHGame.Vent_Water'
     collisionBoxHeight=15.000000
     emitterEffectOffset=(X=20.000000,Y=-9.000000,Z=-2.000000)
     emitterEffectRotation=(Pitch=11168,Yaw=9990)
     collisionEffectOffset=(X=178.000000,Y=-98.000000,Z=-13.000000)
     collisionEffectRotation=(Pitch=44026,Yaw=10440,Roll=49966)
     PreEmitterEffectOffset=(X=36.000000,Y=-17.000000,Z=2.000000)
     PreEmitterEffectRotation=(Pitch=6144,Yaw=8686,Roll=28766)
     Mesh=SkeletalMesh'EnvAnims.Vent_Water'
}
