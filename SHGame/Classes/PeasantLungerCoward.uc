//================================================================================
// PeasantLungerCoward.
//================================================================================

class PeasantLungerCoward extends PeasantCoward
  Config(User);

function PlayBlendedAnim(name anim, optional float rate, optional float tween)
{
}

function LoopBlendedAnim(name anim, optional float rate, optional float tween)
{
}

defaultproperties
{
     CombatIdleAnimName="forkidle"
     CombatWalkAnimName="forkwalk"
     AttackAnimName(0)="forkright"
     AttackAnimName(1)="forkright"
     FaintAnimName="forkfaint"
     CasualIdleAnimName="forkcasualidle"
     CasualWalkAnimName="forkcasualwalk"
     LookAroundAnimName="forklookaround"
     FlyBackAnimName="forkflyback"
     SpecialFaintAnimName="forkspecialfaint"
     NoticeAnimName="forkenemyaware"
     ShrunkAnimName="forklookaround"
     WalkAnims(0)="forkcasualwalk"
     WalkAnims(1)="forkcasualwalk"
     WalkAnims(2)="forkcasualwalk"
     WalkAnims(3)="forkcasualwalk"
     IdleAnimName="forkcasualidle"
     RunAnimName="forkattackrun"
     KnockBackAnimName="forkknockback"
     MovementAnims(0)="scared_run"
     MovementAnims(1)="scared_run"
     MovementAnims(2)="scared_run"
     MovementAnims(3)="scared_run"
}
