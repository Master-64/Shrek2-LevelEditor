//================================================================================
// ShrekHuman.
//================================================================================

class ShrekHuman extends ShHeroPawn
  Config(User);

var ShrekSword Sword;
var string PrevCreature;
var() name QuickThrowStartAnimName;
var() name QuickThrowLoopAnimName;
var() name QuickThrowEndAnimName;
var() name QuickThrowBoneName;
var bool bQuickThrowWasSpawn;
var int iFoodThrowInARow;
var(BossFGM) float ThrowTime;
var(BossFGM) float ThrowFoodTime;
var(BossFGM) float ThrowAccuracy;
var(BossFGM) float ThrowFoodAccuracy;
var(BossFGM) float ThrowProtection;
var(BossFGM) float LiveAsCreature;
var(BossFGM) Range FoodThrowInARow;
var() Material SwordSkin;
var() StaticMesh OriginalSwordStaticMesh;
var() StaticMesh PowerfulSwordStaticMesh;

function AddAnimNotifys()
{
}

function CreateRibbonEmittersForAttack1()
{
}

function CreateRibbonEmittersForAttack2()
{
}

function CreateRibbonEmittersForAttack3()
{
}

function bool IsProtected(Actor Enemy)
{
}

function bool InFrontOfFGM(Actor fgm)
{
}

function bool FGMTableClosest(Actor fgm)
{
}

function bool StartQuickThrow()
{
}

function SpawnQuickThrowActor()
{
}

function JumpFromShimmy()
{
}

function SetVisibleTextures()
{
}

function SetInvisibleTextures()
{
}

function ShowStrengthAttributes()
{
}

function HideStrengthAttributes()
{
}

function Vector GetRunAttackEmitterLocation()
{
}

defaultproperties
{
     QuickThrowStartAnimName="quickthrowstart"
     QuickThrowLoopAnimName="quickthrowloop"
     QuickThrowEndAnimName="QuickThrowIdle"
     QuickThrowBoneName="body_l_wrist_joint"
     ThrowTime=0.700000
     ThrowFoodTime=0.700000
     ThrowAccuracy=1.000000
     ThrowFoodAccuracy=1.000000
     ThrowProtection=1.000000
     LiveAsCreature=30.000000
     SwordSkin=Texture'Character_Props_tx.handsome_tx'
     OriginalSwordStaticMesh=StaticMesh'Character_Props.handsome_sword'
     PowerfulSwordStaticMesh=StaticMesh'Character_Props.hs_slapper'
     NewTag="Shrek"
     AttackMoveAhead=70.000000
     fxSwingingDeathClass=Class'SHGame.Handsome_plow'
     SHHeroName="ShrekHuman"
     NewRunAttackAnim="runattack"
     EndAttackAnim3="punch3end"
     ThrowPotionBoneName="body_l_wrist_joint"
     DrinkPotionBoneName="body_l_wrist_joint"
     ThrowOffset=(X=-3.000000,Y=6.000000,Z=2.000000)
     ThrowRotation=(Yaw=8192,Roll=-16384)
     DrinkOffset=(X=-3.000000,Y=6.000000,Z=2.000000)
     DrinkRotation=(Yaw=8192,Roll=-16384)
     SwingSounds(0)=Sound'Peasants.action_swoosh01'
     SwingSounds(1)=Sound'Peasants.action_swoosh02'
     SwingSounds(2)=Sound'Peasants.action_swoosh03'
     SwingSounds(3)=Sound'Peasants.action_swoosh04'
     SwingSounds(4)=Sound'Peasants.action_swoosh05'
     SwingSounds(5)=Sound'Peasants.action_swoosh06'
     SwingSounds(6)=Sound'Peasants.action_swoosh07'
     SwingSounds(7)=Sound'Peasants.action_swoosh08'
     SwingSounds(8)=Sound'Peasants.action_swoosh09'
     SwingSounds(9)=Sound'Peasants.action_swoosh10'
     SwingSounds(10)=Sound'Peasants.action_swoosh11'
     SwingSounds(11)=Sound'Peasants.action_swoosh12'
     Attack1Sounds(0)=Sound'Knights.sword_hit01'
     Attack1Sounds(1)=Sound'Knights.sword_hit02'
     Attack1Sounds(2)=Sound'Knights.sword_hit03'
     Attack1Sounds(3)=Sound'Knights.sword_hit04'
     Attack1Sounds(4)=Sound'Knights.sword_hit05'
     Attack1Sounds(5)=Sound'Knights.sword_hit06'
     Attack1Sounds(6)=Sound'Knights.sword_hit07'
     Attack1Sounds(7)=Sound'Knights.sword_hit08'
     Attack1Sounds(8)=Sound'Knights.sword_hit09'
     Attack1Sounds(9)=Sound'Knights.sword_hit10'
     Attack1Sounds(10)=Sound'Knights.sword_hit11'
     Attack2Sounds(0)=Sound'Knights.sword_hit01'
     Attack2Sounds(1)=Sound'Knights.sword_hit02'
     Attack2Sounds(2)=Sound'Knights.sword_hit03'
     Attack2Sounds(3)=Sound'Knights.sword_hit04'
     Attack2Sounds(4)=Sound'Knights.sword_hit05'
     Attack2Sounds(5)=Sound'Knights.sword_hit06'
     Attack2Sounds(6)=Sound'Knights.sword_hit07'
     Attack2Sounds(7)=Sound'Knights.sword_hit08'
     Attack2Sounds(8)=Sound'Knights.sword_hit09'
     Attack2Sounds(9)=Sound'Knights.sword_hit10'
     Attack2Sounds(10)=Sound'Knights.sword_hit11'
     Attack3Sounds(0)=Sound'Knights.sword_hit01'
     Attack3Sounds(1)=Sound'Knights.sword_hit02'
     Attack3Sounds(2)=Sound'Knights.sword_hit03'
     Attack3Sounds(3)=Sound'Knights.sword_hit04'
     Attack3Sounds(4)=Sound'Knights.sword_hit05'
     Attack3Sounds(5)=Sound'Knights.sword_hit06'
     Attack3Sounds(6)=Sound'Knights.sword_hit07'
     Attack3Sounds(7)=Sound'Knights.sword_hit08'
     Attack3Sounds(8)=Sound'Knights.sword_hit09'
     Attack3Sounds(9)=Sound'Knights.sword_hit10'
     Attack3Sounds(10)=Sound'Knights.sword_hit11'
     DyingSound=Sound'Shrek.faint'
     ThrowPotionSound=Sound'Shrek.HS_throw_potion'
     DrinkPotionSound=Sound'Shrek.HS_drink_potion'
     EmoteSoundJump(0)=Sound'AllDialog.pc_shk_ShrekEmote_21'
     EmoteSoundJump(1)=Sound'AllDialog.pc_shk_ShrekEmote_23'
     EmoteSoundJump(2)=Sound'AllDialog.pc_shk_ShrekEmote_27'
     EmoteSoundJump(3)=Sound'AllDialog.pc_shk_ShrekEmote_31'
     EmoteSoundJump(4)=Sound'AllDialog.pc_shk_ShrekEmote_17'
     EmoteSoundJump(5)=Sound'AllDialog.pc_shk_ShrekEmote_33'
     EmoteSoundJump(6)=Sound'AllDialog.pc_shk_ShrekEmote_89'
     EmoteSoundJump(7)=Sound'AllDialog.pc_shk_ShrekEmote_117'
     EmoteSoundLand(0)=Sound'AllDialog.pc_shk_ShrekEmote_65'
     EmoteSoundLand(1)=Sound'AllDialog.pc_shk_ShrekEmote_42'
     EmoteSoundLand(2)=Sound'AllDialog.pc_shk_ShrekEmote_44'
     EmoteSoundLand(3)=Sound'AllDialog.pc_shk_ShrekEmote_99'
     EmoteSoundLand(4)=Sound'AllDialog.pc_shk_ShrekEmote_74'
     EmoteSoundClimb(0)=Sound'AllDialog.pc_shk_ShrekEmote_57'
     EmoteSoundClimb(1)=Sound'AllDialog.pc_shk_ShrekEmote_115'
     EmoteSoundClimb(2)=Sound'AllDialog.pc_shk_ShrekEmote_105'
     EmoteSoundClimb(3)=Sound'AllDialog.pc_shk_ShrekEmote_95'
     EmoteSoundClimb(4)=Sound'AllDialog.pc_shk_ShrekEmote_97'
     EmoteSoundClimb(5)=Sound'AllDialog.pc_shk_ShrekEmote_92'
     EmoteSoundClimb(6)=Sound'AllDialog.pc_shk_ShrekEmote_77'
     EmoteSoundClimb(7)=Sound'AllDialog.pc_shk_ShrekEmote_93'
     EmoteSoundPain(0)=Sound'AllDialog.pc_shk_ShrekEmote_5'
     EmoteSoundPain(1)=Sound'AllDialog.pc_shk_ShrekEmote_7'
     EmoteSoundPain(2)=Sound'AllDialog.pc_shk_ShrekEmote_9'
     EmoteSoundPain(3)=Sound'AllDialog.pc_shk_ShrekEmote_19'
     EmoteSoundPain(4)=Sound'AllDialog.pc_shk_ShrekEmote_13'
     EmoteSoundPain(5)=Sound'AllDialog.pc_shk_ShrekEmote_11'
     EmoteSoundPain(6)=Sound'AllDialog.pc_shk_ShrekEmote_63'
     EmoteSoundPain(7)=Sound'AllDialog.pc_shk_ShrekEmote_50'
     EmoteSoundPain(8)=Sound'AllDialog.pc_shk_ShrekEmote_46'
     EmoteSoundPain(9)=Sound'AllDialog.pc_shk_ShrekEmote_51'
     EmoteSoundPain(10)=Sound'AllDialog.pc_shk_ShrekEmote_101'
     EmoteSoundPain(11)=Sound'AllDialog.pc_shk_ShrekEmote_103'
     EmoteSoundPain(12)=Sound'AllDialog.pc_shk_ShrekEmote_73'
     EmoteSoundPain(13)=Sound'AllDialog.pc_shk_ShrekEmote_75'
     EmoteSoundPunch(0)=Sound'AllDialog.pc_shk_ShrekEmote_29'
     EmoteSoundPunch(1)=Sound'AllDialog.pc_shk_ShrekEmote_59'
     EmoteSoundPunch(2)=Sound'AllDialog.pc_shk_ShrekEmote_55'
     EmoteSoundPunch(3)=Sound'AllDialog.pc_shk_ShrekEmote_53'
     EmoteSoundPunch(4)=Sound'AllDialog.pc_shk_ShrekEmote_49'
     EmoteSoundPunch(5)=Sound'AllDialog.pc_shk_ShrekEmote_47'
     EmoteSoundPunch(6)=Sound'AllDialog.pc_shk_ShrekEmote_25'
     EmoteSoundPunch(7)=Sound'AllDialog.pc_shk_ShrekEmote_15'
     EmoteSoundPunch(8)=Sound'AllDialog.pc_shk_ShrekEmote_113'
     EmoteSoundPunch(9)=Sound'AllDialog.pc_shk_ShrekEmote_111'
     EmoteSoundPunch(10)=Sound'AllDialog.pc_shk_ShrekEmote_109'
     EmoteSoundPunch(11)=Sound'AllDialog.pc_shk_ShrekEmote_107'
     EmoteSoundPull(0)=Sound'AllDialog.pc_shk_ShrekEmote_89'
     EmoteSoundPull(1)=Sound'AllDialog.pc_shk_ShrekEmote_92'
     EmoteSoundPull(2)=Sound'AllDialog.pc_shk_ShrekEmote_93'
     EmoteSoundShimmy(0)=Sound'AllDialog.pc_shk_ShrekEmote_95'
     EmoteSoundShimmy(1)=Sound'AllDialog.pc_shk_ShrekEmote_97'
     EmoteSoundShimmy(2)=Sound'AllDialog.pc_shk_ShrekEmote_99'
     EmoteSoundShimmy(3)=Sound'AllDialog.pc_shk_ShrekEmote_101'
     EmoteSoundShimmy(4)=Sound'AllDialog.pc_shk_ShrekEmote_103'
     EmoteSoundShimmy(5)=Sound'AllDialog.pc_shk_ShrekEmote_105'
     EmoteSoundThrow(0)=Sound'AllDialog.pc_shk_ShrekEmote_107'
     EmoteSoundThrow(1)=Sound'AllDialog.pc_shk_ShrekEmote_109'
     EmoteSoundThrow(2)=Sound'AllDialog.pc_shk_ShrekEmote_111'
     EmoteSoundThrow(3)=Sound'AllDialog.pc_shk_ShrekEmote_113'
     EmoteSoundThrow(4)=Sound'AllDialog.pc_shk_ShrekEmote_115'
     EmoteSoundThrow(5)=Sound'AllDialog.pc_shk_ShrekEmote_117'
     EmoteSoundFaint(0)=Sound'AllDialog.pc_shk_ShrekEmote_61'
     EmoteSoundFaint(1)=Sound'AllDialog.pc_shk_ShrekEmote_79'
     EmoteSoundFaint(2)=Sound'AllDialog.pc_shk_ShrekEmote_81'
     EmoteSoundFaint(3)=Sound'AllDialog.pc_shk_ShrekEmote_85'
     EmoteSoundFaint(4)=Sound'AllDialog.pc_shk_ShrekEmote_86'
     EmoteSoundFaint(5)=Sound'AllDialog.pc_shk_ShrekEmote_87'
     EmoteSoundFaint(6)=Sound'AllDialog.pc_shk_ShrekEmote_72'
     EmoteSoundFaint(7)=Sound'AllDialog.pc_shk_ShrekEmote_67'
     SoundShimmy(0)=Sound'Shrek.shrek_shimmy'
     SoundShimmy(1)=Sound'Shrek.shrek_shimmy2'
     SoundThrow(0)=Sound'Shrek.throw'
     DoubleJumpSound(0)=Sound'Shrek.jump_double'
     AttackStartBoneNames(0)="body_swordribbon_joint"
     AttackStartBoneNames(1)="body_swordribbon_joint"
     AttackStartBoneNames(2)="body_swordribbon_joint"
     AttackStartBoneNames(3)="body_swordribbon_joint"
     AttackEndBoneNames(0)="body_swordhand_joint"
     AttackEndBoneNames(1)="body_swordhand_joint"
     AttackEndBoneNames(2)="body_swordhand_joint"
     AttackEndBoneNames(3)="body_swordhand_joint"
     RibbonEmitterName=Class'SHGame.Hero_Ribbon'
     TexName=Texture'ShCharacters.Handsome_blur'
     PowerfulTexName=Texture'ShCharacters.Handsome_strength_blur'
     KnockBackDistance=30.000000
     SkinsVisible(0)=Texture'ShCharacters.handsome_tx'
     SkinsInvisible(0)=Texture'ShCharacters.handsome_inv'
     StrengthEmitterBoneName(0)="body_swordribbon_joint"
     RunAttackEmitterName=Class'SHGame.Shrek_Slide'
     PotionBumpLines(0)="SHK_ShrekStrength"
     PotionBumpLines(1)="SHK_ShrekFrog"
     PotionBumpLines(2)="SHK_ShrekGhost"
     PotionBumpLines(3)="SHK_ShrekSleep"
     PotionBumpLines(4)="SHK_ShrekStink"
     PotionBumpLines(5)="SHK_ShrekShrinkMe"
     PotionBumpLines(6)="SHK_ShrekShrinkYou"
     PotionBumpLines(7)="SHK_ShrekFreeze"
     PotionBumpLines(8)="SHK_ShrekLove"
     WastedPotionBumpLines="SHK_ShrekWaste"
     HurtBumpLines="SHK_HandsomeHurt"
     HitBumpLines="SHK_HandsomeHit"
     SimmyBumpLines="SHK_Shimmy"
     PickupEnergyBarBumpLines="SHK_ShrekHero"
     PickupShamrockBumpLines="SHK_ShrekClover"
     LowCoinsBumpLines="SHK_ShrekCoinLow"
     ManyCoinsBumpLines="SHK_ShrekCoin"
     TiredBumpLines="SHK_ShrekLowHealth"
     FootstepsWade(0)=Sound'Footsteps.F_shrek_wading01'
     FootstepsWade(1)=Sound'Footsteps.F_shrek_wading02'
     FootstepsWade(2)=Sound'Footsteps.F_shrek_wading03'
     FootstepsWade(3)=Sound'Footsteps.F_shrek_wading04'
     FootstepsWade(4)=Sound'Footsteps.F_shrek_wading05'
     FootstepsWade(5)=Sound'Footsteps.F_shrek_wading06'
     AttackDist=60.000000
     AttackHeight=60.000000
     AttackAngle=60.000000
     WadeAnims(0)="Walk"
     WadeAnims(1)="walkbackwards"
     WadeAnims(2)="walkleft"
     WadeAnims(3)="walkright"
     AttackInfo(0)=(AnimName="punch1",StartBoneName="body_swordhand_joint",EndBoneName="body_swordribbon_joint",StartFrame=6,EndFrame=12)
     AttackInfo(1)=(AnimName="punch2",StartBoneName="body_swordhand_joint",EndBoneName="body_swordribbon_joint",StartFrame=3,EndFrame=7)
     AttackInfo(2)=(AnimName="punch3",StartBoneName="body_swordhand_joint",EndBoneName="body_swordribbon_joint",StartFrame=8,EndFrame=12)
     AttackInfo(3)=(AnimName="punch3",StartBoneName="body_swordhand_joint",EndBoneName="body_swordribbon_joint",StartFrame=1,EndFrame=24)
     AttackInfo(4)=(AnimName="runattack",StartBoneName="body_swordhand_joint",EndBoneName="body_swordribbon_joint",StartFrame=1,EndFrame=24)
     PunchEmitterClass=Class'SHGame.Punch_Shrek'
     AttackDistFromEnemy=40.000000
     CameraSetStandard=(vLookAtOffset=(X=-15,Y=0,Z=65),fLookAtDistance=170,fLookAtHeight=30,fRotTightness=8,fRotSpeed=8,fMoveTightness=(X=25,Y=40,Z=40),fMoveSpeed=0,fMaxMouseDeltaX=190,fMaxMouseDeltaY=65,fMinPitch=-10000,fMaxPitch=10000)
     CameraSnapRotationPitch=-3500.000000
     DefaultPlayerControllerClass=Class'SHGame.ShrekController'
     WalkAnims(1)="walkbackwards"
     LandAnims(0)="jumptostand"
     LandAnims(1)="jumptorun"
     BigClimbStartNoTrans="jumptoclimb2"
     BigClimbEndNoTrans="climb2"
     BigClimbStartOffset=155.000000
     BigClimbOffset=110.000000
     BigShimmyOffset=105.000000
     HangIdleNoTransAnim="hangidle2"
     JumpToHangNoTransAnim="jumptohang2"
     ShimmyRightNoTransAnim="shimmyright2"
     ShimmyLeftNoTransAnim="shimmyleft2"
     ShimmyRightEndNoTransAnim="shimmyrightend2"
     ShimmyLeftEndNoTransAnim="shimmyleftend2"
     IdleTiredAnimName="tired_idle"
     PickupAnimName="Pickup"
     ThrowAnimName="throw"
     KnockBackAnimName="knockback"
     PickupBoneName="body_object_joint"
     NeckRotElement=RE_RollNeg
     HeadRotElement=RE_YawNeg
     JumpSounds(0)=Sound'Shrek.Jump'
     LandingStone(0)=Sound'Shrek.land'
     LandingWood(0)=Sound'Shrek.land'
     LandingWet(0)=Sound'Shrek.land'
     LandingGrass(0)=Sound'Shrek.land'
     LandingDirt(0)=Sound'Shrek.land'
     LandingHay(0)=Sound'Shrek.land'
     LandingLeaf(0)=Sound'Shrek.land'
     LandingSand(0)=Sound'Shrek.land'
     LandingMud(0)=Sound'Shrek.land'
     LandingNone(0)=Sound'Shrek.land'
     FootstepsStone(0)=Sound'Footsteps.F_shrek_stone01'
     FootstepsStone(1)=Sound'Footsteps.F_shrek_stone02'
     FootstepsStone(2)=Sound'Footsteps.F_shrek_stone03'
     FootstepsStone(3)=Sound'Footsteps.F_shrek_stone04'
     FootstepsStone(4)=Sound'Footsteps.F_shrek_stone05'
     FootstepsStone(5)=Sound'Footsteps.F_shrek_stone06'
     FootstepsWood(0)=Sound'Footsteps.F_shrek_wood01'
     FootstepsWood(1)=Sound'Footsteps.F_shrek_wood02'
     FootstepsWood(2)=Sound'Footsteps.F_shrek_wood03'
     FootstepsWood(3)=Sound'Footsteps.F_shrek_wood04'
     FootstepsWood(4)=Sound'Footsteps.F_shrek_wood05'
     FootstepsWood(5)=Sound'Footsteps.F_shrek_wood06'
     FootstepsWet(0)=Sound'Footsteps.F_shrek_water01'
     FootstepsWet(1)=Sound'Footsteps.F_shrek_water02'
     FootstepsWet(2)=Sound'Footsteps.F_shrek_water03'
     FootstepsWet(3)=Sound'Footsteps.F_shrek_water04'
     FootstepsWet(4)=Sound'Footsteps.F_shrek_water05'
     FootstepsWet(5)=Sound'Footsteps.F_shrek_water06'
     FootstepsGrass(0)=Sound'Footsteps.F_shrek_grass01'
     FootstepsGrass(1)=Sound'Footsteps.F_shrek_grass02'
     FootstepsGrass(2)=Sound'Footsteps.F_shrek_grass03'
     FootstepsGrass(3)=Sound'Footsteps.F_shrek_grass04'
     FootstepsGrass(4)=Sound'Footsteps.F_shrek_grass05'
     FootstepsGrass(5)=Sound'Footsteps.F_shrek_grass06'
     FootstepsMetal(0)=Sound'Footsteps.F_shrek_metal01'
     FootstepsMetal(1)=Sound'Footsteps.F_shrek_metal02'
     FootstepsMetal(2)=Sound'Footsteps.F_shrek_metal03'
     FootstepsMetal(3)=Sound'Footsteps.F_shrek_metal04'
     FootstepsMetal(4)=Sound'Footsteps.F_shrek_metal05'
     FootstepsMetal(5)=Sound'Footsteps.F_shrek_metal06'
     FootstepsDirt(0)=Sound'Footsteps.F_shrek_dirt01'
     FootstepsDirt(1)=Sound'Footsteps.F_shrek_dirt02'
     FootstepsDirt(2)=Sound'Footsteps.F_shrek_dirt03'
     FootstepsDirt(3)=Sound'Footsteps.F_shrek_dirt04'
     FootstepsDirt(4)=Sound'Footsteps.F_shrek_dirt05'
     FootstepsDirt(5)=Sound'Footsteps.F_shrek_dirt06'
     FootstepsHay(0)=Sound'Footsteps.F_shrek_grass01'
     FootstepsHay(1)=Sound'Footsteps.F_shrek_grass02'
     FootstepsHay(2)=Sound'Footsteps.F_shrek_grass03'
     FootstepsHay(3)=Sound'Footsteps.F_shrek_grass04'
     FootstepsLeaf(0)=Sound'Footsteps.F_shrek_leaf01'
     FootstepsLeaf(1)=Sound'Footsteps.F_shrek_leaf02'
     FootstepsLeaf(2)=Sound'Footsteps.F_shrek_leaf03'
     FootstepsLeaf(3)=Sound'Footsteps.F_shrek_leaf04'
     FootstepsLeaf(4)=Sound'Footsteps.F_shrek_leaf05'
     FootstepsLeaf(5)=Sound'Footsteps.F_shrek_leaf06'
     FootstepsNone(0)=Sound'Footsteps.F_shrek_stone01'
     FootstepsNone(1)=Sound'Footsteps.F_shrek_stone02'
     FootstepsNone(2)=Sound'Footsteps.F_shrek_stone03'
     FootstepsNone(3)=Sound'Footsteps.F_shrek_stone04'
     FootstepsNone(4)=Sound'Footsteps.F_shrek_stone05'
     FootstepsNone(5)=Sound'Footsteps.F_shrek_stone06'
     FootFramesWalk(0)=4
     FootFramesWalk(1)=19
     FootFramesWalk(2)=33
     FootFramesWalk(3)=49
     FootFramesRun(0)=5
     FootFramesRun(1)=20
     FootFramesRun(2)=35
     FootFramesRun(3)=50
     bUseNewMountCode=True
	 IdleAnims(0)="bored1"
	 IdleAnims(1)="bored1"
	 IdleAnims(2)="bored1"
	 IdleAnims(3)="bored1"
	 IdleAnims(4)="bored2"
	 IdleAnims(5)="bored2"
	 IdleAnims(6)="bored2"
	 IdleAnims(7)="bored2"
	 bIsMainPlayer=True
     ControllerClass=Class'SHGame.SHCompanionController'
     TurnLeftAnim="TurnLeft"
     TurnRightAnim="TurnRight"
     Mesh=SkeletalMesh'ShrekCharacters.humanshrek'
     CollisionRadius=15.000000
     CollisionHeight=38.000000
	 Label="Human"
}
