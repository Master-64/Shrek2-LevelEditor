//================================================================================
// SteedSwitch.
//================================================================================

class SteedSwitch extends Switch
  Placeable
  Config(User);

defaultproperties
{
     SwitchSound=Sound'items.SteedSwitch'
     ThrowSwitchAnimName="ThrowSwitch"
     ReturnSwitchAnimName="switchreturn"
     OffAnimName="offstatic"
     OnAnimName="onstatic"
     PlayerName="Steed"
     LoadString="EnvAnims.SteedSwitch"
     PlayerThrowSwitchAnimName="ThrowSwitch"
     StartSoundFrame=34
     ControllerClass=None
     Mesh=SkeletalMesh'EnvAnims.SteedSwitch'
     CollisionRadius=35.000000
     CollisionHeight=41.000000
}
