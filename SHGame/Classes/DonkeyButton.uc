//================================================================================
// DonkeyButton.
//================================================================================

class DonkeyButton extends PushButton
  Placeable
  Config(User);

defaultproperties
{
     ButtonDownAnimName="Down"
     ButtonUpAnimName="Up"
     ButtonStaticAnimName="Static"
     PlayerName="Donkey"
     ControllerClass=None
     Mesh=SkeletalMesh'EnvAnims.button_donkey'
     CollisionRadius=30.000000
	 CollisionWidth=30.00
     CollisionHeight=14.000000
	 CollideType=CT_Box
	 bAlignBottom=False
}
