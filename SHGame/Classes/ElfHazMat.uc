//================================================================================
// ElfHazMat.
//================================================================================

class ElfHazMat extends Elf
  Config(User);

function Landed(Vector HitNormal)
{
}

defaultproperties
{
     KnockFrontAnimName="knockforward"
     AttackDistance=55.000000
     HitDistance=20.000000
     CombatController=Class'SHGame.ElfCombatController'
     PreCombatController=Class'SHGame.ElfPreCombatController'
     sfxAttackEffort(0)=Sound'AllDialog.pc_elf_ElfRam_2'
     sfxAttackEffort(1)=Sound'AllDialog.pc_elf_ElfRam_4'
     sfxAttackEffort(2)=Sound'AllDialog.pc_elf_ElfRam_6'
     sfxAttackEffort(3)=Sound'AllDialog.pc_elf_ElfRam_8'
     sfxAttackEffort(4)=Sound'AllDialog.pc_elf_ElfRam_10'
     sfxAttackEffort(5)=Sound'AllDialog.pc_elf_ElfRam_12'
     CombatWalkAnimName="run"
     AttackAnimName(0)="punch_end"
     AttackAnimName(1)="punch_end"
     DazedAnimName="daze"
     PeripheralVision=0.500000
     ControllerClass=Class'SHGame.ElfPreCombatController'
     MovementAnims(0)="run"
     MovementAnims(1)="run"
     MovementAnims(2)="run"
     MovementAnims(3)="run"
}
