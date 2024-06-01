//================================================================================
// CSPeasantMelee.
//================================================================================

class CSPeasantMelee extends PeasantTough
  Config(User);

var() float StartToFightDistance;

function GetBumpSets()
{
}

defaultproperties
{
     StartToFightDistance=600.000000
     MovingAttackAnimName="punchright"
     MovingAttackSpeed=100
     AttackDistance=45.000000
     PreCombatController=Class'SHGame.CSPreCombatController'
     AttackInfo(0)=(AnimName="punchright",StartBoneName="body_r_elbow_joint",EndBoneName="body_r_fingersbase_joint",StartFrame=8,EndFrame=13)
     AttackInfo(1)=(AnimName="punchleft",StartBoneName="body_l_fingersbase_joint",EndBoneName=None,StartFrame=10,EndFrame=12.5)
     RunAnimName="attackrun"
     ControllerClass=Class'SHGame.CSPreCombatController'
}
