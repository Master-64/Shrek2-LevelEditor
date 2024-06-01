//================================================================================
// Vent.
//================================================================================

class Vent extends ShProps
  Config(User);

var() int DamageAmount;
var() bool bTriggerStart;
var() Class<Emitter> fxPreGeyserClass;
var Emitter PreGeyserFX;
var() name AnimNameWarning;
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
var() float collisionBoxHeight;
var() float collisionBoxRadius;
var() float collisionBoxWidth;
var name bumpHitHero;
var SpawnedGenericGeyser Geyser;
var bool bCollisionOn;
var() float particleLife;
var float particleLifeCounter;
var bool bTouched;
var() Vector emitterEffectOffset;
var() Rotator emitterEffectRotation;
var() Vector collisionEffectOffset;
var() Rotator collisionEffectRotation;
var Vector PreEmitterEffectOffset;
var Rotator PreEmitterEffectRotation;
var(sounds) array<Sound> sfxOpenVent;
var(sounds) array<Sound> sfxCloseVent;
var(sounds) array<Sound> sfxSteamStart;
var(sounds) array<Sound> sfxSteamLoop;
var(sounds) array<Sound> sfxSteamEnd;

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function SetFXLocation(Vector V)
{
}

function SetFXRotation(Rotator R)
{
}

function AnimEnd(int Channel)
{
}

function KillFX()
{
}

function TriggerFX()
{
}

function TriggerPreFX()
{
}

function DamagePlayer(Vector HitLocation, class<DamageType> DamageType)
{
}

function GetBumpSets()
{
}

defaultproperties
{
     DamageAmount=1
     fxPreGeyserClass=Class'SHGame.Vent_Flame_warning'
     AnimNameWarning="Warning"
     fxGeyserClass=Class'SHGame.Vent_Flame'
     ReactDistance=550.000000
     BoneName="joint1"
     Interval(0)=1.000000
     collisionBoxHeight=25.000000
     collisionBoxRadius=15.000000
     particleLife=1.000000
     emitterEffectOffset=(X=10.000000,Y=-10.000000)
     emitterEffectRotation=(Yaw=4590,Roll=32862)
     collisionEffectOffset=(X=50.000000,Y=-97.000000,Z=-4.000000)
     collisionEffectRotation=(Pitch=65356,Yaw=4680,Roll=49426)
     PreEmitterEffectOffset=(X=-25.000000,Y=-38.000000,Z=-3.000000)
     PreEmitterEffectRotation=(Pitch=32768,Yaw=4590,Roll=49246)
     sfxOpenVent(0)=Sound'FGM_laboratory.steam_vent_open_and_start'
     sfxOpenVent(1)=Sound'FGM_laboratory.steam_vent_open_and_start'
     sfxCloseVent(0)=Sound'FGM_laboratory.steam_vent_close'
     sfxCloseVent(1)=Sound'FGM_laboratory.steam_vent_close'
     sfxSteamStart(0)=Sound'FGM_laboratory.steam_start'
     sfxSteamStart(1)=Sound'FGM_laboratory.steam_start'
     sfxSteamLoop(0)=Sound'FGM_laboratory.steam_loop'
     sfxSteamLoop(1)=Sound'FGM_laboratory.steam_loop'
     sfxSteamEnd(0)=Sound'FGM_laboratory.steam_end'
     sfxSteamEnd(1)=Sound'FGM_laboratory.steam_end'
     HitsToKill=1
     WalkAnims(0)="Static"
     WalkAnims(1)="Static"
     WalkAnims(2)="Static"
     WalkAnims(3)="Static"
     IdleAnimName="Static"
     ControllerClass=Class'SHGame.VentController'
     MovementAnims(0)="Static"
     MovementAnims(1)="Static"
     MovementAnims(2)="Static"
     MovementAnims(3)="Static"
     TurnLeftAnim="Static"
     TurnRightAnim="Static"
     Mesh=SkeletalMesh'EnvAnims.vent_spray'
     CollisionRadius=25.000000
     CollisionHeight=25.000000
}
