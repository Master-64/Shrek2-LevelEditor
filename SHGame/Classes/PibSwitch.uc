//================================================================================
// PibSwitch.
//================================================================================

class PibSwitch extends Switch
  Placeable
  Config(User);

defaultproperties
{
     SwitchSound=Sound'items.PIB_switch'
     ThrowSwitchAnimName="ThrowSwitch"
     ReturnSwitchAnimName="switchreturn"
     OffAnimName="staticup"
     OnAnimName="staticdown"
     PlayerName="PIB"
     LoadString="EnvAnims.PibSwitch"
     PlayerThrowSwitchAnimName="ThrowSwitch"
     StartSoundFrame=1
     ControllerClass=None
     Mesh=SkeletalMesh'EnvAnims.PibSwitch'
     CollisionRadius=28.000000
     CollisionHeight=60.000000
	 bAlignBottom=False
}
