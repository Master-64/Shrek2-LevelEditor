//================================================================================
// PeasantLunger.
//================================================================================

class PeasantLunger extends PeasantTough
  Config(User);

function PlayBlendedAnim(name anim, optional float rate, optional float tween)
{
}

function LoopBlendedAnim(name anim, optional float rate, optional float tween)
{
}

function GetBumpSets()
{
}

defaultproperties
{
     MovingAttackAnimName="forkattack"
     MovingAttackSpeed=1
     DamageAmount=10.000000
     AttackDistance=50.000000
     CombatIdleAnimName="forkidle"
     CombatWalkAnimName="forkwalk"
     AttackAnimName(0)="forkattack"
     AttackAnimName(1)="forkright"
     FaintAnimName="forkfaint"
     CasualIdleAnimName="forkcasualidle"
     CasualWalkAnimName="forkcasualwalk"
     LookAroundAnimName="forklookaround"
     FlyBackAnimName="forkflyback"
     SpecialFaintAnimName="forkspecialfaint"
     NoticeAnimName="forkenemyaware"
     ShrunkAnimName="forklookaround"
     LoveTransAnimName="forklovetrans"
     LoveIdleAnimName="forkloveidle"
     LoveWalkAnimName="forkloverun"
     sleepBeginAnimName="forknightynight_start"
     sleepLoopAnimName="forknightynight_loop"
     sleepEndAnimName="forknightynight_end"
     WhereAnimName="forkinvisible_react"
     stinkBeginAnimName="forkstinky_start"
     stinkLoopAnimName="forkstinky_loop"
     stinkEndAnimName="forkstinky_end"
     AttackInfo(0)=(AnimName="forkattack",StartBoneName="body_r_fingersbase_joint",EndBoneName="body_forktip_joint",StartFrame=9.5,EndFrame=16)
     AttackInfo(1)=(AnimName="forkright",StartBoneName="body_r_fingersbase_joint",EndBoneName="body_forktip_joint",StartFrame=9,EndFrame=12)
     WalkAnims(0)="forkcasualwalk"
     WalkAnims(1)="forkcasualwalk"
     WalkAnims(2)="forkcasualwalk"
     WalkAnims(3)="forkcasualwalk"
     IdleAnimName="forkcasualidle"
     RunAnimName="forkattackrun"
     KnockBackAnimName="forkknockback"
     MovementAnims(0)="forkattackrun"
     MovementAnims(1)="forkattackrun"
     MovementAnims(2)="forkattackrun"
     MovementAnims(3)="forkattackrun"
}
