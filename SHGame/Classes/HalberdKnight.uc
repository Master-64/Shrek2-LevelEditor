//================================================================================
// HalberdKnight.
//================================================================================

class HalberdKnight extends Knight
  Config(User);

function PlayBlendedAnim(name anim, optional float rate, optional float tween)
{
}

function LoopBlendedAnim(name anim, optional float rate, optional float tween)
{
}

function Love()
{
}

defaultproperties
{
     DamageAmount=20.000000
     AttackDistance=40.000000
     CombatController=Class'SHGame.HalberdKnightCombatController'
     PreCombatController=Class'SHGame.HalberdKnightPreCombatController'
     CombatIdleAnimName="halberdcombatidle"
     AttackAnimName(0)="halberdswing"
     AttackAnimName(1)="halberdswing"
     CasualIdleAnimName="halberdidle"
     DazedAnimName="dizzy"
     ShrunkAnimName="halberdidle"
     LoveTransAnimName="halberdlovetrans"
     LoveIdleAnimName="halberdloveidle"
     sleepBeginAnimName="halberdnightynight_start"
     sleepLoopAnimName="halberdnightynight_idle"
     sleepEndAnimName="halberdnightynight_end"
     WhereAnimName="halberdinvisible_react"
     stinkBeginAnimName="halberdstinky_start"
     stinkLoopAnimName="halberdstinky_loop"
     stinkEndAnimName="halberdstinky_end"
	 AttackInfo(0)=(AnimName="halberdswing",StartBoneName="body_weaponmid_joint",EndBoneName="body_halberdtip_joint",StartFrame=20,EndFrame=30)
     IdleAnimName="halberdidle"
     RunAnimName="swordrun"
     Health=6
     ControllerClass=Class'SHGame.HalberdKnightPreCombatController'
     MovementAnims(0)="swordrun"
     MovementAnims(1)="swordrun"
     MovementAnims(2)="swordrun"
     MovementAnims(3)="swordrun"
}
