//================================================================================
// Knight.
//================================================================================

class Knight extends ShEnemy
  Config(User);

function SetFXLocation(Vector V)
{
}

function SetFXRotation(Rotator R)
{
}

function GetNextWorkAnim()
{
}

function GetCurrentWorkAnim(string anim)
{
}

function GetRandomCheer()
{
}

function GetBumpSets()
{
}

defaultproperties
{
     DamageAmount=15.000000
     CombatSpeed=300.000000
     CombatController=Class'SHGame.KnightCombatController'
     PreCombatController=Class'SHGame.KnightPreCombatController'
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
     sfxFaint(0)=Sound'AllDialog.pc_pst_Peasants_2'
     sfxFaint(1)=Sound'AllDialog.pc_pst_Peasants_4'
     sfxFaint(2)=Sound'AllDialog.pc_pst_Peasants_6'
     sfxFaint(3)=Sound'AllDialog.pc_pst_Peasants_8'
     sfxFaint(4)=Sound'AllDialog.pc_pst_Peasants_10'
     sfxFaint(5)=Sound'AllDialog.pc_pst_Peasants_12'
     sfxFaint(6)=Sound'AllDialog.pc_pst_Peasants_14'
     LoadString="ShrekCharacters.Knight"
     ShrunkAnimName="swordidle"
     HoleInGroundClass=Class'SHGame.Hubcap'
     TinyAttackSquishClass=Class'SHGame.HubcapSmall'
     SkinFreeze=FinalBlend'ShCharacters.knight_ice'
     SkinFreeze2=FinalBlend'ShCharacters.knight_ice'
     LoveTransAnimName="lovetrans"
     LoveIdleAnimName="loveidle"
     LoveWalkAnimName="loverun"
     sleepBeginAnimName="nightynight_start"
     sleepLoopAnimName="nightynight_loop"
     sleepEndAnimName="nightynight_end"
     WhereAnimName="knightinvisible_react"
     stinkBeginAnimName="knightstinky_start"
     stinkLoopAnimName="knightstinky_loop"
     stinkEndAnimName="knightstinky_end"
     FootstepsStone(0)=Sound'Knights.move01'
     FootstepsStone(1)=Sound'Knights.move02'
     FootstepsStone(2)=Sound'Knights.move03'
     FootstepsStone(3)=Sound'Knights.move04'
     FootstepsStone(4)=Sound'Knights.move05'
     FootstepsStone(5)=Sound'Knights.move06'
     FootstepsStone(6)=Sound'Knights.move07'
     FootstepsStone(7)=Sound'Knights.move08'
     FootstepsWood(0)=Sound'Knights.move01'
     FootstepsWood(1)=Sound'Knights.move02'
     FootstepsWood(2)=Sound'Knights.move03'
     FootstepsWood(3)=Sound'Knights.move04'
     FootstepsWood(4)=Sound'Knights.move05'
     FootstepsWood(5)=Sound'Knights.move06'
     FootstepsWood(6)=Sound'Knights.move07'
     FootstepsWood(7)=Sound'Knights.move08'
     FootstepsMetal(0)=Sound'Knights.move01'
     FootstepsMetal(1)=Sound'Knights.move02'
     FootstepsMetal(2)=Sound'Knights.move03'
     FootstepsMetal(3)=Sound'Knights.move04'
     FootstepsMetal(4)=Sound'Knights.move05'
     FootstepsMetal(5)=Sound'Knights.move06'
     FootstepsMetal(6)=Sound'Knights.move07'
     FootstepsMetal(7)=Sound'Knights.move08'
     FootstepsNone(0)=Sound'Knights.move01'
     FootstepsNone(1)=Sound'Knights.move02'
     FootstepsNone(2)=Sound'Knights.move03'
     FootstepsNone(3)=Sound'Knights.move04'
     FootstepsNone(4)=Sound'Knights.move05'
     FootstepsNone(5)=Sound'Knights.move06'
     FootstepsNone(6)=Sound'Knights.move07'
     FootstepsNone(7)=Sound'Knights.move08'
     FootFramesRun(0)=9
     FootFramesRun(1)=22
     FootFramesRun(2)=35
     FootFramesRun(3)=51
     bDirectHitWall=True
     Health=5
     ControllerClass=Class'SHGame.KnightPreCombatController'
     Mesh=SkeletalMesh'ShrekCharacters.Knight'
     CollisionRadius=26.000000
     CollisionHeight=33.000000
	 bAlignBottom=False
}
