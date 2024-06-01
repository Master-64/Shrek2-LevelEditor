//================================================================================
// KnightMelee.
//================================================================================

class KnightMelee extends Knight
  Config(User);

function AddAnimNotifys()
{
}

function PlayBlendedAnim(name anim, optional float rate, optional float tween)
{
}

function LoopBlendedAnim(name anim, optional float rate, optional float tween)
{
}

defaultproperties
{
     CombatIdleAnimName="swordidle"
     AttackAnimName(0)="swordright"
     AttackAnimName(1)="swordleft"
     FaintAnimName="swordfaint"
     CasualIdleAnimName="swordidle"
     AttackInfo(0)=(AnimName="swordright",StartBoneName="body_r_fingersbase_joint",EndBoneName="body_swordtip_joint",StartFrame=25,EndFrame=30)
     AttackInfo(1)=(AnimName="swordleft",StartBoneName="body_r_fingersbase_joint",EndBoneName="body_swordtip_joint",StartFrame=35,EndFrame=40)
     IdleAnimName="swordidle"
     RunAnimName="swordrun"
     MovementAnims(0)="swordrun"
     MovementAnims(1)="swordrun"
     MovementAnims(2)="swordrun"
     MovementAnims(3)="swordrun"
}
