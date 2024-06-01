//================================================================================
// BanditBoss.
//================================================================================

class BanditBoss extends EnemyBoss
  Config(User);

var int MaxHealth;

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

defaultproperties
{
     HUDType=1
     ReactDistance=2500.000000
     DamageAmount=20.000000
     HeroEscapeDistance=2500.000000
     CombatSpeed=400.000000
     AttackDistance=70.000000
     CombatController=Class'SHGame.BanditBossCombatController'
     PreCombatController=Class'SHGame.BanditBossPreCombatController'
     LoadString="ShrekCharacters.Bandit"
	 RandSkins(0)=Texture'ShCharacters.BanditBoss'
     CombatIdleAnimName="fistidle"
     CombatWalkAnimName="run"
     AttackAnimName(0)="bosspunchright"
     AttackAnimName(1)="punchleft"
     CasualIdleAnimName="fistidle"
     NoticeAnimName="fistidle"
     AttackInfo(0)=(AnimName="bosspunchright",StartBoneName="body_r_fingersbase_joint",EndBoneName="body_r_wrist_joint",StartFrame=8,EndFrame=12)
     AttackInfo(1)=(AnimName="punchleft",StartBoneName="body_l_fingersbase_joint",EndBoneName="body_l_elbow_joint",StartFrame=10,EndFrame=14)
     AttackInfo(2)=(AnimName="punchleft",StartBoneName="body_r_fingersbase_joint",EndBoneName="body_r_elbow_joint",StartFrame=10,EndFrame=14)
     TakeoffAnims(0)="fistidle"
     TakeoffAnims(1)="fistidle"
     TakeoffAnims(2)="fistidle"
     TakeoffAnims(3)="fistidle"
     LandAnims(0)="fistidle"
     LandAnims(1)="fistidle"
     AirStillAnim="fistidle"
     TakeoffStillAnim="fistidle"
     IdleAnimName="fistidle"
     Health=25
     ControllerClass=Class'SHGame.BanditBossPreCombatController'
     MovementAnims(0)="run"
     MovementAnims(1)="run"
     MovementAnims(2)="run"
     MovementAnims(3)="run"
     TurnLeftAnim="fistidle"
     TurnRightAnim="fistidle"
     Mesh=SkeletalMesh'ShrekCharacters.Bandit'
     DrawScale=1.700000
     CollisionRadius=70.000000
     CollisionHeight=100.000000
}
