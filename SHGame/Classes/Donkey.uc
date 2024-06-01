//================================================================================
// Donkey.
//================================================================================

class Donkey extends ShHeroPawn
  Config(User);

var() int TotalGameStateTokens;
var() int GameStateTokenLen;
var(GameState) const editconst string GameStateMasterList;
var(GameState) travel string CurrentGameState;
var(sounds) array<Sound> SoundKickThrow;
var(sounds) array<Sound> SoundSpin;
var() name LowLipBoneName;
var() Class<Emitter> GrassGrazeEmitter;
var DonkeyHelmet DHelmet;
var() name DonkeyREStartBoneNames[4];
var name DonkeyREEndBoneNames[4];
var Emitter DonkeyREEffect[4];

function DestroySpecialRibbonEmitters()
{
}

function CreateSpecialRibbonEmitters()
{
}

function AddAnimNotifys()
{
}

function KillEverybody()
{
}

function PlayGrassGrazeEmitter()
{
}

function PlayKickThrowingSound()
{
}

function PlaySpinSound()
{
}

function OnEvent(name EventName)
{
}

function ShowStrengthAttributes()
{
}

function HideStrengthAttributes()
{
}

defaultproperties
{
     SoundKickThrow(0)=Sound'Donkey.land'
     SoundSpin(0)=Sound'Donkey.spin_punch'
     LowLipBoneName="body_midbottomlip_joint"
     GrassGrazeEmitter=Class'SHGame.Grass_Graze'
     DonkeyREStartBoneNames(0)="body_l_foot_joint"
     DonkeyREStartBoneNames(1)="body_r_foot_joint"
     DonkeyREStartBoneNames(2)="body_l_hoof_joint"
     DonkeyREStartBoneNames(3)="body_r_hoof_joint"
     AttackMoveAhead=75.000000
     fxSwingingDeathClass=Class'SHGame.Donkey_plow'
     SHHeroName="Donkey"
     NewRunAttackAnim="runattack"
     ContinueAirAttackAnim="jumpattacktopunch1"
     UpEndBackAnim="UpEndBackward"
     LookAroundAnims(0)="lookaround1"
     LookAroundAnims(1)="lookaround2"
     LookAroundAnims(2)="lookaround3"
     ThrowPotionBoneName="body_object_joint"
     DrinkPotionBoneName="body_object_joint"
     ThrowOffset=(Y=3.000000)
     ThrowRotation=(Roll=-16384)
     DrinkOffset=(Y=3.000000)
     DrinkRotation=(Roll=-16384)
     SwingSounds(0)=Sound'Steed.ambience.swoosh_01'
     SwingSounds(1)=Sound'Steed.ambience.swoosh_02'
     SwingSounds(2)=Sound'Steed.ambience.swoosh_01'
     SwingSounds(3)=Sound'Steed.ambience.swoosh_02'
     SwingSounds(4)=Sound'Steed.ambience.swoosh_01'
     SwingSounds(5)=Sound'Steed.ambience.swoosh_02'
     SwingSounds(6)=Sound'Donkey.donkey_emote01'
     SwingSounds(7)=Sound'Donkey.donkey_emote02'
     RunAttackSounds(0)=Sound'Donkey.donkey_emote01'
     RunAttackSounds(1)=Sound'Donkey.donkey_emote02'
     Attack1Sounds(0)=Sound'Donkey.punch01'
     Attack2Sounds(0)=Sound'Donkey.punch02'
     Attack3Sounds(0)=Sound'Donkey.punch03'
     SpecialAttackSounds(0)=Sound'Donkey.punch03'
     DyingSound=Sound'Donkey.faint'
     ThrowPotionSound=Sound'Donkey.donkey_throw_potion'
     DrinkPotionSound=Sound'Donkey.donkey_drink_potion'
     EmoteSoundJump(0)=Sound'AllDialog.pc_dnk_donkeymote_30'
     EmoteSoundJump(1)=Sound'AllDialog.pc_dnk_donkeymote_38'
     EmoteSoundJump(2)=Sound'AllDialog.pc_dnk_donkeymote_20'
     EmoteSoundJump(3)=Sound'AllDialog.pc_dnk_donkeymote_22'
     EmoteSoundJump(4)=Sound'AllDialog.pc_dnk_donkeymote_10'
     EmoteSoundJump(5)=Sound'AllDialog.pc_dnk_donkeymote_102'
     EmoteSoundJump(6)=Sound'AllDialog.pc_dnk_donkeymote_104'
     EmoteSoundJump(7)=Sound'AllDialog.pc_dnk_donkeymote_92'
     EmoteSoundJump(8)=Sound'AllDialog.pc_dnk_donkeymote_80'
     EmoteSoundLand(0)=Sound'AllDialog.pc_dnk_donkeymote_50'
     EmoteSoundLand(1)=Sound'AllDialog.pc_dnk_donkeymote_28'
     EmoteSoundLand(2)=Sound'AllDialog.pc_dnk_donkeymote_24'
     EmoteSoundLand(3)=Sound'AllDialog.pc_dnk_donkeymote_8'
     EmoteSoundLand(4)=Sound'AllDialog.pc_dnk_donkeymote_86'
     EmoteSoundLand(5)=Sound'AllDialog.pc_dnk_donkeymote_106'
     EmoteSoundLand(6)=Sound'AllDialog.pc_dnk_donkeymote_88'
     EmoteSoundLand(7)=Sound'AllDialog.pc_dnk_donkeymote_84'
     EmoteSoundLand(8)=Sound'AllDialog.pc_dnk_donkeymote_66'
     EmoteSoundLand(9)=Sound'AllDialog.pc_dnk_donkeymote_91'
     EmoteSoundClimb(0)=Sound'AllDialog.pc_dnk_donkeymote_44'
     EmoteSoundClimb(1)=Sound'AllDialog.pc_dnk_donkeymote_46'
     EmoteSoundClimb(2)=Sound'AllDialog.pc_dnk_donkeymote_48'
     EmoteSoundClimb(3)=Sound'AllDialog.pc_dnk_donkeymote_114'
     EmoteSoundClimb(4)=Sound'AllDialog.pc_dnk_donkeymote_100'
     EmoteSoundClimb(5)=Sound'AllDialog.pc_dnk_donkeymote_94'
     EmoteSoundClimb(6)=Sound'AllDialog.pc_dnk_donkeymote_78'
     EmoteSoundClimb(7)=Sound'AllDialog.pc_dnk_donkeymote_72'
     EmoteSoundPain(0)=Sound'AllDialog.pc_dnk_donkeymote_36'
     EmoteSoundPain(1)=Sound'AllDialog.pc_dnk_donkeymote_2'
     EmoteSoundPain(2)=Sound'AllDialog.pc_dnk_donkeymote_32'
     EmoteSoundPain(3)=Sound'AllDialog.pc_dnk_donkeymote_16'
     EmoteSoundPain(4)=Sound'AllDialog.pc_dnk_donkeymote_14'
     EmoteSoundPain(5)=Sound'AllDialog.pc_dnk_donkeymote_34'
     EmoteSoundPain(6)=Sound'AllDialog.pc_dnk_donkeymote_98'
     EmoteSoundPain(7)=Sound'AllDialog.pc_dnk_donkeymote_58'
     EmoteSoundPain(8)=Sound'AllDialog.pc_dnk_donkeymote_82'
     EmoteSoundPain(9)=Sound'AllDialog.pc_dnk_donkeymote_76'
     EmoteSoundPain(10)=Sound'AllDialog.pc_dnk_donkeymote_116'
     EmoteSoundPunch(0)=Sound'AllDialog.pc_dnk_donkeymote_42'
     EmoteSoundPunch(1)=Sound'AllDialog.pc_dnk_donkeymote_12'
     EmoteSoundPunch(2)=Sound'AllDialog.pc_dnk_donkeymote_6'
     EmoteSoundPunch(3)=Sound'AllDialog.pc_dnk_donkeymote_4'
     EmoteSoundPunch(4)=Sound'AllDialog.pc_dnk_donkeymote_74'
     EmoteSoundPunch(5)=Sound'AllDialog.pc_dnk_donkeymote_70'
     EmoteSoundPunch(6)=Sound'AllDialog.pc_dnk_donkeymote_68'
     EmoteSoundPunch(7)=Sound'AllDialog.pc_dnk_donkeymote_64'
     EmoteSoundThrow(0)=Sound'AllDialog.pc_dnk_donkeymote_42'
     EmoteSoundThrow(1)=Sound'AllDialog.pc_dnk_donkeymote_12'
     EmoteSoundThrow(2)=Sound'AllDialog.pc_dnk_donkeymote_6'
     EmoteSoundThrow(3)=Sound'AllDialog.pc_dnk_donkeymote_4'
     EmoteSoundThrow(4)=Sound'AllDialog.pc_dnk_donkeymote_74'
     EmoteSoundThrow(5)=Sound'AllDialog.pc_dnk_donkeymote_70'
     EmoteSoundThrow(6)=Sound'AllDialog.pc_dnk_donkeymote_68'
     EmoteSoundThrow(7)=Sound'AllDialog.pc_dnk_donkeymote_64'
     EmoteSoundFaint(0)=Sound'AllDialog.pc_dnk_donkeymote_52'
     EmoteSoundFaint(1)=Sound'AllDialog.pc_dnk_donkeymote_40'
     EmoteSoundFaint(2)=Sound'AllDialog.pc_dnk_donkeymote_62'
     EmoteSoundFaint(3)=Sound'AllDialog.pc_dnk_donkeymote_26'
     EmoteSoundFaint(4)=Sound'AllDialog.pc_dnk_donkeymote_112'
     EmoteSoundFaint(5)=Sound'AllDialog.pc_dnk_donkeymote_110'
     EmoteSoundFaint(6)=Sound'AllDialog.pc_dnk_donkeymote_108'
     EmoteSoundFaint(7)=Sound'AllDialog.pc_dnk_donkeymote_96'
     EmoteSoundFaint(8)=Sound'AllDialog.pc_dnk_donkeymote_60'
     SoundThrow(0)=Sound'Donkey.throw'
     DoubleJumpSound(0)=Sound'Donkey.jump_double'
     FrontLeftBone="body_l_hoof_joint"
     FrontRightBone="body_r_hoof_joint"
     BackLeftBone="body_l_foot_joint"
     BackRightBone="body_r_foot_joint"
     RibbonEmitterName=Class'SHGame.Donkey_Spinblur'
     TexName=Texture'ShCharacters.Donkey_blur'
     KnockBackDistance=30.000000
     SkinsVisible(0)=Texture'ShCharacters.donkey2_tx'
     SkinsVisible(1)=Texture'ShCharacters.donkey_tx'
     SkinsInvisible(0)=Texture'ShCharacters.donkey2_inv'
     SkinsInvisible(1)=Texture'ShCharacters.donkey_inv'
     StrengthEmitterBoneName(0)="body_head_joint"
     PotionBumpLines(0)="DNK_DonkeyStrength"
     PotionBumpLines(1)="DNK_DonkeyFrog"
     PotionBumpLines(2)="DNK_DonkeyGhost"
     PotionBumpLines(3)="DNK_DonkeySleep"
     PotionBumpLines(4)="DNK_DonkeyStink"
     PotionBumpLines(5)="DNK_DonkeyShrinkMe"
     PotionBumpLines(6)="DNK_DonkeyShrinkYou"
     PotionBumpLines(7)="DNK_DonkeyFreeze"
     PotionBumpLines(8)="DNK_DonkeyLove"
     WastedPotionBumpLines="DNK_DonkeyWaste"
     HurtBumpLines="DNK_DonkeyHurt"
     HitBumpLines="DNK_DonkeyHit"
     PickupEnergyBarBumpLines="DNK_DonkeyHero"
     PickupShamrockBumpLines="DNK_DonkeyClover"
     LowCoinsBumpLines="DNK_DonkeyCoinLow"
     ManyCoinsBumpLines="DNK_DonkeyCoin"
     TiredBumpLines="DNK_DonkeyLowHealth"
     InWaterBumpLines="DNK_DonkeyWater"
     UPPER_BODY_BONE="body_spine1_joint"
     AttackDist=40.000000
     AttackHeight=40.000000
     AttackAngle=40.000000
     AttackInfo(0)=(AnimName="punch1",StartBoneName="body_l_earbase_joint",EndBoneName=None,StartFrame=1,EndFrame=7)
     AttackInfo(1)=(AnimName="punch1",StartBoneName="body_r_earbase_joint",EndBoneName=None,StartFrame=1,EndFrame=7)
     AttackInfo(2)=(AnimName="punch1",StartBoneName="body_l_brow1_joint",EndBoneName=None,StartFrame=1,EndFrame=7)
     AttackInfo(3)=(AnimName="punch1",StartBoneName="body_r_brow1_joint",EndBoneName=None,StartFrame=1,EndFrame=7)
     AttackInfo(4)=(AnimName="punch1",StartBoneName="body_l_brow2_joint",EndBoneName=None,StartFrame=1,EndFrame=7)
     AttackInfo(5)=(AnimName="punch1",StartBoneName="body_r_brow2_joint",EndBoneName=None,StartFrame=1,EndFrame=7)
     AttackInfo(6)=(AnimName="punch1",StartBoneName="body_teeth_joint",EndBoneName=None,StartFrame=1,EndFrame=7)
     AttackInfo(7)=(AnimName="punch3",StartBoneName="body_r_hoof_joint",EndBoneName=None,StartFrame=4,EndFrame=23)
     AttackInfo(8)=(AnimName="punch3",StartBoneName="body_l_hoof_joint",EndBoneName=None,StartFrame=4,EndFrame=23)
     AttackInfo(9)=(AnimName="punch3",StartBoneName="body_r_foot_joint",EndBoneName=None,StartFrame=4,EndFrame=23)
     AttackInfo(10)=(AnimName="punch3",StartBoneName="body_l_foot_joint",EndBoneName=None,StartFrame=4,EndFrame=23)
     AttackInfo(11)=(AnimName="punch3",StartBoneName="body_r_wrist_joint",EndBoneName="body_r_elbow_joint",StartFrame=4,EndFrame=23)
     AttackInfo(12)=(AnimName="punch3",StartBoneName="body_r_elbow_joint",EndBoneName="body_r_shoulder2_joint",StartFrame=4,EndFrame=23)
     AttackInfo(13)=(AnimName="punch3",StartBoneName="body_l_wrist_joint",EndBoneName="body_l_elbow_joint",StartFrame=4,EndFrame=23)
     AttackInfo(14)=(AnimName="punch3",StartBoneName="body_l_elbow_joint",EndBoneName="body_l_shoulder2_joint",StartFrame=4,EndFrame=23)
     AttackInfo(15)=(AnimName="punch3",StartBoneName="body_r_ankle_joint",EndBoneName="body_r_knee_joint",StartFrame=4,EndFrame=23)
     AttackInfo(16)=(AnimName="punch3",StartBoneName="body_r_knee_joint",EndBoneName="body_r_leg_joint",StartFrame=4,EndFrame=23)
     AttackInfo(17)=(AnimName="punch3",StartBoneName="body_l_ankle_joint",EndBoneName="body_l_knee_joint",StartFrame=4,EndFrame=23)
     AttackInfo(18)=(AnimName="punch3",StartBoneName="body_l_knee_joint",EndBoneName="body_l_leg_joint",StartFrame=4,EndFrame=23)
     AttackInfo(19)=(AnimName="punch2",StartBoneName="body_r_foot_joint",EndBoneName=None,StartFrame=4,EndFrame=21)
     AttackInfo(20)=(AnimName="punch2",StartBoneName="body_l_foot_joint",EndBoneName=None,StartFrame=4,EndFrame=21)
     AttackInfo(21)=(AnimName="punch2",StartBoneName="body_r_ankle_joint",EndBoneName="body_r_knee_joint",StartFrame=4,EndFrame=21)
     AttackInfo(22)=(AnimName="punch2",StartBoneName="body_r_knee_joint",EndBoneName="body_r_leg_joint",StartFrame=4,EndFrame=21)
     AttackInfo(23)=(AnimName="punch2",StartBoneName="body_l_ankle_joint",EndBoneName="body_l_knee_joint",StartFrame=4,EndFrame=21)
     AttackInfo(24)=(AnimName="punch2",StartBoneName="body_l_knee_joint",EndBoneName="body_l_leg_joint",StartFrame=4,EndFrame=21)
     AttackInfo(25)=(AnimName="runattack",StartBoneName="body_head_joint",EndBoneName="body_neck_joint",StartFrame=1,EndFrame=24)
     AttackInfo(26)=(AnimName="runattack",StartBoneName="body_l_brow1_joint",EndBoneName=None,StartFrame=1,EndFrame=24)
     AttackInfo(27)=(AnimName="runattack",StartBoneName="body_l_brow2_joint",EndBoneName=None,StartFrame=1,EndFrame=24)
     AttackInfo(28)=(AnimName="runattack",StartBoneName="body_r_brow1_joint",EndBoneName=None,StartFrame=1,EndFrame=24)
     AttackInfo(29)=(AnimName="runattack",StartBoneName="body_r_brow2_joint",EndBoneName=None,StartFrame=1,EndFrame=24)
     AttackInfo(30)=(AnimName="runattack",StartBoneName="body_l_earbase_joint",EndBoneName=None,StartFrame=1,EndFrame=24)
     AttackInfo(31)=(AnimName="runattack",StartBoneName="body_r_earbase_joint",EndBoneName=None,StartFrame=1,EndFrame=24)
     PunchEmitterClass=Class'SHGame.Punch_Donkey'
     AttackDistFromEnemy=20.000000
	 CameraSetStandard=(vLookAtOffset=(X=-35,Y=20,Z=60),fLookAtDistance=130,fLookAtHeight=40,fRotTightness=8,fRotSpeed=8,fMoveTightness=(X=25,Y=40,Z=40),fMoveSpeed=0,fMaxMouseDeltaX=190,fMaxMouseDeltaY=65,fMinPitch=-10000,fMaxPitch=10000)
     CameraSnapRotationPitch=-2500.000000
     DefaultPlayerControllerClass=Class'SHGame.DonkeyController'
     CarryTurnRightAnim="carryturnright"
     CarryTurnLeftAnim="carryturnleft"
     BigClimbStartNoTrans="jumptoclimb2"
     BigClimbEndNoTrans="climb2"
     BigClimbStartOffset=66.000000
     BigClimbOffset=32.000000
     BigShimmyOffset=50.000000
     StepUpOffset=30.000000
     JumpToHangAnim="jumptoclimb"
     JumpToHangNoTransAnim="jumptoclimb2"
     StepUpAnim="stepup"
     StepUpNoTransAnim="stepup2"
     IdleTiredAnimName="tiredidle"
     RunAnimName="run"
     WalkAnimName="Walk"
     PickupAnimName="Pickup"
     ThrowAnimName="throw"
     KnockBackAnimName="knockback"
     PickupBoneName="body_object_joint"
     LeftUpperLidBone="body_l_topeyelid_joint"
     LeftLowerLidBone="body_l_bottomeyelid_joint"
     RightUpperLidBone="body_r_topeyelid_joint"
     RightLowerLidBone="body_r_bottomeyelid_joint"
     JumpSounds(0)=Sound'Donkey.Jump'
     LandingStone(0)=Sound'Donkey.land'
     LandingWood(0)=Sound'Donkey.land'
     LandingWet(0)=Sound'Donkey.land'
     LandingGrass(0)=Sound'Donkey.land'
     LandingDirt(0)=Sound'Donkey.land'
     LandingHay(0)=Sound'Donkey.land'
     LandingLeaf(0)=Sound'Donkey.land'
     LandingSand(0)=Sound'Donkey.land'
     LandingMud(0)=Sound'Donkey.land'
     LandingNone(0)=Sound'Donkey.land'
     FootstepsStone(0)=Sound'Footsteps.F_donkey_stone01'
     FootstepsStone(1)=Sound'Footsteps.F_donkey_stone02'
     FootstepsStone(2)=Sound'Footsteps.F_donkey_stone03'
     FootstepsStone(3)=Sound'Footsteps.F_donkey_stone04'
     FootstepsStone(4)=Sound'Footsteps.F_donkey_stone05'
     FootstepsStone(5)=Sound'Footsteps.F_donkey_stone06'
     FootstepsWood(0)=Sound'Footsteps.F_donkey_wood01'
     FootstepsWood(1)=Sound'Footsteps.F_donkey_wood02'
     FootstepsWood(2)=Sound'Footsteps.F_donkey_wood03'
     FootstepsWood(3)=Sound'Footsteps.F_donkey_wood04'
     FootstepsWood(4)=Sound'Footsteps.F_donkey_wood05'
     FootstepsWood(5)=Sound'Footsteps.F_donkey_wood06'
     FootstepsWet(0)=Sound'Footsteps.F_donkey_water01'
     FootstepsWet(1)=Sound'Footsteps.F_donkey_water02'
     FootstepsWet(2)=Sound'Footsteps.F_donkey_water03'
     FootstepsWet(3)=Sound'Footsteps.F_donkey_water04'
     FootstepsWet(4)=Sound'Footsteps.F_donkey_water05'
     FootstepsWet(5)=Sound'Footsteps.F_donkey_water06'
     FootstepsGrass(0)=Sound'Footsteps.F_donkey_grass01'
     FootstepsGrass(1)=Sound'Footsteps.F_donkey_grass02'
     FootstepsGrass(2)=Sound'Footsteps.F_donkey_grass03'
     FootstepsGrass(3)=Sound'Footsteps.F_donkey_grass04'
     FootstepsGrass(4)=Sound'Footsteps.F_donkey_grass05'
     FootstepsGrass(5)=Sound'Footsteps.F_donkey_grass06'
     FootstepsMetal(0)=Sound'Footsteps.F_donkey_metal01'
     FootstepsMetal(1)=Sound'Footsteps.F_donkey_metal02'
     FootstepsMetal(2)=Sound'Footsteps.F_donkey_metal03'
     FootstepsMetal(3)=Sound'Footsteps.F_donkey_metal04'
     FootstepsMetal(4)=Sound'Footsteps.F_donkey_metal05'
     FootstepsMetal(5)=Sound'Footsteps.F_donkey_metal06'
     FootstepsDirt(0)=Sound'Footsteps.F_donkey_dirt01'
     FootstepsDirt(1)=Sound'Footsteps.F_donkey_dirt02'
     FootstepsDirt(2)=Sound'Footsteps.F_donkey_dirt03'
     FootstepsDirt(3)=Sound'Footsteps.F_donkey_dirt04'
     FootstepsDirt(4)=Sound'Footsteps.F_donkey_dirt05'
     FootstepsDirt(5)=Sound'Footsteps.F_donkey_dirt06'
     FootstepsDirt(6)=Sound'Footsteps.F_donkey_dirt07'
     FootstepsMud(0)=Sound'Footsteps.F_donkey_mud01'
     FootstepsMud(1)=Sound'Footsteps.F_donkey_mud02'
     FootstepsMud(2)=Sound'Footsteps.F_donkey_mud03'
     FootstepsMud(3)=Sound'Footsteps.F_donkey_mud04'
     FootstepsMud(4)=Sound'Footsteps.F_donkey_mud05'
     FootstepsMud(5)=Sound'Footsteps.F_donkey_mud06'
     FootstepsNone(0)=Sound'Footsteps.F_donkey_stone01'
     FootstepsNone(1)=Sound'Footsteps.F_donkey_stone02'
     FootstepsNone(2)=Sound'Footsteps.F_donkey_stone03'
     FootstepsNone(3)=Sound'Footsteps.F_donkey_stone04'
     FootstepsNone(4)=Sound'Footsteps.F_donkey_stone05'
     FootstepsNone(5)=Sound'Footsteps.F_donkey_stone06'
     FootFramesWalk(0)=4
     FootFramesWalk(1)=6
     FootFramesWalk(2)=16
     FootFramesWalk(3)=18
     FootFramesWalk(4)=30
     FootFramesWalk(5)=32
     FootFramesWalk(6)=41
     FootFramesWalk(7)=43
     FootFramesRun(0)=7
     FootFramesRun(1)=8
     FootFramesRun(2)=11
     FootFramesRun(3)=14
     FootFramesRun(4)=23
     FootFramesRun(5)=25
     FootFramesRun(6)=28
     FootFramesRun(7)=31
     WaterRipples=Class'SHGame.WaterRipples'
     fMoveWaterRipplesTime=0.250000
     fRestWaterRipplesTime=1.500000
     bUseNewMountCode=True
	 IdleAnims(0)="bored1"
	 IdleAnims(1)="bored1"
	 IdleAnims(2)="bored1"
	 IdleAnims(3)="bored1"
	 IdleAnims(4)="bored1"
	 IdleAnims(5)="bored2"
	 IdleAnims(6)="bored2"
	 IdleAnims(7)="bored2"
     fDoubleJumpHeight=80.000000
     fJumpHeight=40.000000
	 bIsMainPlayer=True
     ControllerClass=Class'SHGame.SHCompanionController'
     Mesh=SkeletalMesh'ShrekCharacters.Donkey'
     CollisionHeight=22.000000
	 Label="Donkey"
}
