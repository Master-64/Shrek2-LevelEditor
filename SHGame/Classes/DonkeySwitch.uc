//================================================================================
// DonkeySwitch.
//================================================================================

class DonkeySwitch extends Switch
  Placeable
  Config(User);

defaultproperties
{
     SwitchSound=Sound'Donkey.donkey_switch'
     ThrowSwitchAnimName="ThrowSwitch"
     ReturnSwitchAnimName="switchreturn"
     OffAnimName="offstatic"
     OnAnimName="onstatic"
     PlayerName="Donkey"
     LoadString="EnvAnims.Switch_Donkey"
     PlayerThrowSwitchAnimName="ThrowSwitch"
     StartSoundFrame=33
     ControllerClass=None
     Mesh=SkeletalMesh'EnvAnims.switch_donkey'
     CollisionRadius=50.000000
     CollisionHeight=43.000000
	 bAlignBottom=False
}
