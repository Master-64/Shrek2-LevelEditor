//================================================================================
// AppleTree.
//================================================================================

class AppleTree extends ShProps
  Abstract
  Config(User);

enum eDifficulty {
  E_EASY,
  E_MEDIUM,
  E_HARD,
  E_LOVE
};

var() float DamageRadius;
var() int DamageAmount;
var() Class<Emitter> fxImpactClass;
var() float WakeUpDistance;
var() float GotoSleepDistance;
var() float ThrowInterval;
var() float TimeStunned;
var() int numCoins;
var() name ReactAnimName;
var() string LoadString;
var bool bAlreadyThrown;
var float ThrowTime;
var Emitter fxTreeExplode;
var() Class<Emitter> fxTreeExplodeClass;
var Emitter fxThrowFollow;
var Class<Emitter> fxThrowFollowClass;
var() name turnBoneName;
var() name attachBoneName;
var() name WakeUpAnimName;
var() name RoarAnimName;
var array<name> ThrowAnimName;
var() name StareAnimName;
var() name GotoSleepAnimName;
var name KnockBackAnimName;
var name ChokeAnimName;
var name PreExplodeAnimName;
var name LookAroundAnimName;
var(sounds) array<Sound> sfxSleep;
var(sounds) array<Sound> sfxWakeUp;
var(sounds) array<Sound> sfxRoar;
var(sounds) array<Sound> sfxLook;
var(sounds) array<Sound> sfxThrow;
var(sounds) array<Sound> sfxThrowLeft;
var(sounds) array<Sound> sfxThrowRight;
var(sounds) array<Sound> sfxThrowSquirrel;
var(sounds) array<Sound> sfxSpit;
var(sounds) array<Sound> sfxLand;
var(sounds) array<Sound> sfxLandSquirrel;
var(sounds) array<Sound> sfxChoke;
var(sounds) array<Sound> sfxDie;
var(sounds) array<Sound> sfxOuch;
var(sounds) array<Sound> sfxGasp;
var() eDifficulty throwDifficulty;
var eDifficulty saveDifficulty;
var Class<TreeThrowObject> throwingClass;
var TreeThrowObject throwingObject;
var() Material SkinFreeze;
var Material savedSkin;
var() float shrinkDrawScale;
var float savedDrawScale;
var() name LoveTransAnimName;
var() name LoveIdleAnimName;
var(sounds) array<Sound> sfxLoveLand;
var(sounds) array<Sound> sfxLoveThrow;
var() name sleepBeginAnimName;
var() name sleepLoopAnimName;
var() name sleepEndAnimName;
var() name WhereAnimName;
var() name stinkBeginAnimName;
var() name stinkLoopAnimName;
var() name stinkEndAnimName;
var() name ShrunkAnimName;
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
var Emitter eFreeze;
var name bumpWakeUp;
var name bumpExplode;

function AddAnimNotifys()
{
}

function GetBumpSets()
{
}

function playImpactBumpset(name bumpImpact)
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function class<TreeThrowObject> GetLoveObject()
{
}

function ShakeTheGround()
{
}

function AnimEnd(int Channel)
{
}

function ThrowAppleWhenStunned()
{
}

function OnEvent(name EventName)
{
}

function Vector GetThrowLocation(float t)
{
}

function PreCutPossess()
{
}

function PreCutUnPossess()
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
     DamageRadius=150.000000
     DamageAmount=7
     WakeUpDistance=1000.000000
     GotoSleepDistance=1000.000000
     ThrowInterval=1.000000
     TimeStunned=5.000000
     numCoins=4
     ReactAnimName="WakeUp"
     turnBoneName="turnme"
     attachBoneName="RightWrist"
     WakeUpAnimName="WakeUp"
     RoarAnimName="Roar"
	 ThrowAnimName(0)="ThrowApple"
     StareAnimName="Stare"
     GotoSleepAnimName="GoToSleep"
     SkinFreeze=FinalBlend'EnvAnimsTx.nuttree_ice'
     shrinkDrawScale=0.450000
     LoveTransAnimName="lovetrans"
     LoveIdleAnimName="loveidle"
	 sfxLoveLand(0)=None
	 sfxLoveLand(1)=None
     sfxLoveThrow(0)=Sound'Items.ent_rotten_throw_apple'
     sfxLoveThrow(1)=Sound'Items.ent_rotten_throw_apple'
     sleepBeginAnimName="nightynight_start"
     sleepLoopAnimName="nightynight_loop"
     sleepEndAnimName="nightynight_end"
     WhereAnimName="invisablereact"
     stinkBeginAnimName="stink_start"
     stinkLoopAnimName="stink_loop"
     stinkEndAnimName="stink_end"
     fxShrinkClass=Class'SHGame.Potion_Shrinkall'
     fxLoveClass=Class'SHGame.Potion_Love_tree'
     fxSleepClass=Class'SHGame.Potion_Sleep_tree'
     fxStinkClass=Class'SHGame.Potion_Stink_tree'
     fxFrogClass=Class'SHGame.Potion_Froggy'
     fxFreezeClass=Class'SHGame.Potion_Mist'
     HitsToKill=1
     bCouldBeAttacked=True
     bRequireFightIdle=True
     TakeoffAnims(0)="Idle"
     TakeoffAnims(1)="Idle"
     TakeoffAnims(2)="Idle"
     TakeoffAnims(3)="Idle"
     LandAnims(0)="Idle"
     LandAnims(1)="Idle"
     AirStillAnim="Idle"
     TakeoffStillAnim="Idle"
     IdleWeaponAnim="Idle"
     IdleAnimName="Sleep"
     WalkAnimName="Idle"
     bCanJump=False
     bCanWalk=False
     ControllerClass=Class'SHGame.AppleTreeController'
     MovementAnims(0)="Sleep"
     MovementAnims(1)="Sleep"
     MovementAnims(2)="Sleep"
     MovementAnims(3)="Sleep"
     TurnLeftAnim="Sleep"
     TurnRightAnim="Sleep"
     SoundRadius=100.000000
     TransientSoundVolume=4.000000
     TransientSoundRadius=50.000000
     CollisionRadius=50.000000
     CollisionHeight=150.000000
	 Physics=PHYS_Walking
}