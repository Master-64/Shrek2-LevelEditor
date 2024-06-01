//================================================================================
// ElfProjectile.
//================================================================================

class ElfProjectile extends Elf
  Config(User);

function Landed(Vector HitNormal)
{
}

function AddAnimNotifys()
{
}

function PickupObject()
{
}

function GetThrowType()
{
}

function ChangeController()
{
}

function SetDefaults()
{
}

defaultproperties
{
     KnockFrontAnimName="knockforward"
     AttackDistance=200.000000
     HitDistance=20.000000
     CombatController=Class'SHGame.ElfProjectileController'
     PreCombatController=Class'SHGame.ElfPreCombatController'
     attachBone="body_r_wrist_joint"
     CombatWalkAnimName="run"
     AttackAnimName(0)="throw"
     AttackAnimName(1)="throw"
     SpecialFaintAnimName="faint"
     DazedAnimName="daze"
     PeripheralVision=0.500000
     ControllerClass=Class'SHGame.ElfPreCombatController'
     MovementAnims(0)="run"
     MovementAnims(1)="run"
     MovementAnims(2)="run"
     MovementAnims(3)="run"
}
