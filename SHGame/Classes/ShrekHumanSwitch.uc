//================================================================================
// ShrekHumanSwitch.
//================================================================================

class ShrekHumanSwitch extends Switch
  Placeable
  Config(User);

defaultproperties
{
     SwitchSound=Sound'items.Shrek_switch'
     ThrowSwitchAnimName="throwswitch2"
     ReturnSwitchAnimName="switchreturn"
     OffAnimName="offstatic"
     OnAnimName="onstatic"
     PlayerName="ShrekHuman"
     LoadString="EnvAnims.ShrekSwitch"
     PlayerThrowSwitchAnimName="ThrowSwitch"
     StartSoundFrame=1
     ControllerClass=None
     Mesh=SkeletalMesh'EnvAnims.ShrekSwitch'
     CollisionRadius=35.000000
     CollisionHeight=41.000000
	 bAlignBottom=False
}
