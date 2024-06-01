//================================================================================
// PeasantMeleeWimp.
//================================================================================

class PeasantMeleeWimp extends PeasantWimp
  Config(User);

function GetBumpSets()
{
}

defaultproperties
{
     AttackDistance=25.000000
     CombatIdleAnimName="scared_fistidle"
     CombatWalkAnimName="scared_fistwalk"
     AttackAnimName(0)="scared_punchright"
     AttackAnimName(1)="scared_punchleft"
     ShrunkAnimName="lookaround"
     AttackInfo(0)=(AnimName="scared_punchright",StartBoneName="body_r_elbow_joint",EndBoneName="body_r_fingersbase_joint",StartFrame=8.3,EndFrame=13)
     AttackInfo(1)=(AnimName="scared_punchleft",StartBoneName="body_l_elbow_joint",EndBoneName="body_l_fingersbase_joint",StartFrame=9,EndFrame=14.5)
     RunAnimName="scared_fistwalk"
     MovementAnims(0)="scared_fistwalk"
     MovementAnims(1)="scared_fistwalk"
     MovementAnims(2)="scared_fistwalk"
     MovementAnims(3)="scared_fistwalk"
}
