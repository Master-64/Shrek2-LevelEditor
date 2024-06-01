//================================================================================
// BanditSpecial.
//================================================================================

class BanditSpecial extends Bandit
  Config(User);

var WheelStealerSpawnDirector stealerDirector;
var Actor speakingDonkey;
var Actor speakingFiona;
var() float DialogLength;
var string dialogOne;
var string dialogTwo;
var() array<string> tutDialog;
var float TimeElapsed;
var bool bTutOneComplete;
var bool bTutTwoComplete;
var name bumpDonkeyTut;
var name bumpFionaTut;
var bool bSpeakingBandit;

function GetBumpSets()
{
}

defaultproperties
{
     tutDialog(0)="pc_dnk_bumpline_2181"
     tutDialog(1)="pc_dnk_bumpline_2282"
     tutDialog(2)="pc_dnk_bumpline_1404"
     tutDialog(3)="pc_dnk_bumpline_1405"
     tutDialog(4)="pc_dnk_bumpline_327"
     tutDialog(5)="pc_dnk_bumpline_641"
     CombatSpeed=250.000000
     CombatController=Class'SHGame.BanditSpecialCombatController'
     CombatWalkAnimName="run"
     CasualIdleAnimName="fistidle"
     AttackInfo(0)=(AnimName="punchright",StartBoneName="body_r_fingersbase_joint",EndBoneName="body_r_wrist_joint",StartFrame=8,EndFrame=12)
     AttackInfo(1)=(AnimName="punchleft",StartBoneName="body_l_fingersbase_joint",EndBoneName="body_l_elbow_joint",StartFrame=10,EndFrame=14)
     AttackInfo(2)=(AnimName="punchleft",StartBoneName="body_r_fingersbase_joint",EndBoneName="body_r_shoulder_joint",StartFrame=10,EndFrame=14)
     IdleAnimName="fistidle"
     ControllerClass=Class'SHGame.BanditSpecialCombatController'
     MovementAnims(0)="run"
     MovementAnims(1)="run"
     MovementAnims(2)="run"
     MovementAnims(3)="run"
}
