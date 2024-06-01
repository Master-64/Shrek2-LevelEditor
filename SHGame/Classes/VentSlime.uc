//================================================================================
// VentSlime.
//================================================================================

class VentSlime extends Vent
  Config(User);

function GetBumpSets()
{
}

defaultproperties
{
     fxGeyserClass=Class'SHGame.Vent_Slime'
     collisionBoxHeight=10.000000
     collisionBoxRadius=25.000000
     emitterEffectOffset=(X=2.000000,Y=-3.000000,Z=-1.000000)
     emitterEffectRotation=(Pitch=16384,Yaw=5310,Roll=32772)
     collisionEffectOffset=(X=95.000000,Y=-162.000000,Z=-2.000000)
     collisionEffectRotation=(Pitch=64456,Yaw=5310,Roll=48796)
     Mesh=SkeletalMesh'EnvAnims.Vent_Slime'
}
