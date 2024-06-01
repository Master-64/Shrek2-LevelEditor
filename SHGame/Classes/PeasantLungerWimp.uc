//================================================================================
// PeasantLungerWimp.
//================================================================================

class PeasantLungerWimp extends PeasantWimp
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
     DamageAmount=10.000000
     AttackDistance=100.000000
     CombatIdleAnimName="scared_forkidle"
     CombatWalkAnimName="scared_forkwalk"
     AttackAnimName(0)="scared_forkattack"
     AttackAnimName(1)="scared_forkattack"
     FaintAnimName="scared_forkfaint"
     CasualIdleAnimName="forkcasualidle"
     CasualWalkAnimName="forkcasualwalk"
     LookAroundAnimName="forklookaround"
     FlyBackAnimName="forkflyback"
     SpecialFaintAnimName="forkspecialfaint"
     NoticeAnimName="forkenemyaware"
     ShrunkAnimName="forklookaround"
     AttackInfo(0)=(AnimName="scared_forkattack",StartBoneName="body_r_elbow_joint",EndBoneName="body_r_fingersbase_joint",StartFrame=14.2,EndFrame=19)
     AttackInfo(1)=(AnimName="scared_forkattack",StartBoneName="body_l_elbow_joint",EndBoneName="body_l_fingersbase_joint",StartFrame=14.2,EndFrame=19)
     WalkAnims(0)="forkcasualwalk"
     WalkAnims(1)="forkcasualwalk"
     WalkAnims(2)="forkcasualwalk"
     WalkAnims(3)="forkcasualwalk"
     IdleAnimName="forkcasualidle"
     RunAnimName="scared_forkwalk"
     KnockBackAnimName="scared_forkknockback"
     MovementAnims(0)="scared_forkwalk"
     MovementAnims(1)="scared_forkwalk"
     MovementAnims(2)="scared_forkwalk"
     MovementAnims(3)="scared_forkwalk"
}
