//================================================================================
// ElfHazMatRamp.
//================================================================================

class ElfHazMatRamp extends ElfHazMat
  Config(User);

function Landed(Vector HitNormal)
{
}

defaultproperties
{
     AttackAnimName(0)="punch"
     AttackAnimName(1)="punch"
     SpecialFaintAnimName="faint"
	 bCanWalkOffLedges=False
}
