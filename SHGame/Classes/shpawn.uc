//================================================================================
// shpawn.
//================================================================================

class shpawn extends KWPawn
  Config(User);

struct AttackInfoStruct
{
  var name AnimName;
  var name StartBoneName;
  var name EndBoneName;
  var float StartFrame;
  var float EndFrame;
};

const MAX_NUM_LIVES= 10;
var ShHeroPawn playerHero;
var() bool bInQuicksand;
var() float QuicksandGroundSpeed;
var() name LOWER_BODY_BONE;
var() name UPPER_BODY_BONE;
var() name RIGHT_ARM_BONE;
var() name LEFT_ARM_BONE;
var() int ATTACKCHANNEL_LOWER;
var() int ATTACKCHANNEL_UPPER;
var() int ARMCHANNEL_RIGHT;
var() int ARMCHANNEL_LEFT;
var() bool bInWater;
var() float WaterGroundSpeed;
var(sounds) array<Sound> FootstepsWade;
var(Attack) bool bCouldBeAttacked;
var(Attack) bool bIsAFriend;
var(Attack) float AttackDist;
var(Attack) float AttackHeight;
var(Attack) float AttackAngle;
var(Attack) float SpecialAttackTime;
var() bool bRequireFightIdle;
var() int PickUpType;
var() array<name> PickupAnimNames;
var() array<name> ThrowAnimNames;
var() array<name> CarryIdleAnimNames;
var() array<name> CarryTurnRightAnims;
var() array<name> CarryTurnLeftAnims;
var() array<name> CarryForwardAnimNames;
var() array<name> CarryBackwardAnimNames;
var() array<name> CarryStrafeLeftAnimNames;
var() array<name> CarryStrafeRightAnimNames;
var() float fSpecialAttackTime;
var bool bWasHitInThisAttack;
var() name WadeAnims[4];
var bool bChangeOpacityForFadeOut;
var(Opacity) float DesiredOpacityForFadeOut;
var(Opacity) float SpeedOpacityForFadeOut;
var float CurrentOpacityForFadeOut;
var(Opacity) bool bDestroyAfterFadeOut;
var() array<AttackInfoStruct> AttackInfo;
var() Class<Emitter> PunchEmitterClass;
var() float AttackDistFromEnemy;
var name LastState;
var int savespeeds[6];
var() float PrePotionDrawScale;
var() float Shrinkfactor;
var name AnimNames[11];
var FrogEnemy PotionFrog;

function SetUnLitOnLowEndMachine()
{
}

function GiveDamageToPlayer(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional bool DontSayBumpLine)
{
}

function bool IsAnIdleAnim(name AnimName)
{
}

function RemoveCarryingActor()
{
}

function bool OnCutExitCommand(string Command, out string sError)
{
}

function bool CanPickupInventory(Pickup aPickup)
{
}

function PlayFootStepsSound()
{
}

function bool DoJump(bool bUpdating)
{
}

function Emitter AttachEffectToPawn(class<Emitter> Effect, name AttachmentBone, optional Vector EffectOffset, optional Rotator EffectRotation)
{
}

function DetachEffectFromPawn(Emitter Effect)
{
}

function AddTrailingCharExtraInit()
{
}

function name GetPickupAnimName(Actor A)
{
}

function name GetThrowAnimName(Actor A)
{
}

function name GetCarryIdleAnimName(Actor A)
{
}

function name GetCarryForwardAnimName(Actor A)
{
}

function name GetCarryBackwardAnimName(Actor A)
{
}

function name GetCarryStrafeLeftAnimName(Actor A)
{
}

function name GetCarryStrafeRightAnimName(Actor A)
{
}

function name GetCarryTurnLeftAnim(Actor A)
{
}

function name GetCarryTurnRightAnim(Actor A)
{
}

function CreateController(optional class<Controller> clsType)
{
}

function CreateAIController(optional class<AIController> clsType)
{
}

function Vector AdjustHitPoint(Vector Center, float collRadius, Vector point)
{
}

function bool LineIntersectCylinder(Vector Start, Vector End, Vector Center, float Radius, float Height, out Vector Intersect)
{
}

function bool HitByBone(Actor Other, name animseq, float AnimFrame)
{
}

function bool CanUseBoneForHit()
{
}

function float GetBossHealth()
{
}

function bool PotionBegin(int potiontype)
{
}

function PotionFinished(int potiontype)
{
}

function TransformToFrog()
{
}

function TransformFromFrog(class<Controller> clsType, string Mesh)
{
}

function ShrinkPotionStart()
{
}

function ShrinkPotionEnd(class<Controller> clsType)
{
}

function FreezePotionStart()
{
}

function FreezePotionEnd(class<Controller> clsType, string newskin)
{
}

function DestroyController()
{
}

function SleepPotionStart()
{
}

function SleepPotionEnd(class<Controller> clsType)
{
}

function StinkPotionStart()
{
}

function StinkPotionEnd(class<Controller> clsType)
{
}

function FrogDeath()
{
}

defaultproperties
{
     QuicksandGroundSpeed=150.000000
     LOWER_BODY_BONE="body_root_joint"
     UPPER_BODY_BONE="body_waist_joint"
     RIGHT_ARM_BONE="body_r_clavicle_joint"
     LEFT_ARM_BONE="body_l_clavicle_joint"
     ATTACKCHANNEL_LOWER=12
     ATTACKCHANNEL_UPPER=14
     ARMCHANNEL_RIGHT=40
     ARMCHANNEL_LEFT=41
     WaterGroundSpeed=150.000000
     SpecialAttackTime=20.000000
     PickUpType=-1
     WadeAnims(0)="wade"
     WadeAnims(1)="wadebackward"
     WadeAnims(2)="wadeleft"
     WadeAnims(3)="waderight"
     SpeedOpacityForFadeOut=0.500000
     CurrentOpacityForFadeOut=1.000000
     bDropShadowOnActors=True
     bAllFallingMountsUseBigClimb=True
     BigClimbStart="jumptoclimb"
     BigClimbEnd="climb"
     BigClimbOffset=190.000000
     BigShimmyOffset=190.000000
     StepUpOffset=50.000000
     bAbleToDoShimmy=True
     HangIdleAnim="hangidle"
     JumpToHangAnim="jumptohang"
     ShimmyRightAnim="shimmyright"
     ShimmyLeftAnim="shimmyleft"
     ShimmyRightEndAnim="shimmyrightend"
     ShimmyLeftEndAnim="shimmyleftend"
     HangToLandAnim="hangtoland"
     StepUpAnim="climb"
     StepUpNoTransAnim="climb2"
     TAKEHITBONE="body_root_joint"
     bCanClimbLadders=False
     SoundRadius=300.000000
}
