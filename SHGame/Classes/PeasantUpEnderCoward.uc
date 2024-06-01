//================================================================================
// PeasantUpEnderCoward.
//================================================================================

class PeasantUpEnderCoward extends PeasantCoward
  Config(User);

function PlayBlendedAnim(name anim, optional float rate, optional float tween)
{
}

function LoopBlendedAnim(name anim, optional float rate, optional float tween)
{
}

defaultproperties
{
     CombatIdleAnimName="torchcombatidle"
     CombatWalkAnimName="torchwalk"
     AttackAnimName(0)="torchswipe"
     AttackAnimName(1)="torchswipe"
     FaintAnimName="torchfaint"
     CasualIdleAnimName="torchidle"
     CasualWalkAnimName="torchcasualwalk"
     LookAroundAnimName="torchlookaround"
     FlyBackAnimName="torchflyback"
     SpecialFaintAnimName="torchspecialfaint"
     NoticeAnimName="torchenemyaware"
     ShrunkAnimName="torchlookaround"
     WalkAnims(0)="torchcasualwalk"
     WalkAnims(1)="torchcasualwalk"
     WalkAnims(2)="torchcasualwalk"
     WalkAnims(3)="torchcasualwalk"
     IdleAnimName="torchidle"
     RunAnimName="torchattackwalk"
     WalkAnimName="torchcasualwalk"
     KnockBackAnimName="torchknockback"
     MovementAnims(0)="scared_run"
     MovementAnims(1)="scared_run"
     MovementAnims(2)="scared_run"
     MovementAnims(3)="scared_run"
}
