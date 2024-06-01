//================================================================================
// BearTrap.
//================================================================================

class BearTrap extends Trap
  Placeable
  Config(User);

function AddAnimNotifys()
{
}

defaultproperties
{
     TrapDamage=15
     TrapSound=Sound'items.Shrek_switch'
     TrapLeavesEmitter=Class'SHGame.Cookie_Bits'
     TrapLeavesClass=Class'SHGame.BearTrapLeaves'
     TrapStaticAnimName="Static"
     TrapSnapAnimName="snap"
     bChangeOpacityForFadeOut=True
     CurrentOpacityForFadeOut=1.000000
     SpeedOpacityForFadeOut=0.500000
     ControllerClass=None
     Mesh=SkeletalMesh'EnvAnims.BearTrap'
     DrawScale=4.000000
     CollisionRadius=12.000000
     CollisionHeight=4.000000
	 bAlignBottom=False
}
