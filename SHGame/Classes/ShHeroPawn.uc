//================================================================================
// ShHeroPawn.
//================================================================================

class ShHeroPawn extends SHCharacter
  Config(User);

enum eHitType {
  HT_FULLBODY,
  HT_UPPERBODY,
  HT_LOWBODY
};

const SHMaxRunningGameSlot= 10108;
const SHMinRunningGameSlot= 9998;
var() name NewTag;
var Actor NewJumpMagnet;
var() bool bFrontEndPlayer;
var() bool bNotPushableByPlayer;
var() float AttackMoveAhead;
var() float JumpAttackMoveAhead;
var() eHitType HitType;
var() Class<Projector> FootPrintDecal;
var Actor SwitchActor;
var float YawToSwitchActor;
var name StateBeforeKnockBack;
var bool isPoisoned;
var float timePoisoned;
var() float maxTimePoisoned;
var float poisonCounter;
var Emitter poisonEmitter;
var float damageCounter;
var float poisonDamageAmount;
var bool bIsBeingAttacked;
var() bool bNoKnockback;
var bool bSayCombatDialog;
var() Class<Emitter> fxSwingingDeathClass;
var int numCombatants;
var() int MaxCombatants;
var() name JumpWaterAnim;
var() name SHHeroName;
var() name IdleFightAnimName;
var() name KnockBackStartAnimName;
var() name KnockBackEndAnimName;
var() name CarryKnockBackStartAnimName;
var() name CarryKnockBackEndAnimName;
var() name KnockForwardStartAnimName;
var() name KnockForwardEndAnimName;
var() name CarryKnockForwardStartAnimName;
var() name CarryKnockForwardEndAnimName;
var name PetAnim;
var() name RunAttackAnim;
var() name NewRunAttackAnim;
var() name StartSpecialAttackAnim;
var() name StartAttackAnim;
var() name StartAttackAnim1;
var() name EndAttackAnim1;
var() name StartAttackAnim2;
var() name EndAttackAnim2;
var() name StartAttackAnim3;
var() name EndAttackAnim3;
var() name PreStartAttackAnim1;
var() name BossPibAttackAnim;
var() bool bCanUseJumpAttack;
var() name StartAirAttackAnim;
var() name LoopAirAttackAnim;
var() name EndAirAttackAnim;
var() name ContinueAirAttackAnim;
var() float AirAttackBoost;
var() float AirAttackFall;
var() name StartSupportAttackAnim;
var() name LoopSupportAttackAnim;
var() name EndSupportAttackAnim;
var() name UpEndFrontAnim;
var() name UpEndBackAnim;
var() name GetUpFrontAnim;
var() name GetUpBackAnim;
var() array<name> LookAroundAnims;
var() name ThrowPotionAnimName;
var() name DrinkPotionAnimName;
var() name ThrowPotionBoneName;
var() name DrinkPotionBoneName;
var() Vector ThrowOffset;
var() Rotator ThrowRotation;
var() Vector DrinkOffset;
var() Rotator DrinkRotation;
var PotionBottles CurrentPotionBottle;
var() array<Sound> NoSounds;
var(sounds) array<Sound> SwingSounds;
var(sounds) array<Sound> RunAttackSounds;
var(sounds) array<Sound> Attack1Sounds;
var(sounds) array<Sound> Attack2Sounds;
var(sounds) array<Sound> Attack3Sounds;
var(sounds) array<Sound> SpecialAttackSounds;
var(sounds) array<Sound> BossPibAttackSounds;
var(sounds) Sound DyingSound;
var() Sound ThrowPotionSound;
var() Sound DrinkPotionSound;
var(sounds) array<Sound> EmoteSoundJump;
var(sounds) array<Sound> EmoteSoundLand;
var(sounds) array<Sound> EmoteSoundClimb;
var(sounds) array<Sound> EmoteSoundPain;
var(sounds) array<Sound> EmoteSoundPunch;
var(sounds) array<Sound> EmoteSoundPull;
var(sounds) array<Sound> EmoteSoundShimmy;
var(sounds) array<Sound> EmoteSoundThrow;
var(sounds) array<Sound> EmoteSoundFaint;
var(sounds) array<Sound> EmoteSoundVictory;
var(sounds) array<Sound> SoundShimmy;
var(sounds) array<Sound> SoundPickup;
var(sounds) array<Sound> SoundThrow;
var(sounds) array<Sound> DoubleJumpSound;
var() name FrontLeftBone;
var() name FrontRightBone;
var() name BackLeftBone;
var() name BackRightBone;
var() bool bDoFeetSplashes;
var() name AttackStartBoneNames[4];
var() name AttackEndBoneNames[4];
var name AttackStartBoneExtraNames[4];
var name AttackEndBoneExtraNames[4];
var Emitter RibbonEffect;
var Emitter RibbonExtraEffect;
var() Class<Emitter> RibbonEmitterName;
var() Texture TexName;
var Texture PowerfulTexName;
var() name PlayerDyingAnim;
var() float KnockBackDistance;
var SHInterestManager InterestMgr;
var CommentaryManagerCheer CheerMgr;
var savegameinfo SaveInfo;
var Vector FallOrginLocation;
var() int DeathIfFallDistance;
var() bool AmInvunerable;
var travel OwnedInventoryItem OwnedInventoryItem;
var globalconfig string LevelBonusEnteredFrom;
var globalconfig bool SaveCameraNoSnapRotation;
var bool bPressDuringQuickThrow;
var bool bPressDuringRunAttack;
var() bool bUseBouncePad;
var() bool bUseJumpMagnet;
var() array<Material> SkinsVisible;
var() array<Material> SkinsInvisible;
var() bool bInvisible;
var() Class<Emitter> InvisibleEmitterName;
var() float InvisibilityPercent;
var() bool bHasStrengthPotion;
var() Class<Emitter> StrengthEmitterName;
var array<Emitter> StrengthEmitter;
var() array<name> StrengthEmitterBoneName;
var() int StrengthPotionScale;
var() bool bShrink;
var() Class<Emitter> ShrinkEmitterName;
var() float ShrinkSpeed;
var() float ShrinkLimit;
var() float PotionDrawScale;
var ShWeapon SHWeap;
var() name LandingEvent;
var() Class<Emitter> RunAttackEmitterName;
var Emitter RunAttackEmitter;
var Class<Emitter> EndAirAttackEmitterName;
var() Sound EndAirAttackSound;
var() array<name> PotionBumpLines;
var() name WastedPotionBumpLines;
var() name HurtBumpLines;
var() name HitBumpLines;
var() name SimmyBumpLines;
var() name DyingBumpLines;
var() name PickupEnergyBarBumpLines;
var() name PickupShamrockBumpLines;
var() name LowCoinsBumpLines;
var() name ManyCoinsBumpLines;
var() name TiredBumpLines;
var int TiredBumpLineCount;
var() name InWaterBumpLines;
var float fInWaterTime;
var() float InWaterBeforeSayingBumpLine;
var() Sound InWaterSound;
var() Sound OutWaterSound;
var bool bNeedToSave;
var transient Shrek shrekky;
var name LastState;
var name lastcontrollerstate;
var bool bGameFinishedLoading;

function AddAnimNotifys()
{
}

function bool IsBadStateForSaving()
{
}

function OnSaveGame()
{
}

function CreateInterestManager()
{
}

function CreateEnemyCommentaryManager()
{
}

function OnStartedAccelerating()
{
}

function AddFootStepsNotify(MeshAnimation MeshAnim)
{
}

function bool CanPlayLookAroundAnim()
{
}

function PlayLookAroundAnim()
{
}

function PlayEndAirAttackFX()
{
}

function MoveShimmy(name SeqName, float AnimFrame, float AnimRate, float DeltaTime)
{
}

function int GetInventoryCount(name InventoryClassName)
{
}

function CreateRibbonEmitters(int animIndex)
{
}

function CreateRibbonEmittersForRunAttack()
{
}

function DestroyRibbonEmitters()
{
}

function OnBounceExtra(bool bCanMoveWhileJumping)
{
}

function Landed(Vector N)
{
}

function SetFuturePlayerLabel()
{
}

function bool PickUpClosestObject()
{
}

function bool ActivateDriveThrough()
{
}

function bool ThrowSwitchClosestObject()
{
}

function bool ThrowSwitch(Actor Other)
{
}

function EndAttackAnimation(float tweenTime)
{
}

function PutSwordBackIn()
{
}

function StartAttackAnimation(name animseq)
{
}

function bool MovingForward()
{
}

function StartAttack()
{
}

function bool IsAttacking()
{
}

function bool LookAtJumpMagnet(JumpMagnet jm)
{
}

function CheckForJumpMagnets()
{
}

function bool DoJump(bool bUpdating)
{
}

function DoDoubleJump(bool bUpdating)
{
}

function bool StartQuickThrow()
{
}

function DoSomeAction()
{
}

function PlayAttackSound(array<Sound> sounds)
{
}

function PlayArraySound(array<Sound> sounds, float Probability)
{
}

function PlaySpecialSound(Sound snd)
{
}

function PlayJumpSound()
{
}

function PlayDoubleJumpSound()
{
}

function PlayThrowingSound()
{
}

function KWGame.EMaterialType PlayLandingSound()
{
}

function PlayPainSound()
{
}

function PlayClimbingSound()
{
}

function PlayShimmySound()
{
}

function PlayPickupSound()
{
}

function PreCutPossess()
{
}

function PreCutUnPossess()
{
}

function PostCutUnPossess()
{
}

function GoToStateKnock(bool forward)
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function bool IsTired()
{
}

function bool CanPlayFidgets()
{
}

function MoveKarmaActor(Actor HitActor, float Force)
{
}

function ShakeTheGround()
{
}

function SayHitKarmaBumpLine()
{
}

function HitKarmaActor(Actor HitActor, float Force, array<Sound> SoundArray)
{
}

function HitSHPawn(Actor HitActor, int hitdamage, array<Sound> SoundArray, class<DamageType> DamageType)
{
}

function HitSHPropsStatic(Actor HitActor, int hitdamage, array<Sound> SoundArray, class<DamageType> DamageType)
{
}

function StartRegularAttack()
{
}

function bool CanDoPickupActor()
{
}

function bool CanUsePotion()
{
}

function bool CanUseBoneForHit()
{
}

function HitSomebody(int hitdamage, array<Sound> SoundArray, name animseq, float AnimFrame)
{
}

function CheckForButton(Actor Other)
{
}

function SimpleThrowPotion(int pIndex)
{
}

function AttachPotion(int pIndex, Vector VOffset, Rotator rOffset)
{
}

function PlayThrowPotionSound()
{
}

function PlayDrinkPotionSound()
{
}

function ThrowPotion()
{
}

function RemovePotion()
{
}

function DrinkPotion()
{
}

function MoveAheadABit(Vector V)
{
}

function Vector GetRunAttackEmitterLocation()
{
}

function PlayFalling()
{
}

function bool isAJumpAnimation(name animseq)
{
}

function Died(Controller Killer, class<DamageType> DamageType, Vector HitLocation)
{
}

function PoisonHero(float pTime, class<Emitter> Effect, name Bone, optional Vector EffectOffset, optional Rotator EffectRotation)
{
}

function HitEverybody(bool EndOfSpecialAttack)
{
}

function HealHero()
{
}

function HeroInQuicksand()
{
}

function HeroOutOfQuicksand()
{
}

function HeroInWater()
{
}

function HeroOutOfWater()
{
}

function Bump(Actor Other)
{
}

function ShrinkCameraSetting(float Scale)
{
}

function AdjustShrinkCameraSetting(float Scale)
{
}

function UseShrinkPotion(float DeltaTime)
{
}

function StartBossEncounter(BossEncounterTrigger bet)
{
}

function StopBossEncounter()
{
}

function PlayFootSplashes(name FootBone)
{
}

function PlayFootSplashesFrontLeft()
{
}

function PlayFootSplashesFrontRight()
{
}

function PlayFootSplashesBackLeft()
{
}

function PlayFootSplashesBackRight()
{
}

function UnPause()
{
}

function TakeFallingDamage()
{
}

function bool IsProtected(Actor Enemy)
{
}

function UseSHJumpMagnet()
{
}

function BFGMSwitchControlToPawn(string newname)
{
}

function bool IsFighting()
{
}

function name GetIdleAnimName()
{
}

function ResetSkinUp()
{
}

function PlayPickupEnergyBarBumpLine()
{
}

function PlayPickupShamrockBumpLine()
{
}

function PlayLowCoinsBumpLine()
{
}

function PlayManyCoinsBumpLine()
{
}

function SayShimmyBumpLine()
{
}

function SayHurtBumpLine()
{
}

function SayHitBumpLine()
{
}

function SayInWaterBumpLine()
{
}

function SayWastedPotionBumpLines()
{
}

function SayPotionBumpLine(int PotionIndex)
{
}

function SetInvisibleTextures()
{
}

function SetVisibleTextures()
{
}

function ToggleVisibility()
{
}

function ShowStrengthAttributes()
{
}

function HideStrengthAttributes()
{
}

function StartToShrinkDown()
{
}

function StartToShrinkUp()
{
}

function bool PotionBegin(int Potion)
{
}

function PotionFinished(int Potion)
{
}

function StartSavedRunningGame(int GameSlot)
{
}

function KillAllEnemiesAround(float killradius)
{
}

function UpdateShrekHealth()
{
}

defaultproperties
{
     FootPrintDecal=Class'SHGame.FootPrintProjector'
     maxTimePoisoned=5.000000
     poisonDamageAmount=1.000000
     bSayCombatDialog=True
     fxSwingingDeathClass=Class'SHGame.Cherry_Trail'
     MaxCombatants=2
     JumpWaterAnim="minijump"
     IdleFightAnimName="fightidle"
     KnockBackStartAnimName="knockbackstart"
     KnockBackEndAnimName="knockbackend"
     CarryKnockBackStartAnimName="carryknockbackstart"
     CarryKnockBackEndAnimName="carryknockbackend"
     KnockForwardStartAnimName="knockforwardstart"
     KnockForwardEndAnimName="knockforwardend"
     CarryKnockForwardStartAnimName="carryknockforwardstart"
     CarryKnockForwardEndAnimName="carryknockforwardend"
     RunAttackAnim="punch1"
     NewRunAttackAnim="punch1"
     StartSpecialAttackAnim="SpecialAttack"
     StartAttackAnim="punch1start"
     StartAttackAnim1="punch1"
     EndAttackAnim1="punch1end"
     StartAttackAnim2="punch2"
     EndAttackAnim2="punch2end"
     StartAttackAnim3="punch3"
     EndAttackAnim3="punch3toidle"
     PreStartAttackAnim1="punch3topunch1"
     bCanUseJumpAttack=True
     StartAirAttackAnim="jumpattack"
     LoopAirAttackAnim="jumpattackloop"
     EndAirAttackAnim="jumpattacktoidle"
     ContinueAirAttackAnim="jumpattacktopunch"
     AirAttackBoost=150.000000
     AirAttackFall=700.000000
     StartSupportAttackAnim="hopstart"
     LoopSupportAttackAnim="hoploop"
     EndSupportAttackAnim="hopend"
     UpEndFrontAnim="upendfront"
     UpEndBackAnim="upendback"
     GetUpFrontAnim="getupfront"
     GetUpBackAnim="getupback"
     ThrowPotionAnimName="ThrowPotion"
     DrinkPotionAnimName="DrinkPotion"
     ThrowPotionBoneName="body_r_wrist_joint"
     DrinkPotionBoneName="body_r_wrist_joint"
     PlayerDyingAnim="faint"
     DeathIfFallDistance=768
     SaveCameraNoSnapRotation=True
     InvisibleEmitterName=Class'SHGame.Potion_Invisible'
     InvisibilityPercent=0.500000
     StrengthEmitterName=Class'SHGame.Potion_Strngth'
     StrengthPotionScale=2
     ShrinkEmitterName=Class'SHGame.Potion_Shrink'
     ShrinkSpeed=0.500000
     ShrinkLimit=0.250000
     PotionDrawScale=1.000000
     EndAirAttackEmitterName=Class'SHGame.Body_Slam'
     InWaterBeforeSayingBumpLine=30.000000
     InWaterSound=Sound'items.water_jump_in'
     OutWaterSound=Sound'items.water_climb_out'
     bCouldBeAttacked=True
     bIsAFriend=True
     fThrowVelocity=800.000000
     CameraSetStandard=(vLookAtOffset=(X=-25,Y=0,Z=65),fLookAtDistance=170,fLookAtHeight=30,fRotTightness=8,fRotSpeed=8,fMoveTightness=(X=25,Y=40,Z=40),fMoveSpeed=0,fMaxMouseDeltaX=190,fMaxMouseDeltaY=65,fMinPitch=-10000,fMaxPitch=10000)
     WalkAnims(1)="walkbackward"
     WalkAnims(2)="walkleft"
     WalkAnims(3)="walkright"
     CarryTurnRightAnim="carryidle"
     CarryTurnLeftAnim="carryidle"
     CarryIdleAnimName="carryidle"
     CarryForwardAnimName="carry"
     CarryBackwardAnimName="carrybackward"
     CarryKnockBackAnimName="CarryKnockBack"
     CarryStrafeLeftAnimName="carrystrafeleft"
     CarryStrafeRightAnimName="carrystraferight"
     LeftUpperLidBone="body_l_upperlid_joint"
     LeftLowerLidBone="body_l_lowerlid_joint"
     RightUpperLidBone="body_r_upperlid_joint"
     RightLowerLidBone="body_r_lowerlid_joint"
     LeftBrowBone="body_l_brow1_joint"
     RightBrowBone="body_r_brow1_joint"
     LeftBlinkAnim="l_blink"
     RightBlinkAnim="r_blink"
     bCanBlink=True
     IdleAnims(0)="bored1"
     IdleAnims(1)="bored1"
     IdleAnims(2)="bored1"
     IdleAnims(3)="bored1"
     IdleAnims(4)="bored2"
     IdleAnims(5)="bored2"
     IdleAnims(6)="bored2"
     IdleAnims(7)="bored2"
     IdleDialogAnims(0)=(AnimName="FidgetScratchHead",AnimRate=0.000000,AnimTime=0.000000,Text="Dialog comment 1")
     IdleDialogAnims(1)=(AnimName="FidgetShakeHead",AnimRate=0.000000,AnimTime=0.000000,Text="Dialog comment 2")
     IdleDialogAnims(2)=(AnimName="FidgetShrug",AnimRate=0.000000,AnimTime=0.000000,Text="Dialog comment 3")
     IdleDialogAnims(3)=(AnimName="FidgetStrafe",AnimRate=0.000000,AnimTime=0.000000,Text="Dialog comment 3")
     IdleDialogAnims(4)=(AnimName="FidgetStrafe",AnimRate=0.000000,AnimTime=0.000000,Text="Dialog comment 3")
     IdleDialogAnims(5)=(AnimName="FidgetStretch",AnimRate=0.000000,AnimTime=0.000000,Text="Dialog comment 3")
     IdleDialogAnims(6)=(AnimName="FidgetTalk",AnimRate=0.000000,AnimTime=0.000000,Text="Dialog comment 3")
     IdleDialogAnims(7)=(AnimName="FidgetWandSwish",AnimRate=0.000000,AnimTime=0.000000,Text="Dialog comment 3")
     bCanDoubleJump=True
     bCanPickupInventory=True
     TurnLeftAnim="turn_left"
     TurnRightAnim="turn_right"
     bActorShadows=True
     bAcceptsProjectors=False
	 bAlignBottom=False
}
