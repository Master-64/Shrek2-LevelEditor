//================================================================================
// ShrekHumanBrokenSwitch.
//================================================================================

class ShrekHumanBrokenSwitch extends Switch
  Placeable
  Config(User);

defaultproperties
{
     SwitchSound=Sound'items.Shrek_switch'
     ThrowSwitchAnimName="ThrowSwitch"
     ReturnSwitchAnimName="switchreturn"
     OffAnimName="offstatic"
     OnAnimName="onstatic"
     PlayerName="ShrekHuman"
     LoadString="EnvAnims.BrokenSwitch"
     PlayerThrowSwitchAnimName="throwswitchbroken"
     StartSoundFrame=1
     ControllerClass=None
     Mesh=SkeletalMesh'EnvAnims.brokenswitch'
     CollisionRadius=35.000000
     CollisionHeight=20.000000
	 bAlignBottom=False
}
