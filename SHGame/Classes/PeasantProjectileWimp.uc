//================================================================================
// PeasantProjectileWimp.
//================================================================================

class PeasantProjectileWimp extends PeasantWimp
  Config(User);

function AddAnimNotifys()
{
}

function PickupObject()
{
}

function GetThrowType()
{
}

function GetBumpSets()
{
}

defaultproperties
{
     CombatController=Class'SHGame.ProjectileController'
     attachBone="body_r_wrist_joint"
     CombatIdleAnimName="scared_fistidle"
     CombatWalkAnimName="scared_fistwalk"
     AttackAnimName(0)="throw"
     AttackAnimName(1)="throw"
     FaintAnimName="scared_faint"
     ShrunkAnimName="lookaround"
     RunAnimName="scared_fistwalk"
     KnockBackAnimName="scared_knockback"
     MovementAnims(0)="scared_fistwalk"
     MovementAnims(1)="scared_fistwalk"
     MovementAnims(2)="scared_fistwalk"
     MovementAnims(3)="scared_fistwalk"
}
