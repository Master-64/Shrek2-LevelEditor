//================================================================================
// Snapdragon.
//================================================================================

class Snapdragon extends ShProps
  Config(User);

var() int DamageAmount;
var() int touchDamageAmount;
var() bool bTriggerStart;
var() Class<Emitter> fxGeyserClass;
var Emitter geyserFX;
var() float ReactDistance;
var() name BoneName;
var Coords BoneCoords;
var() float Interval[6];
var int numIntervals;
var int intervalCounter;
var shpawn OwnerPawn;
var bool bAttachedToBone;
var bool bHit;
var() string LoadString;
var() float TimeStunned;
var() bool bCanDie;
var() Class<Emitter> fxExplodeClass;
var bool bTouched;
var GenericGeyser Geyser;
var bool bCollisionOn;
var() float particleLife;
var float particleLifeCounter;
var() Vector emitterEffectOffset;
var() Rotator emitterEffectRotation;
var() Vector collisionEffectOffset;
var() Rotator collisionEffectRotation;
var name bumpHitHero;
var(sounds) array<Sound> sfxIdle1;
var(sounds) array<Sound> sfxIdle2;
var(sounds) array<Sound> sfxFireStart;
var(sounds) array<Sound> sfxFireLoop;
var(sounds) array<Sound> sfxFireEnd;
var(sounds) array<Sound> sfxSnap;
var(sounds) array<Sound> sfxOuch;
var(sounds) array<Sound> sfxSleepTalk;
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

function AddAnimNotifys()
{
}

function PlaySleepTalkLow()
{
}

function PlaySleepTalkMed()
{
}

function PlaySleepTalkHigh()
{
}

function PlayShortSnapLow()
{
}

function PlayShortSnapHigh()
{
}

function PlayOuchHigh()
{
}

function NotifyHissStart()
{
}

function AnimEnd(int Channel)
{
}

function NotifyHissEnd()
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function DamagePlayer(Vector HitLocation, class<DamageType> DamageType)
{
}

function Touch(Actor Other)
{
}

function bool GetCollideState()
{
}

function Bump(Actor Other)
{
}

function SetFXLocation(Vector V)
{
}

function SetFXRotation(Rotator R)
{
}

function KillFX()
{
}

function TriggerFX()
{
}

function PlayRandomIdle()
{
}

function PlayRandomSnarl()
{
}

function GetBumpSets()
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
     DamageAmount=15
     touchDamageAmount=5
     fxGeyserClass=Class'SHGame.Flower_Spray'
     ReactDistance=600.000000
     BoneName="TopJaw"
     Interval(0)=1.000000
     LoadString="EnvAnims.flower_snapdragon"
     TimeStunned=5.000000
     bCanDie=True
     fxExplodeClass=Class'SHGame.Creature_Explode'
     particleLife=1.000000
     emitterEffectOffset=(X=28.000000,Y=-16.000000,Z=1.000000)
     emitterEffectRotation=(Pitch=49428,Yaw=2610,Roll=42128)
     collisionEffectOffset=(X=89.000000,Y=-46.000000,Z=4.000000)
     collisionEffectRotation=(Pitch=63736,Yaw=45350,Roll=16384)
     sfxIdle1(0)=None
     sfxIdle1(1)=None
     sfxIdle2(0)=None
     sfxIdle2(1)=None
     sfxFireStart(0)=Sound'Items.snapdragon_hiss_start'
     sfxFireStart(1)=Sound'Items.snapdragon_hiss_start'
     sfxFireLoop(0)=Sound'Items.snapdragon_hiss_loop'
     sfxFireLoop(1)=Sound'Items.snapdragon_hiss_loop'
     sfxFireEnd(0)=Sound'Items.snapdragon_hiss_end'
     sfxFireEnd(1)=Sound'Items.snapdragon_hiss_end'
     sfxSnap(0)=Sound'Items.snpdrgn_ShortSnap1'
     sfxSnap(1)=Sound'Items.snpdrgn_ShortSnap2'
     sfxSnap(2)=Sound'Items.snpdrgn_ShortSnap3'
     sfxSnap(3)=Sound'Items.snpdrgn_ShortSnap4'
     sfxOuch(0)=Sound'Items.snpdrgn_ouch1'
     sfxOuch(1)=Sound'Items.snpdrgn_ouch2'
     sfxOuch(2)=Sound'Items.snpdrgn_ouch3'
     sfxOuch(3)=Sound'Items.snpdrgn_ouch4'
     sfxSleepTalk(0)=Sound'Items.snpdrgn_SleepTalk1'
     sfxSleepTalk(1)=Sound'Items.snpdrgn_SleepTalk2'
     sfxSleepTalk(2)=Sound'Items.snpdrgn_SleepTalk3'
     sfxSleepTalk(3)=Sound'Items.snpdrgn_SleepTalk4'
     sfxSleepTalk(4)=Sound'Items.snpdrgn_SleepTalk5'
     SkinFreeze=FinalBlend'EnvAnimsTx.snapdragon_ice'
     shrinkDrawScale=0.450000
     LoveTransAnimName="lovetrans"
     LoveIdleAnimName="loveidle"
     sleepBeginAnimName="nightynight_start"
     sleepLoopAnimName="nightynight_loop"
     sleepEndAnimName="nightynight_end"
     WhereAnimName="invisablereact"
     stinkBeginAnimName="stink_start"
     stinkLoopAnimName="stink_loop"
     stinkEndAnimName="stink_end"
     fxShrinkClass=Class'SHGame.Potion_Shrinkall'
     fxLoveClass=Class'SHGame.Potion_Love'
     fxSleepClass=Class'SHGame.Potion_Sleep'
     fxStinkClass=Class'SHGame.Potion_Stink'
     fxFrogClass=Class'SHGame.Potion_Froggy'
     fxFreezeClass=Class'SHGame.Potion_Mist'
     HitsToKill=-1
     bCouldBeAttacked=True
     bRequireFightIdle=True
     IdleAnimName="Sleep1"
     Health=2
     ControllerClass=Class'SHGame.SnapdragonController'
     MovementAnims(0)="Sleep1"
     MovementAnims(1)="Sleep1"
     MovementAnims(2)="Sleep1"
     MovementAnims(3)="Sleep1"
     TurnLeftAnim="Sleep1"
     TurnRightAnim="Sleep1"
     Mesh=SkeletalMesh'EnvAnims.flower_snapdragon'
     DrawScale3D=(X=2.000000,Y=2.200000,Z=2.000000)
     CollisionRadius=30.000000
     CollisionHeight=25.000000
}
