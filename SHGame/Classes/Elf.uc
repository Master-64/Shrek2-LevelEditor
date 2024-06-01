//================================================================================
// Elf.
//================================================================================

class Elf extends ShEnemy
  Config(User);

var(Enemy) name KnockFrontAnimName;
var(Enemy) name TurnAnimName;
var(Enemy) name AttackStartAnimName;
var(Enemy) bool bInShower;
var(Enemy) float ZDistance;
var(sounds) array<Sound> sfxRubber;
var(sounds) array<Sound> sfxBodyFall;
var(Enemy) bool bSeeEverywhere;
var float savedZ;

function AddAnimNotifys()
{
}

function AnimSfxRubber()
{
}

function AnimSfxBodyFall()
{
}

function GetBumpSets()
{
}

function stepback(float Amount, float Time)
{
}

function bool HeroLevelWithEnemy()
{
}

function GetNextWorkAnim()
{
}

function GetCurrentWorkAnim(string anim)
{
}

defaultproperties
{
     TurnAnimName="Turn"
     AttackStartAnimName="punch_start"
     ZDistance=15.000000
     sfxRubber(0)=Sound'Elves.HazMat_rubber01'
     sfxRubber(1)=Sound'Elves.HazMat_rubber02'
     sfxRubber(2)=Sound'Elves.HazMat_rubber03'
     sfxRubber(3)=Sound'Elves.HazMat_rubber04'
     sfxRubber(4)=Sound'Elves.HazMat_rubber05'
     sfxRubber(5)=Sound'Elves.HazMat_rubber06'
     sfxRubber(6)=Sound'Elves.HazMat_rubber07'
     sfxRubber(7)=Sound'Elves.HazMat_rubber08'
     sfxRubber(8)=Sound'Elves.HazMat_rubber09'
     sfxRubber(9)=Sound'Elves.HazMat_rubber10'
     sfxBodyFall(0)=Sound'Elves.HazMat_bodyfall01'
     sfxBodyFall(1)=Sound'Elves.HazMat_bodyfall02'
     sfxBodyFall(2)=Sound'Elves.HazMat_bodyfall03'
     sfxBodyFall(3)=Sound'Elves.HazMat_bodyfall04'
     sfxAttackEffort(0)=Sound'AllDialog.pc_elf_ElfRam_12'
     sfxAttackEffort(1)=Sound'AllDialog.pc_elf_ElfRam_10'
     sfxAttackEffort(2)=Sound'AllDialog.pc_elf_ElfRam_8'
     sfxAttackEffort(3)=Sound'AllDialog.pc_elf_ElfRam_6'
     sfxAttackEffort(4)=Sound'AllDialog.pc_elf_ElfRam_4'
     sfxOuch(0)=Sound'AllDialog.pc_elf_ElfOuch_2'
     sfxOuch(1)=Sound'AllDialog.pc_elf_ElfOuch_4'
     sfxOuch(2)=Sound'AllDialog.pc_elf_ElfOuch_6'
     sfxOuch(3)=Sound'AllDialog.pc_elf_ElfOuch_8'
     sfxOuch(4)=Sound'AllDialog.pc_elf_ElfOuch_10'
     sfxOuch(5)=Sound'AllDialog.pc_elf_ElfOuch_12'
     sfxFaint(0)=Sound'AllDialog.pc_elf_ElfOuch_2'
     sfxFaint(1)=Sound'AllDialog.pc_elf_ElfOuch_4'
     sfxFaint(2)=Sound'AllDialog.pc_elf_ElfOuch_6'
     sfxFaint(3)=Sound'AllDialog.pc_elf_ElfOuch_8'
     sfxFaint(4)=Sound'AllDialog.pc_elf_ElfOuch_10'
     sfxFaint(5)=Sound'AllDialog.pc_elf_ElfOuch_12'
     LoadString="ShrekCharacters.HazmatElf"
     RandSkins(0)=Texture'ShCharacters.HazMat1'
     RandSkins(1)=Texture'ShCharacters.HazMat2'
     RandSkins(2)=Texture'ShCharacters.HazMat3'
     RandSkins(3)=Texture'ShCharacters.HazMat4'
     RandSkins(4)=Texture'ShCharacters.HazMat5'
     RandSkins(5)=Texture'ShCharacters.HazMat6'
     WorkAnimName(0)="Talk1"
     WorkAnimName(1)="Talk2"
     WorkAnimName(2)="Talk3"
     WorkAnimName(3)="Read"
     WorkAnimName(4)="HeavyBreathe"
     WorkAnimName(5)="WashHands"
     WorkAnimName(6)="OpenLocker"
     WorkAnimName(7)="TurnWheel"
     WorkAnimName(8)="Ponder"
     ShrunkAnimName="ponder"
     HoleInGroundClass=Class'SHGame.HazMatSplat'
     TinyAttackSquishClass=Class'SHGame.HazMatSplatSmall'
     SkinFreeze=FinalBlend'ShCharacters.hazmat_ice'
     LoveTransAnimName="lovetrans"
     LoveIdleAnimName="loveidle"
     LoveWalkAnimName="loverun"
     sleepBeginAnimName="sleep1start"
     sleepLoopAnimName="sleeploop1"
     sleepEndAnimName="sleep1end"
     WhereAnimName="invisible_react"
     stinkBeginAnimName="stinky_start"
     stinkLoopAnimName="stinky_loop"
     stinkEndAnimName="stinky_end"
     DeathTypeName(0)="stateFaint"
     DeathTypeName(1)="stateFaint"
     DeathTypeName(2)="stateFaint"
     DeathTypeName(3)="stateFaint"
     DeathTypeName(4)="stateFaint"
     DeathTypeName(5)="stateFaint"
     DeathTypeName(6)="stateFaint"
     DeathTypeName(7)="stateSpecialAttack"
     DeathTypeName(8)="stateSpecialAttack"
     FootstepsStone(0)=Sound'Footsteps.F_hazmat_stone1'
     FootstepsStone(1)=Sound'Footsteps.F_hazmat_stone2'
     FootstepsStone(2)=Sound'Footsteps.F_hazmat_stone3'
     FootstepsStone(3)=Sound'Footsteps.F_hazmat_stone4'
     FootstepsStone(4)=Sound'Footsteps.F_hazmat_stone5'
     FootstepsStone(5)=Sound'Footsteps.F_hazmat_stone6'
     FootstepsWood(0)=Sound'Footsteps.F_hazmat_wood1'
     FootstepsWood(1)=Sound'Footsteps.F_hazmat_wood2'
     FootstepsWood(2)=Sound'Footsteps.F_hazmat_wood3'
     FootstepsWood(3)=Sound'Footsteps.F_hazmat_wood4'
     FootstepsWood(4)=Sound'Footsteps.F_hazmat_wood5'
     FootstepsWood(5)=Sound'Footsteps.F_hazmat_wood6'
     FootstepsWet(0)=Sound'Footsteps.F_hazmat_wet1'
     FootstepsWet(1)=Sound'Footsteps.F_hazmat_wet2'
     FootstepsWet(2)=Sound'Footsteps.F_hazmat_wet3'
     FootstepsWet(3)=Sound'Footsteps.F_hazmat_wet4'
     FootstepsWet(4)=Sound'Footsteps.F_hazmat_wet5'
     FootstepsWet(5)=Sound'Footsteps.F_hazmat_wet6'
     FootstepsGrass(0)=Sound'Footsteps.F_hazmat_default1'
     FootstepsGrass(1)=Sound'Footsteps.F_hazmat_default2'
     FootstepsGrass(2)=Sound'Footsteps.F_hazmat_default3'
     FootstepsGrass(3)=Sound'Footsteps.F_hazmat_default4'
     FootstepsGrass(4)=Sound'Footsteps.F_hazmat_default5'
     FootstepsGrass(5)=Sound'Footsteps.F_hazmat_default6'
     FootstepsDirt(0)=Sound'Footsteps.F_hazmat_dirt1'
     FootstepsDirt(1)=Sound'Footsteps.F_hazmat_dirt2'
     FootstepsDirt(2)=Sound'Footsteps.F_hazmat_dirt3'
     FootstepsDirt(3)=Sound'Footsteps.F_hazmat_dirt4'
     FootstepsDirt(4)=Sound'Footsteps.F_hazmat_dirt5'
     FootstepsDirt(5)=Sound'Footsteps.F_hazmat_dirt6'
     FootstepsMud(0)=Sound'Footsteps.F_hazmat_default1'
     FootstepsMud(1)=Sound'Footsteps.F_hazmat_default2'
     FootstepsMud(2)=Sound'Footsteps.F_hazmat_default3'
     FootstepsMud(3)=Sound'Footsteps.F_hazmat_default4'
     FootstepsMud(4)=Sound'Footsteps.F_hazmat_default5'
     FootstepsMud(5)=Sound'Footsteps.F_hazmat_default6'
     FootstepsNone(0)=Sound'Footsteps.F_hazmat_default1'
     FootstepsNone(1)=Sound'Footsteps.F_hazmat_default2'
     FootstepsNone(2)=Sound'Footsteps.F_hazmat_default3'
     FootstepsNone(3)=Sound'Footsteps.F_hazmat_default4'
     FootstepsNone(4)=Sound'Footsteps.F_hazmat_default5'
     FootstepsNone(5)=Sound'Footsteps.F_hazmat_default6'
     ControllerClass=Class'SHGame.ShEnemyController'
     Mesh=SkeletalMesh'ShrekCharacters.hazmatelf'
     CollisionRadius=30.000000
     CollisionHeight=30.000000
}
