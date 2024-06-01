//================================================================================
// EnemyBoss.
//================================================================================

class EnemyBoss extends ShEnemy
  Config(User);

enum eKnightType {
  E_FIRST,
  E_SECOND,
  E_THIRD
};

struct DamageInfoStruct
{
  var name AnimName;
  var float StartFrame;
  var float EndFrame;
};

var(Enemy) name PatrolAnimName;
var(Enemy) name RecoverAnimName;
var(Enemy) name KnockoutAnimName;
var(Enemy) name DefeatAnimName;
var(Enemy) name DefeatRunAnimName;
var(Enemy) name BlockCenterAnimName;
var(Enemy) name BlockCenterBumpAnimName;
var(Enemy) name BlockLeftAnimName;
var(Enemy) name BlockLeftBumpAnimName;
var(Enemy) name BlockRightAnimName;
var(Enemy) name BlockRightBumpAnimName;
var(Enemy) name BlockTopAnimName;
var(Enemy) name BlockTopBumpAnimName;
var(Enemy) name MovingAttackAnimName;
var(Enemy) int MovingAttackSpeed;
var(Enemy) int hitAdjustment;
var(Enemy) int HUDType;
var FatKnightSword fatS;
var FatKnightSkirtBack fatSkirtBack;
var FatKnightSkirtFront fatSkirtFront;
var FatKnightSkirtLeft fatSkirtLeft;
var FatKnightSkirtRight fatSkirtRight;
var bool bAttachedToBone;
var() array<DamageInfoStruct> DamageInfo;
var(Enemy) eKnightType knightType;

function DetachSword()
{
}

function DestroySword()
{
}

function StartBossMeter()
{
}

function StopBossMeter()
{
}

function bool CanBeDamaged()
{
}

defaultproperties
{
     MovingAttackSpeed=65
     hitAdjustment=1
     ReactDistance=5000.000000
     HeroEscapeDistance=5000.000000
     bWander=True
     AttackDistance=40.000000
     CombatController=Class'SHGame.FatKnightCombatController'
     PreCombatController=Class'SHGame.FatKnightPreCombatController'
     sfxWeaponSwoosh(0)=Sound'Peasants.action_swoosh01'
     sfxWeaponSwoosh(1)=Sound'Peasants.action_swoosh02'
     sfxWeaponSwoosh(2)=Sound'Peasants.action_swoosh03'
     sfxWeaponSwoosh(3)=Sound'Peasants.action_swoosh04'
     sfxWeaponSwoosh(4)=Sound'Peasants.action_swoosh05'
     sfxWeaponSwoosh(5)=Sound'Peasants.action_swoosh06'
     sfxWeaponSwoosh(6)=Sound'Peasants.action_swoosh07'
     sfxWeaponSwoosh(7)=Sound'Peasants.action_swoosh08'
     sfxWeaponSwoosh(8)=Sound'Peasants.action_swoosh09'
     sfxWeaponSwoosh(9)=Sound'Peasants.action_swoosh10'
     sfxWeaponSwoosh(10)=Sound'Peasants.action_swoosh11'
     sfxWeaponSwoosh(11)=Sound'Peasants.action_swoosh12'
     sfxWeaponSwoosh(12)=Sound'Peasants.action_swoosh13'
     sfxAttackEffort(0)=Sound'AllDialog.pc_pst_Peasants_22'
     sfxAttackEffort(1)=Sound'AllDialog.pc_pst_Peasants_24'
     sfxAttackEffort(2)=Sound'AllDialog.pc_pst_Peasants_26'
     sfxAttackEffort(3)=Sound'AllDialog.pc_pst_Peasants_28'
     sfxAttackEffort(4)=Sound'AllDialog.pc_pst_Peasants_30'
     sfxAttackEffort(5)=Sound'AllDialog.pc_pst_Peasants_32'
     sfxAttackEffort(6)=Sound'AllDialog.pc_pst_Peasants_34'
     sfxAttackEffort(7)=Sound'AllDialog.pc_pst_Peasants_36'
     sfxAttackEffort(8)=Sound'AllDialog.pc_pst_Peasants_38'
     sfxAttackEffort(9)=Sound'AllDialog.pc_pst_Peasants_40'
     sfxAttackConnect(0)=Sound'Peasants.Peasant_punch01'
     sfxAttackConnect(1)=Sound'Peasants.Peasant_punch02'
     sfxAttackConnect(2)=Sound'Peasants.Peasant_punch03'
     sfxAttackConnect(3)=Sound'Peasants.Peasant_punch04'
     sfxAttackConnect(4)=Sound'Peasants.Peasant_punch05'
     sfxAttackConnect(5)=Sound'Peasants.Peasant_punch06'
     sfxAttackConnect(6)=Sound'Peasants.Peasant_punch07'
     sfxOuch(0)=Sound'AllDialog.pc_pst_Peasants_2'
     sfxOuch(1)=Sound'AllDialog.pc_pst_Peasants_4'
     sfxOuch(2)=Sound'AllDialog.pc_pst_Peasants_6'
     sfxOuch(3)=Sound'AllDialog.pc_pst_Peasants_8'
     sfxOuch(4)=Sound'AllDialog.pc_pst_Peasants_10'
     sfxOuch(5)=Sound'AllDialog.pc_pst_Peasants_12'
     sfxOuch(6)=Sound'AllDialog.pc_pst_Peasants_14'
     sfxEnemyAware(0)=Sound'AllDialog.pc_pst_Peasants_2'
     sfxEnemyAware(1)=Sound'AllDialog.pc_pst_Peasants_4'
     LoadString="ShrekCharacters.FatKnight"
     CombatIdleAnimName="None"
     CombatWalkAnimName="None"
     AttackAnimName(0)=None
     AttackAnimName(1)=None
     CasualIdleAnimName="None"
     NoticeAnimName="None"
     bUsePotions=False
     IdleAnimName="None"
     bCanJump=True
     ControllerClass=Class'SHGame.FatKnightPreCombatController'
	 MouthBone="body__mouth_joint"
     Mesh=SkeletalMesh'ShrekCharacters.FatKnight'
     CollisionHeight=33.000000
}
