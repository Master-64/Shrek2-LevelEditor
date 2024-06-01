//================================================================================
// Shrek.
//================================================================================

class Shrek extends ShHeroPawn
  Config(User);

var() int TotalGameStateTokens;
var() int GameStateTokenLen;
var(GameState) const editconst string GameStateMasterList;
var(GameState) travel string CurrentGameState;
var() array<Sound> FartSounds;
var() Sound EarthQuakeSound;
var travel string FuturePlayerLabel;
var() name SavedTag;
var() name LeftWristBoneName;
var() name RightWristBoneName;
var() Class<Emitter> SpecialAttackEmitterName;
var() Class<Emitter> BellyFlopEmitterName;
var() Sound SoundBellyFlop1;
var() Sound SoundBellyFlop2;
var ShrekLeftGlove LeftGlove;
var ShrekRightGlove RightGlove;
var() Vector PibAttachOffset;
var() Rotator PibAttachRotation;
var Controller PibSaveController;
var() travel int WhichBonusGame;
var() travel int TotalHealthIcons;

function PlayFartSound()
{
}

function bool IsInBonusLevel()
{
}

function AddAnimNotifys()
{
}

function bool HitBossPib()
{
}

function PlaySoundBellyFlop1()
{
}

function PlaySoundBellyFlop2()
{
}

function SpecialAttackCameraShake()
{
}

function HitGround()
{
}

function BossPibAttackCameraShake()
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

function Vector GetRunAttackEmitterLocation()
{
}

defaultproperties
{
     FartSounds(0)=Sound'Shrek.fart01'
     FartSounds(1)=Sound'Shrek.fart02'
     FartSounds(2)=Sound'Shrek.fart03'
     LeftWristBoneName="body_l_wrist_joint"
     RightWristBoneName="body_r_wrist_joint"
     SpecialAttackEmitterName=Class'SHGame.Dust_Cloud'
     BellyFlopEmitterName=Class'SHGame.Body_Slam'
     PibAttachOffset=(X=1.000000,Y=1.000000,Z=17.000000)
     PibAttachRotation=(Pitch=26026,Yaw=22950,Roll=60766)
     WhichBonusGame=1
     TotalHealthIcons=1
     AttackMoveAhead=90.000000
     SHHeroName="Shrek"
     NewRunAttackAnim="runattack"
     BossPibAttackAnim="Attack_bosspib"
     LookAroundAnims(0)="lookaround1"
     LookAroundAnims(1)="lookaround2"
     LookAroundAnims(2)="lookaround3"
     ThrowOffset=(X=-9.000000,Y=5.000000,Z=-6.000000)
     ThrowRotation=(Roll=16384)
     DrinkOffset=(X=-9.000000,Y=5.000000,Z=-6.000000)
     DrinkRotation=(Roll=16384)
     Attack1Sounds(0)=Sound'Shrek.punch01'
     Attack2Sounds(0)=Sound'Shrek.punch02'
     Attack3Sounds(0)=Sound'Shrek.punch03'
     SpecialAttackSounds(0)=Sound'Shrek.punch03'
     BossPibAttackSounds(0)=Sound'Shrek.punch03'
     DyingSound=Sound'Shrek.faint'
     ThrowPotionSound=Sound'Shrek.throw_potion'
     DrinkPotionSound=Sound'Shrek.drink_potion'
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
     FrontLeftBone="body_l_ball_joint"
     FrontRightBone="body_r_ball_joint"
     AttackStartBoneNames(3)="body_l_wrist_joint"
     AttackEndBoneNames(3)="body_l_shoulder_joint"
     RibbonEmitterName=Class'SHGame.Hero_Ribbon'
     TexName=Texture'ShCharacters.Shrek_blur'
     KnockBackDistance=50.000000
     SkinsVisible(0)=Texture'ShCharacters.Shrek'
     SkinsVisible(1)=Shader'ShCharacters.shrekshirt_S'
     SkinsInvisible(0)=Texture'ShCharacters.shrek_inv'
     SkinsInvisible(1)=Texture'ShCharacters.shrekshirt_inv'
     StrengthEmitterBoneName(0)="body_l_indexmid_joint"
     StrengthEmitterBoneName(1)="body_r_indexmid_joint"
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
     HurtBumpLines="SHK_ShrekHurt"
     HitBumpLines="SHK_ShrekHit"
     SimmyBumpLines="SHK_Shimmy"
     PickupEnergyBarBumpLines="SHK_ShrekHero"
     PickupShamrockBumpLines="SHK_ShrekClover"
     LowCoinsBumpLines="SHK_ShrekCoinLow"
     ManyCoinsBumpLines="SHK_ShrekCoin"
     TiredBumpLines="SHK_ShrekLowHealth"
     InWaterBumpLines="SHK_ShrekWater"
     FootstepsWade(0)=Sound'Footsteps.F_shrek_wading01'
     FootstepsWade(1)=Sound'Footsteps.F_shrek_wading02'
     FootstepsWade(2)=Sound'Footsteps.F_shrek_wading03'
     FootstepsWade(3)=Sound'Footsteps.F_shrek_wading04'
     FootstepsWade(4)=Sound'Footsteps.F_shrek_wading05'
     FootstepsWade(5)=Sound'Footsteps.F_shrek_wading06'
     AttackDist=60.000000
     AttackHeight=60.000000
     AttackAngle=60.000000
     AttackInfo(0)=(AnimName="punch1",StartBoneName="body_r_fingersbase_joint",EndBoneName=None,StartFrame=1,EndFrame=9)
     AttackInfo(1)=(AnimName="punch2",StartBoneName="body_l_elbow_joint",EndBoneName="body_l_wrist_joint",StartFrame=9,EndFrame=20)
     AttackInfo(2)=(AnimName="punch3",StartBoneName="body_r_fingersbase_joint",EndBoneName="body_r_wrist_joint",StartFrame=10,EndFrame=18)
     AttackInfo(3)=(AnimName="punch3",StartBoneName="body_r_wrist_joint",EndBoneName="body_r_elbow_joint",StartFrame=10,EndFrame=18)
     AttackInfo(4)=(AnimName="punch3",StartBoneName="body_r_elbow_joint",EndBoneName="body_r_shoulder_joint",StartFrame=10,EndFrame=18)
     AttackInfo(5)=(AnimName="runattack",StartBoneName="body_l_fingersbase_joint",EndBoneName=None,StartFrame=1,EndFrame=20)
     AttackInfo(6)=(AnimName="runattack",StartBoneName="body_l_wrist_joint",EndBoneName=None,StartFrame=1,EndFrame=20)
     AttackInfo(7)=(AnimName="runattack",StartBoneName="body_l_elbow_joint",EndBoneName=None,StartFrame=1,EndFrame=20)
     AttackInfo(8)=(AnimName="runattack",StartBoneName="body_l_shoulder_joint",EndBoneName=None,StartFrame=1,EndFrame=20)
     AttackInfo(9)=(AnimName="runattack",StartBoneName="body_l_toe_joint",EndBoneName=None,StartFrame=1,EndFrame=20)
     AttackInfo(10)=(AnimName="runattack",StartBoneName="body_l_ball_joint",EndBoneName=None,StartFrame=1,EndFrame=20)
     AttackInfo(11)=(AnimName="runattack",StartBoneName="body_l_ankle_joint",EndBoneName=None,StartFrame=1,EndFrame=20)
     AttackInfo(12)=(AnimName="runattack",StartBoneName="body_l_knee_joint",EndBoneName=None,StartFrame=1,EndFrame=20)
     AttackInfo(13)=(AnimName="runattack",StartBoneName="body_l_thigh_joint",EndBoneName=None,StartFrame=1,EndFrame=20)
     PunchEmitterClass=Class'SHGame.Punch_Shrek'
     AttackDistFromEnemy=35.000000
     CameraSetStandard=(vLookAtOffset=(X=-15,Y=15,Z=75),fLookAtDistance=170,fLookAtHeight=50,fRotTightness=8,fRotSpeed=8,fMoveTightness=(X=25,Y=40,Z=40),fMoveSpeed=0,fMaxMouseDeltaX=190,fMaxMouseDeltaY=65,fMinPitch=-10000,fMaxPitch=10000)
     CameraSnapRotationPitch=-3500.000000
     DefaultPlayerControllerClass=Class'SHGame.ShrekController'
     CarryTurnRightAnim="carryturnright"
     CarryTurnLeftAnim="carryturnleft"
     BigClimbStartNoTrans="jumptoclimb2"
     BigClimbEndNoTrans="climb2"
     BigClimbStartOffset=190.000000
     BigClimbOffset=130.000000
     BigShimmyOffset=140.000000
     HangIdleNoTransAnim="hangidle2"
     JumpToHangNoTransAnim="jumptohang2"
     ShimmyRightNoTransAnim="shimmyright2"
     ShimmyLeftNoTransAnim="shimmyleft2"
     ShimmyRightEndNoTransAnim="shimmyrightend2"
     ShimmyLeftEndNoTransAnim="shimmyleftend2"
     StepUpAnim="stepup"
     StepUpNoTransAnim="stepup2"
     IdleTiredAnimName="tiredidle"
     RunAnimName="run"
     WalkAnimName="Walk"
     PickupAnimName="Pickup"
     ThrowAnimName="throw"
     KnockBackAnimName="knockback"
     PickupBoneName="body_object_joint"
     GroundWalkSpeed=150.000000
     NeckRotElement=RE_RollNeg
     HeadRotElement=RE_YawPos
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
     FootFramesWalk(0)=8
     FootFramesWalk(1)=25
     FootFramesWalk(2)=44
     FootFramesWalk(3)=61
     FootFramesRun(0)=5
     FootFramesRun(1)=20
     FootFramesRun(2)=34
     FootFramesRun(3)=50
     WaterRipples=Class'SHGame.WaterRipples'
     fMoveWaterRipplesTime=0.250000
     fRestWaterRipplesTime=1.500000
     bUseNewMountCode=True
	 IdleAnims(0)="bored1"
	 IdleAnims(1)="bored1"
	 IdleAnims(2)="bored1"
	 IdleAnims(3)="bored1"
	 IdleAnims(4)="bored2"
	 IdleAnims(5)="bored2"
	 IdleAnims(6)="bored2"
	 IdleAnims(7)="bored2"
     ShimmySpeed=120.000000
	 bIsMainPlayer=True
     ControllerClass=Class'SHGame.SHCompanionController'
     Mesh=SkeletalMesh'ShrekCharacters.Shrek'
     CollisionHeight=44.000000
	 Label="Shrek"
	 EarthQuakeSound=Sound'Shrek.punch_GROUND_SHAKE'
    SoundBellyFlop1=Sound'Shrek.bellyflop_01'
    SoundBellyFlop2=Sound'Shrek.bellyflop_02'
	JumpAttackMoveAhead=80
}
