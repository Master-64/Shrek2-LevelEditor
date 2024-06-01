//================================================================================
// VentSteam.
//================================================================================

class VentSteam extends Vent
  Config(User);

function GetBumpSets()
{
}

defaultproperties
{
     fxGeyserClass=Class'SHGame.Vent_Steam'
     emitterEffectOffset=(X=-2.000000,Y=-4.000000,Z=42.000000)
     emitterEffectRotation=(Pitch=32760,Yaw=32948,Roll=16482)
     collisionEffectOffset=(X=4.000000,Y=-3.000000,Z=161.000000)
     collisionEffectRotation=(Pitch=65266,Yaw=0,Roll=65266)
     PreEmitterEffectOffset=(X=-8.000000,Y=-19.000000,Z=10.000000)
     PreEmitterEffectRotation=(Pitch=34816,Yaw=14830,Roll=4190)
     Mesh=SkeletalMesh'EnvAnims.Vent_Steam'
}
