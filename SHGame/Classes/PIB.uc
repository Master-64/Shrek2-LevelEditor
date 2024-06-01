//================================================================================
// PIB.
//================================================================================

class PIB extends ShHeroPawn
  Config(User);

var() int TotalGameStateTokens;
var() int GameStateTokenLen;
var(GameState) const editconst string GameStateMasterList;
var(GameState) travel string CurrentGameState;
var Sword PibSword;
var() Class<Emitter> HairFlyEmitter;
var() array<Sound> BodyFallSounds;
var() array<Sound> LandingSounds;
var() array<Sound> GetUpSounds;
var() array<Sound> SwordUnsheathSounds;
var() array<Sound> SwordPutAwaySounds;
var() array<Sound> SwordHitSounds;
var() Texture SwordRibbonTexName;
var() Material SwordSkin;
var float fDelay;
var bool bInCutScene;
var PibLeftGlove LeftGlove;
var PibRightGlove RightGlove;

function AddAnimNotifys()
{
}

function KillEverybody()
{
}

function PreCutPossess()
{
}

function PreCutUnPossess()
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

function CreateRibbonEmittersForRunAttack()
{
}

function PlayPibSound(array<Sound> sounds)
{
}

function PlayHairFlyEmitter()
{
}

function SetEverythingForClimbingLadder()
{
}

function name GetIdleAnimName()
{
}

event SetWalking(bool bNewIsWalking)
{
}

function ClimbLadder(LadderVolume L)
{
}

function EndClimbLadder(LadderVolume OldLadder)
{
}

function bool DoJump(bool bUpdating)
{
}

function DoDoubleJump(bool bUpdating)
{
}

function DoSomeAction()
{
}

function StartToShrinkDown()
{
}

function StartToShrinkUp()
{
}

function PutSwordBackIn()
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

defaultproperties
{
     HairFlyEmitter=Class'SHGame.Hair_Fly'
     BodyFallSounds(0)=Sound'PussInBoots.body_fall1'
     BodyFallSounds(1)=Sound'PussInBoots.body_fall2'
     BodyFallSounds(2)=Sound'PussInBoots.body_fall3'
     BodyFallSounds(3)=Sound'PussInBoots.body_fall4'
     LandingSounds(0)=Sound'PussInBoots.landing2'
     LandingSounds(1)=Sound'PussInBoots.landing3'
     GetUpSounds(0)=Sound'PussInBoots.get_up'
     SwordUnsheathSounds(0)=Sound'PussInBoots.sword_unsheath'
     SwordPutAwaySounds(0)=Sound'PussInBoots.sword_put_away'
     SwordHitSounds(0)=Sound'PussInBoots.sword_hit1'
     SwordHitSounds(1)=Sound'PussInBoots.sword_hit2'
     SwordHitSounds(2)=None
     SwordHitSounds(3)=Sound'PussInBoots.sword_hit4'
     SwordHitSounds(4)=Sound'PussInBoots.sword_hit5'
     SwordHitSounds(5)=Sound'PussInBoots.sword_hit6'
     SwordHitSounds(6)=Sound'PussInBoots.sword_hit7'
     SwordHitSounds(7)=Sound'PussInBoots.sword_hit8'
     SwordHitSounds(8)=Sound'PussInBoots.sword_hit9'
     SwordRibbonTexName=Texture'ShCharacters.Handsome_blur'
     SwordSkin=Texture'ShCharacters.PIB'
     AttackMoveAhead=50.000000
     SHHeroName="PIB"
     KnockBackStartAnimName="knockback_start"
     KnockBackEndAnimName="knockback_end"
     CarryKnockBackStartAnimName="carryknockback_start"
     CarryKnockBackEndAnimName="carryknockback_end"
     NewRunAttackAnim="runattack"
     StartSpecialAttackAnim="punch1"
     EndAttackAnim3="punch3end"
     StartAirAttackAnim="jump_attack"
     LoopAirAttackAnim="jump_attack_loop"
     EndAirAttackAnim="jump_attacktoidle"
     ContinueAirAttackAnim="jump_attacktopunch1"
     StartSupportAttackAnim="cheer_start"
     LoopSupportAttackAnim="cheer_loop"
     EndSupportAttackAnim="cheer_end"
     UpEndFrontAnim="upend_front"
     UpEndBackAnim="upend_back"
     GetUpFrontAnim="getup_front"
     GetUpBackAnim="getup_back"
     LookAroundAnims(0)="lookaround1"
     LookAroundAnims(1)="lookaround2"
     LookAroundAnims(2)="lookaround3"
     ThrowOffset=(X=-3.000000,Y=-4.000000,Z=2.000000)
     ThrowRotation=(Roll=24576)
     DrinkOffset=(X=-3.000000,Y=-4.000000,Z=2.000000)
     DrinkRotation=(Roll=24576)
     SwingSounds(0)=Sound'PussInBoots.action_swish1'
     SwingSounds(1)=Sound'PussInBoots.action_swish2'
     SwingSounds(2)=Sound'PussInBoots.action_swish3'
     SwingSounds(3)=Sound'PussInBoots.action_swish4'
     SwingSounds(4)=Sound'PussInBoots.action_swish5'
     SwingSounds(5)=Sound'PussInBoots.action_swish6'
     SwingSounds(6)=Sound'PussInBoots.action_swish7'
     SwingSounds(7)=Sound'PussInBoots.action_swish8'
     SwingSounds(8)=Sound'PussInBoots.action_swish9'
     SwingSounds(9)=Sound'PussInBoots.action_swish10'
     RunAttackSounds(0)=Sound'PussInBoots.action_triple_swish1'
     RunAttackSounds(1)=Sound'PussInBoots.action_triple_swish2'
     RunAttackSounds(2)=Sound'PussInBoots.action_triple_swish3'
     Attack1Sounds(0)=Sound'PussInBoots.action_swish1'
     Attack1Sounds(1)=Sound'PussInBoots.action_swish2'
     Attack1Sounds(2)=Sound'PussInBoots.action_swish3'
     Attack1Sounds(3)=Sound'PussInBoots.action_swish4'
     Attack1Sounds(4)=Sound'PussInBoots.action_swish5'
     Attack1Sounds(5)=Sound'PussInBoots.action_swish6'
     Attack1Sounds(6)=Sound'PussInBoots.action_swish7'
     Attack1Sounds(7)=Sound'PussInBoots.action_swish8'
     Attack1Sounds(8)=Sound'PussInBoots.action_swish9'
     Attack1Sounds(9)=Sound'PussInBoots.action_swish10'
     Attack2Sounds(0)=Sound'PussInBoots.action_swish1'
     Attack2Sounds(1)=Sound'PussInBoots.action_swish2'
     Attack2Sounds(2)=Sound'PussInBoots.action_swish3'
     Attack2Sounds(3)=Sound'PussInBoots.action_swish4'
     Attack2Sounds(4)=Sound'PussInBoots.action_swish5'
     Attack2Sounds(5)=Sound'PussInBoots.action_swish6'
     Attack2Sounds(6)=Sound'PussInBoots.action_swish7'
     Attack2Sounds(7)=Sound'PussInBoots.action_swish8'
     Attack2Sounds(8)=Sound'PussInBoots.action_swish9'
     Attack2Sounds(9)=Sound'PussInBoots.action_swish10'
     Attack3Sounds(0)=Sound'PussInBoots.action_swish1'
     Attack3Sounds(1)=Sound'PussInBoots.action_swish2'
     Attack3Sounds(2)=Sound'PussInBoots.action_swish3'
     Attack3Sounds(3)=Sound'PussInBoots.action_swish4'
     Attack3Sounds(4)=Sound'PussInBoots.action_swish5'
     Attack3Sounds(5)=Sound'PussInBoots.action_swish6'
     Attack3Sounds(6)=Sound'PussInBoots.action_swish7'
     Attack3Sounds(7)=Sound'PussInBoots.action_swish8'
     Attack3Sounds(8)=Sound'PussInBoots.action_swish9'
     Attack3Sounds(9)=Sound'PussInBoots.action_swish10'
     ThrowPotionSound=Sound'PussInBoots.pib_throw_potion'
     DrinkPotionSound=Sound'PussInBoots.pib_drink_potion'
     EmoteSoundJump(0)=Sound'AllDialog.pc_pib_pibemote_50'
     EmoteSoundJump(1)=Sound'AllDialog.pc_pib_pibemote_46'
     EmoteSoundJump(2)=Sound'AllDialog.pc_pib_pibemote_24'
     EmoteSoundJump(3)=Sound'AllDialog.pc_pib_pibemote_22'
     EmoteSoundJump(4)=Sound'AllDialog.pc_pib_pibemote_20'
     EmoteSoundLand(0)=Sound'AllDialog.pc_pib_pibemote_32'
     EmoteSoundLand(1)=Sound'AllDialog.pc_pib_pibemote_28'
     EmoteSoundLand(2)=Sound'AllDialog.pc_pib_pibemote_14'
     EmoteSoundLand(3)=Sound'AllDialog.pc_pib_pibemote_8'
     EmoteSoundLand(4)=Sound'AllDialog.pc_pib_pibemote_84'
     EmoteSoundLand(5)=Sound'AllDialog.pc_pib_pibemote_64'
     EmoteSoundLand(6)=Sound'AllDialog.pc_pib_pibemote_110'
     EmoteSoundLand(7)=Sound'AllDialog.pc_pib_pibemote_86'
     EmoteSoundClimb(0)=Sound'AllDialog.pc_pib_pibemote_6'
     EmoteSoundClimb(1)=Sound'AllDialog.pc_pib_pibemote_4'
     EmoteSoundClimb(2)=Sound'AllDialog.pc_pib_pibemote_82'
     EmoteSoundClimb(3)=Sound'AllDialog.pc_pib_pibemote_68'
     EmoteSoundPain(0)=Sound'AllDialog.pc_pib_pibemote_52'
     EmoteSoundPain(1)=Sound'AllDialog.pc_pib_pibemote_2'
     EmoteSoundPain(2)=Sound'AllDialog.pc_pib_pibemote_58'
     EmoteSoundPain(3)=Sound'AllDialog.pc_pib_pibemote_10'
     EmoteSoundPain(4)=Sound'AllDialog.pc_pib_pibemote_106'
     EmoteSoundPain(5)=Sound'AllDialog.pc_pib_pibemote_100'
     EmoteSoundPain(6)=Sound'AllDialog.pc_pib_pibemote_98'
     EmoteSoundPain(7)=Sound'AllDialog.pc_pib_pibemote_92'
     EmoteSoundPain(8)=Sound'AllDialog.pc_pib_pibemote_88'
     EmoteSoundPain(9)=Sound'AllDialog.pc_pib_pibemote_56'
     EmoteSoundPain(10)=Sound'AllDialog.pc_pib_pibemote_80'
     EmoteSoundPain(11)=Sound'AllDialog.pc_pib_pibemote_70'
     EmoteSoundPain(12)=Sound'AllDialog.pc_pib_pibemote_60'
     EmoteSoundPunch(0)=Sound'AllDialog.pc_pib_pibemote_26'
     EmoteSoundPunch(1)=Sound'AllDialog.pc_pib_pibemote_48'
     EmoteSoundPunch(2)=Sound'AllDialog.pc_pib_pibemote_44'
     EmoteSoundPunch(3)=Sound'AllDialog.pc_pib_pibemote_36'
     EmoteSoundPunch(4)=Sound'AllDialog.pc_pib_pibemote_34'
     EmoteSoundPunch(5)=Sound'AllDialog.pc_pib_pibemote_30'
     EmoteSoundPunch(6)=Sound'AllDialog.pc_pib_pibemote_94'
     EmoteSoundPunch(7)=Sound'AllDialog.pc_pib_pibemote_96'
     EmoteSoundPunch(8)=Sound'AllDialog.pc_pib_pibemote_90'
     EmoteSoundPunch(9)=Sound'AllDialog.pc_pib_pibemote_76'
     EmoteSoundPunch(10)=Sound'AllDialog.pc_pib_pibemote_78'
     EmoteSoundPunch(11)=Sound'AllDialog.pc_pib_pibemote_66'
     EmoteSoundPull(0)=Sound'AllDialog.pc_pib_pibemote_6'
     EmoteSoundPull(1)=Sound'AllDialog.pc_pib_pibemote_4'
     EmoteSoundPull(2)=Sound'AllDialog.pc_pib_pibemote_82'
     EmoteSoundPull(3)=Sound'AllDialog.pc_pib_pibemote_68'
     EmoteSoundShimmy(0)=Sound'AllDialog.pc_pib_pibemote_4'
     EmoteSoundShimmy(1)=Sound'AllDialog.pc_pib_pibemote_6'
     EmoteSoundShimmy(2)=Sound'AllDialog.pc_pib_pibemote_10'
     EmoteSoundShimmy(3)=Sound'AllDialog.pc_pib_pibemote_42'
     EmoteSoundShimmy(4)=Sound'AllDialog.pc_pib_pibemote_68'
     EmoteSoundShimmy(5)=Sound'AllDialog.pc_pib_pibemote_82'
     EmoteSoundShimmy(6)=Sound'AllDialog.pc_pib_pibemote_84'
     EmoteSoundThrow(0)=Sound'AllDialog.pc_pib_pibemote_26'
     EmoteSoundThrow(1)=Sound'AllDialog.pc_pib_pibemote_48'
     EmoteSoundThrow(2)=Sound'AllDialog.pc_pib_pibemote_44'
     EmoteSoundThrow(3)=Sound'AllDialog.pc_pib_pibemote_36'
     EmoteSoundThrow(4)=Sound'AllDialog.pc_pib_pibemote_34'
     EmoteSoundThrow(5)=Sound'AllDialog.pc_pib_pibemote_30'
     EmoteSoundThrow(6)=Sound'AllDialog.pc_pib_pibemote_94'
     EmoteSoundThrow(7)=Sound'AllDialog.pc_pib_pibemote_96'
     EmoteSoundThrow(8)=Sound'AllDialog.pc_pib_pibemote_90'
     EmoteSoundThrow(9)=Sound'AllDialog.pc_pib_pibemote_76'
     EmoteSoundThrow(10)=Sound'AllDialog.pc_pib_pibemote_78'
     EmoteSoundThrow(11)=Sound'AllDialog.pc_pib_pibemote_66'
     EmoteSoundFaint(0)=Sound'AllDialog.pc_pib_pibemote_38'
     EmoteSoundFaint(1)=Sound'AllDialog.pc_pib_pibemote_108'
     EmoteSoundFaint(2)=Sound'AllDialog.pc_pib_pibemote_102'
     EmoteSoundFaint(3)=Sound'AllDialog.pc_pib_pibemote_104'
     EmoteSoundFaint(4)=Sound'AllDialog.pc_pib_pibemote_54'
     EmoteSoundFaint(5)=Sound'AllDialog.pc_pib_pibemote_72'
     EmoteSoundFaint(6)=Sound'AllDialog.pc_pib_pibemote_74'
     EmoteSoundFaint(7)=Sound'AllDialog.pc_pib_pibemote_62'
     EmoteSoundVictory(0)=Sound'AllDialog.pc_pib_pibemote_18'
     EmoteSoundVictory(1)=Sound'AllDialog.pc_pib_pibemote_16'
     SoundShimmy(0)=Sound'PussInBoots.shimmy1'
     SoundShimmy(1)=Sound'PussInBoots.shimmy2'
     SoundShimmy(2)=Sound'PussInBoots.shimmy3'
     SoundShimmy(3)=Sound'PussInBoots.shimmy4'
     SoundPickup(0)=Sound'PussInBoots.pick_up'
     SoundThrow(0)=Sound'PussInBoots.action_swish1'
     SoundThrow(1)=Sound'PussInBoots.action_swish2'
     SoundThrow(2)=Sound'PussInBoots.action_swish3'
     SoundThrow(3)=Sound'PussInBoots.action_swish4'
     SoundThrow(4)=Sound'PussInBoots.action_swish5'
     SoundThrow(5)=Sound'PussInBoots.action_swish6'
     SoundThrow(6)=Sound'PussInBoots.action_swish7'
     SoundThrow(7)=Sound'PussInBoots.action_swish8'
     SoundThrow(8)=Sound'PussInBoots.action_swish9'
     SoundThrow(9)=Sound'PussInBoots.action_swish10'
     DoubleJumpSound(0)=Sound'PussInBoots.action_swish1'
     DoubleJumpSound(1)=Sound'PussInBoots.action_swish2'
     DoubleJumpSound(2)=Sound'PussInBoots.action_swish3'
     DoubleJumpSound(3)=Sound'PussInBoots.action_swish4'
     DoubleJumpSound(4)=Sound'PussInBoots.action_swish5'
     DoubleJumpSound(5)=Sound'PussInBoots.action_swish6'
     DoubleJumpSound(6)=Sound'PussInBoots.action_swish7'
     DoubleJumpSound(7)=Sound'PussInBoots.action_swish8'
     DoubleJumpSound(8)=Sound'PussInBoots.action_swish9'
     DoubleJumpSound(9)=Sound'PussInBoots.action_swish10'
     AttackStartBoneNames(0)="body_swordtip_joint"
     AttackStartBoneNames(1)="body_swordtip_joint"
     AttackStartBoneNames(2)="body_swordtip_joint"
     AttackStartBoneNames(3)="body_swordtip_joint"
     AttackEndBoneNames(0)="body_object_joint"
     AttackEndBoneNames(1)="body_object_joint"
     AttackEndBoneNames(2)="body_object_joint"
     AttackEndBoneNames(3)="body_object_joint"
     RibbonEmitterName=Class'SHGame.Hero_Ribbon'
     TexName=Texture'ShCharacters.Handsome_blur'
     KnockBackDistance=20.000000
     SkinsVisible(0)=Shader'ShCharacters.PiB_S'
     SkinsVisible(1)=Shader'ShCharacters.PiBHat_S'
     SkinsInvisible(0)=Texture'ShCharacters.PiB_inv'
     SkinsInvisible(1)=Texture'ShCharacters.PIBHat_inv'
     StrengthEmitterBoneName(0)="body_l_fingersmid_joint"
     StrengthEmitterBoneName(1)="body_r_fingersmid_joint"
     PotionDrawScale=0.500000
     PotionBumpLines(0)="PIB_PibStrength"
     PotionBumpLines(1)="PIB_PibFrog"
     PotionBumpLines(2)="PIB_PibGhost"
     PotionBumpLines(3)="PIB_PibSleep"
     PotionBumpLines(4)="PIB_PibStink"
     PotionBumpLines(5)="PIB_PibShrinkMe"
     PotionBumpLines(6)="PIB_PibShrinkYou"
     PotionBumpLines(7)="PIB_PibFreeze"
     PotionBumpLines(8)="PIB_PibLove"
     WastedPotionBumpLines="PIB_PibWaste"
     HurtBumpLines="PIB_PibHurt"
     HitBumpLines="PIB_PibHit"
     SimmyBumpLines="PIB_ShimmyPib"
     PickupEnergyBarBumpLines="PIB_PibHero"
     PickupShamrockBumpLines="PIB_PibClover"
     LowCoinsBumpLines="PIB_PibCoinLow"
     ManyCoinsBumpLines="PIB_PibCoin"
     TiredBumpLines="PIB_PibLowHealth"
     AttackDist=45.000000
     AttackHeight=30.000000
     AttackAngle=45.000000
     WadeAnims(0)="run"
     WadeAnims(1)="runbackward"
     WadeAnims(2)="StrafeLeft"
     WadeAnims(3)="StrafeRight"
     AttackInfo(0)=(AnimName="punch1",StartBoneName="body_object_joint",EndBoneName="body_swordtip_joint",StartFrame=1,EndFrame=10)
     AttackInfo(1)=(AnimName="punch2",StartBoneName="body_object_joint",EndBoneName="body_swordtip_joint",StartFrame=1,EndFrame=19)
     AttackInfo(2)=(AnimName="punch3",StartBoneName="body_object_joint",EndBoneName="body_swordtip_joint",StartFrame=1,EndFrame=21)
     AttackInfo(3)=(AnimName="runattack",StartBoneName="body_object_joint",EndBoneName="body_swordtip_joint",StartFrame=3,EndFrame=22)
     AttackInfo(4)=(AnimName="runattack",StartBoneName="body_r_wrist_joint",EndBoneName="body_object_joint",StartFrame=3,EndFrame=22)
     AttackInfo(5)=(AnimName="runattack",StartBoneName="body_r_elbow_joint",EndBoneName="body_r_wrist_joint",StartFrame=3,EndFrame=22)
     PunchEmitterClass=Class'SHGame.Punch_PIB'
     AttackDistFromEnemy=30.000000
     CameraSetStandard=(vLookAtOffset=(X=-25,Y=0,Z=45),fLookAtDistance=100,fLookAtHeight=35,fRotTightness=8,fRotSpeed=8,fMoveTightness=(X=25,Y=40,Z=40),fMoveSpeed=0,fMaxMouseDeltaX=190,fMaxMouseDeltaY=65,fMinPitch=-10000,fMaxPitch=10000)
     CameraSnapRotationPitch=-2500.000000
     DefaultPlayerControllerClass=Class'SHGame.ShrekController'
     DoubleJumpAnims(1)="doublejumpback"
     CarryTurnRightAnim="carryturnright"
     CarryTurnLeftAnim="carryturnleft"
     CompanionWalkAnim="BiPedWalk"
     bCouldNotWalkAsCompanion=True
     BigClimbStartNoTrans="jumptoclimb2"
     BigClimbEndNoTrans="climb2"
     BigClimbStartOffset=92.000000
     BigClimbOffset=48.000000
     BigShimmyOffset=50.000000
     StepUpOffset=30.000000
     HangIdleNoTransAnim="hangidle2"
     JumpToHangNoTransAnim="jumptohang2"
     ShimmyRightNoTransAnim="shimmyright2"
     ShimmyLeftNoTransAnim="shimmyleft2"
     ShimmyRightEndNoTransAnim="shimmyrightend2"
     ShimmyLeftEndNoTransAnim="shimmyleftend2"
     IdleTiredAnimName="tiredidle"
     RunAnimName="run"
     WalkAnimName="Walk"
     PickupAnimName="Pickup"
     ThrowAnimName="throw"
     KnockBackAnimName="knockback"
     PickupBoneName="body_object_joint"
     GroundRunSpeed=375.000000
     GroundCarrySpeed=300.000000
     fDoubleJumpAnimRate=1.200000
     NeckRotElement=RE_RollNeg
     JumpSounds(0)=Sound'PussInBoots.action_swish1'
     JumpSounds(1)=Sound'PussInBoots.action_swish2'
     JumpSounds(2)=Sound'PussInBoots.action_swish3'
     JumpSounds(3)=Sound'PussInBoots.action_swish4'
     JumpSounds(4)=Sound'PussInBoots.action_swish5'
     JumpSounds(5)=Sound'PussInBoots.action_swish6'
     JumpSounds(6)=Sound'PussInBoots.action_swish7'
     JumpSounds(7)=Sound'PussInBoots.action_swish8'
     JumpSounds(8)=Sound'PussInBoots.action_swish9'
     JumpSounds(9)=Sound'PussInBoots.action_swish10'
     LandingStone(0)=Sound'Footsteps.F_PIB_stone1'
     LandingWood(0)=Sound'Footsteps.F_PIB_wood1'
     LandingWet(0)=Sound'Footsteps.F_PIB_wet1'
     LandingDirt(0)=Sound'Footsteps.F_PIB_dirt1'
     LandingNone(0)=Sound'Footsteps.F_PIB_default1'
     FootstepsStone(0)=Sound'Footsteps.F_PIB_stone1'
     FootstepsStone(1)=Sound'Footsteps.F_PIB_stone2'
     FootstepsStone(2)=Sound'Footsteps.F_PIB_stone3'
     FootstepsStone(3)=Sound'Footsteps.F_PIB_stone4'
     FootstepsStone(4)=Sound'Footsteps.F_PIB_stone5'
     FootstepsStone(5)=Sound'Footsteps.F_PIB_stone6'
     FootstepsWood(0)=Sound'Footsteps.F_PIB_wood1'
     FootstepsWood(1)=Sound'Footsteps.F_PIB_wood2'
     FootstepsWood(2)=Sound'Footsteps.F_PIB_wood3'
     FootstepsWood(3)=Sound'Footsteps.F_PIB_wood4'
     FootstepsWood(4)=Sound'Footsteps.F_PIB_wood5'
     FootstepsWood(5)=Sound'Footsteps.F_PIB_wood6'
     FootstepsWet(0)=Sound'Footsteps.F_PIB_wet1'
     FootstepsWet(1)=Sound'Footsteps.F_PIB_wet2'
     FootstepsWet(2)=Sound'Footsteps.F_PIB_wet3'
     FootstepsWet(3)=Sound'Footsteps.F_PIB_wet4'
     FootstepsWet(4)=Sound'Footsteps.F_PIB_wet5'
     FootstepsWet(5)=Sound'Footsteps.F_PIB_wet6'
     FootstepsDirt(0)=Sound'Footsteps.F_PIB_dirt1'
     FootstepsDirt(1)=Sound'Footsteps.F_PIB_dirt2'
     FootstepsDirt(2)=Sound'Footsteps.F_PIB_dirt3'
     FootstepsDirt(3)=Sound'Footsteps.F_PIB_dirt4'
     FootstepsDirt(4)=Sound'Footsteps.F_PIB_dirt5'
     FootstepsDirt(5)=Sound'Footsteps.F_PIB_dirt6'
     FootstepsNone(0)=Sound'Footsteps.F_PIB_default1'
     FootstepsNone(1)=Sound'Footsteps.F_PIB_default2'
     FootstepsNone(2)=Sound'Footsteps.F_PIB_default3'
     FootstepsNone(3)=Sound'Footsteps.F_PIB_default4'
     FootstepsNone(4)=Sound'Footsteps.F_PIB_default5'
     FootstepsNone(5)=Sound'Footsteps.F_PIB_default6'
     FootFramesWalk(0)=7
     FootFramesWalk(1)=23
     FootFramesWalk(2)=40
     FootFramesWalk(3)=57
     FootFramesRun(0)=4
     FootFramesRun(1)=18
     FootFramesRun(2)=30
     FootFramesRun(3)=44
     bUseNewMountCode=True
	 IdleAnims(0)="bored1"
	 IdleAnims(1)="bored1"
	 IdleAnims(2)="bored1"
	 IdleAnims(3)="bored1"
	 IdleAnims(4)="bored2"
	 IdleAnims(5)="bored2"
	 IdleAnims(6)="bored2"
	 IdleAnims(7)="bored2"
     fDoubleJumpHeight=72.000000
     fJumpHeight=48.000000
     ShimmySpeed=50.000000
	 bIsMainPlayer=True
     bCanClimbLadders=True
     ControllerClass=Class'SHGame.SHCompanionController'
     BaseMovementRate=300.000000
	 MouthBone=body_jaw_joint
     Mesh=SkeletalMesh'ShrekCharacters.PIB'
     CollisionRadius=10.000000
     CollisionHeight=19.000000
	 Label="PIB"
}
