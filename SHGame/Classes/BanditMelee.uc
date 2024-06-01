//================================================================================
// BanditMelee.
//================================================================================

class BanditMelee extends Bandit
  Config(User);

defaultproperties
{
     CombatController=Class'SHGame.BanditCombatController'
     CombatWalkAnimName="run"
     CasualIdleAnimName="fistidle"
     AttackInfo(0)=(AnimName="punchright",StartBoneName="body_r_fingersbase_joint",EndBoneName="body_r_wrist_joint",StartFrame=8,EndFrame=12)
     AttackInfo(1)=(AnimName="punchleft",StartBoneName="body_l_fingersbase_joint",EndBoneName="body_l_elbow_joint",StartFrame=10,EndFrame=14)
     AttackInfo(2)=(AnimName="punchleft",StartBoneName="body_r_fingersbase_joint",EndBoneName="body_r_shoulder_joint",StartFrame=10,EndFrame=14)
     IdleAnimName="fistidle"
     MovementAnims(0)="run"
     MovementAnims(1)="run"
     MovementAnims(2)="run"
     MovementAnims(3)="run"
}
