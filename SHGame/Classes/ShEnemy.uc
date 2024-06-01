//================================================================================
// ShEnemy.
//================================================================================

class ShEnemy extends SHCharacter
  Config(User);

enum E_PickupType {
  Type_Pumpkin,
  Type_Rock,
  Type_AppleRotten,
  Type_AppleExplode,
  Type_Potion
};

var(Enemy) bool bTriggerStart;
var(Enemy) float ReactDistance;
var(Enemy) float DamageAmount;
var(Enemy) bool bAttack;
var(Enemy) float HeroEscapeDistance;
var(Enemy) bool bWander;
var(Enemy) float FidgetAnimInterval;
var(Enemy) float PreCombatSpeed;
var(Enemy) float CombatSpeed;
var(Enemy) float LoveSpeed;
var(Enemy) float LoveDistance;
var(Enemy) bool StepBackOnDamage;
var() float AttackDistance;
var() float HitDistance;
var() Class<KWAIController> CombatController;
var() Class<KWAIController> PreCombatController;
var(Sound) float PitchMin;
var(Sound) float PitchMax;
var(sounds) array<Sound> sfxWeaponSwoosh;
var(sounds) array<Sound> sfxAttackEffort;
var(sounds) array<Sound> sfxAttackConnect;
var(sounds) array<Sound> sfxOuch;
var(sounds) array<Sound> sfxEnemyAware;
var(sounds) array<Sound> sfxFaint;
var() Sound sfxGroundSplat;
var bool bSpawned;
var name GroupName;
var() string LoadString;
var() array<Material> RandSkins;
var Emitter RibbonEffect;
var() Class<Emitter> RibbonEmitterName;
var Vector vHome;
var Rotator vHomeRotation;
var() int CurrentWorkIndex;
var() name WorkBeginAnim;
var() name WorkLoopAnim;
var() name EndWorkAnim;
var() name StartCheerAnim;
var() name LoopCheerAnim;
var() name EndCheerAnim;
var() bool bReturnToWaitForTrigger;
var Actor ThrowingPile;
var EnemyPickup throwingItem;
var name attachBone;
var E_PickupType typeToThrow;
var(Enemy) name CombatIdleAnimName;
var(Enemy) name CombatWalkAnimName;
var(Enemy) array<name> AttackAnimName;
var(Enemy) name FaintAnimName;
var(Enemy) name CasualIdleAnimName;
var(Enemy) name CasualWalkAnimName;
var(Enemy) name LookAroundAnimName;
var(Enemy) name FlyBackAnimName;
var(Enemy) name SpecialFaintAnimName;
var(Enemy) name NoticeAnimName;
var(Enemy) array<string> WorkAnimName;
var(Enemy) name DazedAnimName;
var(Enemy) name AirAttackAnimName;
var(Enemy) name ShrunkAnimName;
var Torch t;
var Emitter E;
var Pitchfork pf;
var KnightSword S;
var Shield sh;
var KnightSwordLo sLo;
var ShieldLo shLo;
var Halberd H;
var Class CurrentWeapon;
var name savedState;
var HoleInGround currentHole;
var() Class<HoleInGround> HoleInGroundClass;
var() Class<HoleInGroundItems> HoleInGroundItemsClass;
var() Class<HoleInGround> TinyAttackSquishClass;
var HoleInGround TinyAttackSquish;
var ShPropsStatic WallSplat;
var Class<ShPropsStatic> wallSplatClass;
var name bumpNotice;
var name bumpTaunt;
var name bumpTauntHero;
var name bumpHit;
var name bumpHitHero;
var name bumpOuch;
var name bumpFaint;
var name bumpWork;
var name bumpFidget;
var name bumpLove;
var name bumpStink;
var name bumpInvisible;
var PotionTimer currentPotionTimer;
var(Enemy) bool bUsePotions;
var(Enemy) Material SkinFreeze;
var(Enemy) Material SkinFreeze2;
var Material savedSkin;
var Material savedSkin2;
var(Enemy) float shrinkDrawScale;
var float savedDrawScale;
var bool bInCombat;
var SquishedEnemy EnemySquish;
var(Enemy) name LoveTransAnimName;
var(Enemy) name LoveIdleAnimName;
var(Enemy) name LoveWalkAnimName;
var(Enemy) name sleepBeginAnimName;
var(Enemy) name sleepLoopAnimName;
var(Enemy) name sleepEndAnimName;
var(Enemy) name WhereAnimName;
var(Enemy) name stinkBeginAnimName;
var(Enemy) name stinkLoopAnimName;
var(Enemy) name stinkEndAnimName;
var() Class<Emitter> fxShrinkClass;
var() Class<Emitter> fxLoveClass;
var() Class<Emitter> fxSleepClass;
var() Class<Emitter> fxStinkClass;
var() Class<Emitter> fxFrogClass;
var() Class<Emitter> fxFreezeClass;
var Emitter eShrink;
var Emitter eLove;
var Emitter eSleep;
var Emitter eStink;
var Emitter eFrog;
var Emitter eFreeze1;
var Emitter eFreeze2;
var(Enemy) array<name> DeathTypeName;

event Destroyed()
{
}

function AddAnimNotifys()
{
}

function PreCutPossess()
{
}

function PreCutUnPossess()
{
}

function GetBumpSets()
{
}

event FellOutOfWorld(Actor.eKillZType KillType)
{
}

function SpawnItemsFromHole()
{
}

function PickupObject()
{
}

function GetThrowType()
{
}

function AnimEnd(int Channel)
{
}

function DestroyRibbonEmitters()
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

event PlayJump()
{
}

function OnEvent(name EventName)
{
}

function bool HeroLevelWithEnemy()
{
}

function stepback(float Amount, float Time)
{
}

function BlendInAnimation(optional float tween)
{
}

function PlayBlendedAnim(name anim, optional float rate, optional float tween)
{
}

function LoopBlendedAnim(name anim, optional float rate, optional float tween)
{
}

function BlendOutAnimation(optional float tween)
{
}

function BlendInFullBody(optional float tween)
{
}

function PlayFullBodyAnim(name anim, optional float rate, optional float tween)
{
}

function LoopFullBodyAnim(name anim, optional float rate, optional float tween)
{
}

function BlendOutFullBody(optional float tween)
{
}

function float GetRandomPitch(int Min, int Max)
{
}

function PlaySfx(array<Sound> sfxArray)
{
}

function Play3DSfx(array<Sound> sfxArray)
{
}

function PlaySingleSfx(Sound sfx)
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

function StartCombatController()
{
}

function StartPreCombatController()
{
}

function bool PotionBegin(int potionNum)
{
}

function PotionFinished(int potionNum)
{
}

function Freeze()
{
}

function UnFreeze()
{
}

function Shrink()
{
}

function Grow()
{
}

function Love()
{
}

function StopLove()
{
}

function frog()
{
}

function StopFrog()
{
}

function FrogDeath()
{
}

function GoToSleep()
{
}

function WakeUp()
{
}

function HeroNotInvisible()
{
}

function Stink()
{
}

function UnStink()
{
}

defaultproperties
{
     ReactDistance=1000.000000
     DamageAmount=5.000000
     bAttack=True
     HeroEscapeDistance=1000.000000
     FidgetAnimInterval=3.000000
     PreCombatSpeed=150.000000
     CombatSpeed=350.000000
     LoveSpeed=125.000000
     LoveDistance=60.000000
     StepBackOnDamage=True
     AttackDistance=20.000000
     HitDistance=25.000000
     PitchMin=0.900000
     PitchMax=1.100000
     CurrentWorkIndex=-1
     bReturnToWaitForTrigger=True
     CombatIdleAnimName="fistidle"
     CombatWalkAnimName="Walk"
     AttackAnimName(0)="punchright"
     AttackAnimName(1)="punchleft"
     FaintAnimName="faint"
     CasualIdleAnimName="Idle"
     CasualWalkAnimName="casualwalk"
     LookAroundAnimName="lookaround"
     FlyBackAnimName="flyback"
     SpecialFaintAnimName="specialfaint"
     NoticeAnimName="enemyaware"
     WorkAnimName(0)="Talk1"
     WorkAnimName(1)="Talk2"
     WorkAnimName(2)="Talk3"
     WorkAnimName(3)="WarmHands"
     AirAttackAnimName="pound"
     HoleInGroundClass=Class'SHGame.HoleInGround'
     HoleInGroundItemsClass=Class'SHGame.HoleInGroundItems'
     bUsePotions=True
     SkinFreeze=FinalBlend'ShCharacters.peasant1_ice'
     shrinkDrawScale=0.450000
     LoveIdleAnimName="Idle"
     LoveWalkAnimName="casualwalk"
     fxShrinkClass=Class'SHGame.Potion_Shrinkall'
     fxLoveClass=Class'SHGame.Potion_Love'
     fxSleepClass=Class'SHGame.Potion_Sleep'
     fxStinkClass=Class'SHGame.Potion_Stink'
     fxFrogClass=Class'SHGame.Potion_Froggy'
     fxFreezeClass=Class'SHGame.Potion_Misty'
     DeathTypeName(0)="stateFaint"
     DeathTypeName(1)="stateFaint"
     DeathTypeName(2)="stateFaint"
     DeathTypeName(3)="stateFaint"
     DeathTypeName(4)="stateFaint"
     DeathTypeName(5)="stateFaint"
     DeathTypeName(6)="stateFaint"
     DeathTypeName(7)="stateFaint"
     DeathTypeName(8)="stateFaint"
     bCouldBeAttacked=True
     AttackAngle=60.000000
     bRequireFightIdle=True
     PunchEmitterClass=Class'SHGame.Punch_Shrek'
     AttackDistFromEnemy=45.000000
     bUseBlobShadow=True
     WalkAnims(0)="casualwalk"
     WalkAnims(1)="casualwalk"
     WalkAnims(2)="casualwalk"
     WalkAnims(3)="casualwalk"
     TakeoffAnims(0)="Idle"
     TakeoffAnims(1)="Idle"
     TakeoffAnims(2)="Idle"
     TakeoffAnims(3)="Idle"
     LandAnims(0)="Idle"
     LandAnims(1)="Idle"
     AirStillAnim="Idle"
     TakeoffStillAnim="Idle"
     IdleWeaponAnim="fistidle"
     RunAnimName="run"
     WalkAnimName="casualwalk"
     KnockBackAnimName="knockback"
     GroundRunSpeed=150.000000
     GroundWalkSpeed=150.000000
     bUnableToBounce=True
     bCanJump=False
     GroundSpeed=150.000000
     Health=4
     ControllerClass=None
     BaseMovementRate=150.000000
     MovementAnims(0)="attackrun"
     MovementAnims(1)="attackrun"
     MovementAnims(2)="attackrun"
     MovementAnims(3)="attackrun"
     bActorShadows=True
     bAcceptsProjectors=False
     SoundRadius=400.000000
     CollisionRadius=23.000000
}
