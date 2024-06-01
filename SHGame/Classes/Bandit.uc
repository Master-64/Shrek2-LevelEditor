//================================================================================
// Bandit.
//================================================================================

class Bandit extends ShEnemy
  Config(User);

var(Enemy) float standBackTime;
var() float stepBackAmount;
var(Enemy) float coinDisplayTime;
var(Enemy) float coinFadeTime;
var(sounds) array<Sound> sfxStealCoin;
var name bumpNoMoney;
var name bumpRunAway;
var int numStolenCoins;

function GetBumpSets()
{
}

defaultproperties
{
     standBackTime=1.000000
     stepBackAmount=-40.000000
     coinDisplayTime=10.000000
     coinFadeTime=2.000000
     sfxStealCoin(0)=Sound'Items.pickup_coin03'
     sfxStealCoin(1)=Sound'Items.pickup_coin03'
     DamageAmount=10.000000
     AttackDistance=71.000000
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
     sfxOuch(7)=Sound'AllDialog.pc_pst_Peasants_16'
     sfxOuch(8)=Sound'AllDialog.pc_pst_Peasants_18'
     sfxOuch(9)=Sound'AllDialog.pc_pst_Peasants_20'
     sfxFaint(0)=Sound'AllDialog.pc_pst_Peasants_2'
     sfxFaint(1)=Sound'AllDialog.pc_pst_Peasants_4'
     sfxFaint(2)=Sound'AllDialog.pc_pst_Peasants_6'
     sfxFaint(3)=Sound'AllDialog.pc_pst_Peasants_8'
     sfxFaint(4)=Sound'AllDialog.pc_pst_Peasants_10'
     sfxFaint(5)=Sound'AllDialog.pc_pst_Peasants_12'
     sfxFaint(6)=Sound'AllDialog.pc_pst_Peasants_14'
     sfxFaint(7)=Sound'AllDialog.pc_pst_Peasants_16'
     sfxFaint(8)=Sound'AllDialog.pc_pst_Peasants_18'
     sfxFaint(9)=Sound'AllDialog.pc_pst_Peasants_20'
     sfxGroundSplat=Sound'Peasants.peasant_splat'
     bSpawned=True
     LoadString="ShrekCharacters.Bandit"
     RandSkins(0)=Texture'ShCharacters.Bandit'
     RandSkins(1)=Texture'ShCharacters.bandit2'
     RandSkins(2)=Texture'ShCharacters.bandit3'
     RandSkins(3)=Texture'ShCharacters.bandit4'
     RandSkins(4)=Texture'ShCharacters.bandit5'
     ShrunkAnimName="fistidle"
     HoleInGroundItemsClass=Class'SHGame.HoleInGroundItemsBandit'
     TinyAttackSquishClass=Class'SHGame.DeathLily'
     SkinFreeze=FinalBlend'ShCharacters.bandit_ice'
     LoveTransAnimName="lovetrans"
     LoveIdleAnimName="loveidle"
     LoveWalkAnimName="loverun"
     sleepBeginAnimName="nightynight_start"
     sleepLoopAnimName="nightynight_loop"
     sleepEndAnimName="nightynight_end"
     WhereAnimName="invisible_react"
     stinkBeginAnimName="stinky_start"
     stinkLoopAnimName="stinky_loop"
     stinkEndAnimName="stinky_end"
     DeathTypeName(0)="stateFaint"
     DeathTypeName(1)="stateFaint"
     DeathTypeName(2)="stateFaint"
     DeathTypeName(3)="stateFaint"
     DeathTypeName(4)="stateStagger"
     DeathTypeName(5)="stateStagger"
     DeathTypeName(6)="stateStagger"
     DeathTypeName(7)="stateSpecialAttack"
     DeathTypeName(8)="stateSpecialAttack"
     FootstepsStone(0)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsStone(1)=Sound'Footsteps.f_bandit_dirt02'
     FootstepsStone(2)=Sound'Footsteps.f_bandit_dirt03'
     FootstepsStone(3)=Sound'Footsteps.f_bandit_dirt04'
     FootstepsWood(0)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsWood(1)=Sound'Footsteps.f_bandit_dirt02'
     FootstepsWood(2)=Sound'Footsteps.f_bandit_dirt03'
     FootstepsWood(3)=Sound'Footsteps.f_bandit_dirt04'
     FootstepsWet(0)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsWet(1)=Sound'Footsteps.f_bandit_dirt02'
     FootstepsWet(2)=Sound'Footsteps.f_bandit_dirt03'
     FootstepsWet(3)=Sound'Footsteps.f_bandit_dirt04'
     FootstepsGrass(0)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsGrass(1)=Sound'Footsteps.f_bandit_dirt02'
     FootstepsGrass(2)=Sound'Footsteps.f_bandit_dirt03'
     FootstepsGrass(3)=Sound'Footsteps.f_bandit_dirt04'
     FootstepsDirt(0)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsDirt(1)=Sound'Footsteps.f_bandit_dirt02'
     FootstepsDirt(2)=Sound'Footsteps.f_bandit_dirt03'
     FootstepsDirt(3)=Sound'Footsteps.f_bandit_dirt04'
     FootstepsMud(0)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsMud(1)=Sound'Footsteps.f_bandit_dirt02'
     FootstepsMud(2)=Sound'Footsteps.f_bandit_dirt03'
     FootstepsMud(3)=Sound'Footsteps.f_bandit_dirt04'
     FootstepsNone(0)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsNone(1)=Sound'Footsteps.f_bandit_dirt02'
     FootstepsNone(2)=Sound'Footsteps.f_bandit_dirt03'
     FootstepsNone(3)=Sound'Footsteps.f_bandit_dirt04'
     ControllerClass=Class'SHGame.BanditCombatController'
     Mesh=SkeletalMesh'ShrekCharacters.Bandit'
     DrawScale=1.200000
     CollisionRadius=40.000000
     CollisionHeight=40.000000
}
