//================================================================================
// Peasant.
//================================================================================

class Peasant extends ShEnemy
  Config(User);

var(sounds) array<Sound> sfxRunAway;
var(sounds) array<Sound> sfxMobGrumbling;
var(sounds) array<Sound> sfxDonkeyAware;

function GetBumpSets()
{
}

function GetLost()
{
}

function Landed(Vector HitNormal)
{
}

defaultproperties
{
     CombatController=Class'SHGame.PeasantCombatController'
     PreCombatController=Class'SHGame.PeasantPreCombatController'
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
     sfxGroundSplat=Sound'Peasants.peasant_splat'
     LoadString="ShrekCharacters.Peasant"
     RandSkins(0)=Texture'ShCharacters.Peasant_tx'
     RandSkins(1)=Texture'ShCharacters.Peasant_tx2'
     RandSkins(2)=Texture'ShCharacters.Peasant_tx3'
     RandSkins(3)=Texture'ShCharacters.Peasant_tx4'
     RandSkins(4)=Texture'ShCharacters.Peasant_tx5'
     TinyAttackSquishClass=Class'SHGame.DeathLily'
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
     DeathTypeName(0)=stateFaint
     DeathTypeName(1)=stateFaint
     DeathTypeName(2)=stateStagger
     DeathTypeName(3)=stateStagger
     DeathTypeName(4)=stateStagger
     DeathTypeName(5)=stateStretch
     DeathTypeName(6)=stateStretch
     DeathTypeName(7)=stateDrill
     DeathTypeName(8)=stateDrill
     ControllerClass=Class'SHGame.PeasantPreCombatController'
     Mesh=SkeletalMesh'ShrekCharacters.Peasant'
     CollisionRadius=29.000000
     CollisionHeight=33.000000
	 bAlignBottom=False
}
