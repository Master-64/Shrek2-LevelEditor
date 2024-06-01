//================================================================================
// BossPib.
//================================================================================

class BossPib extends BossPawn
  Placeable
  Config(User);

var Sword PibSword;
var() array<name> BPTauntAnims;
var() name BPRunAnim;
var() name BPJumpAnim;
var() name BPStartAttackAnim;
var() name BPJumpAttackAnim;
var() name BPJumpLoopAnim;
var() name BPJumpAttackLoopAnim;
var() name BPJumpLandToRunAnim;
var() name BPJumpLandToStandAnim;
var() name BPHitAnim;
var() name BPMissAnim;
var() name BPHitJumpAnim;
var() name BPMissJumpAnim;
var() name BPJumpBackLoopAnim;
var() name BPFaintAnim;
var() Class<Emitter> HairFlyEmitter;
var() array<Sound> SwishSounds;
var() array<Sound> TrippleSwishSounds;
var() array<Sound> BodyFallSounds;
var() array<Sound> LandingSounds;
var() array<Sound> GetUpSounds;
var BossTarget CurrentTarget;
var Vector TargetLocation;
var float JumpRadius;
var float JumpTime;
var Rotator KeepRotation;
var int AttacksInARow;
var int JumpsInARow;
var() float MinJumpRadius;
var() int DamageToPlayer;
var() int DamageFromPlayer;
var() float JumpTime1;
var() float JumpTime2;
var() float JumpTime3;
var() int MaxAttacksInARow;
var() int MaxJumpsInARow;
var int GameStage;
var bool bLastBodyFall;
var float DialogLenght;
var bool bStartLinesSaid;
var float dlglength;

function FindFirstTarget()
{
}

function AddAnimNotifys()
{
}

function PlayBossPibSound(array<Sound> sounds)
{
}

function PlayHairFlyEmitter(bool Always)
{
}

function bool FindTargetLocation()
{
}

function FindJumpRadiusAndTime()
{
}

function PlayJumpAnim(name jumpanimname)
{
}

function WhatToDo(bool bTaunt)
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function Vector GetRunToLocation()
{
}

function JumpToFirstPoint()
{
}

function JumpToLastPoint()
{
}

defaultproperties
{
     BPTauntAnims(0)=taunt1
     BPTauntAnims(1)=taunt2
     BPTauntAnims(2)=taunt3
     BPRunAnim="run"
     BPJumpAnim="Jump"
     BPStartAttackAnim="attack_start"
     BPJumpAttackAnim="attack_jump"
     BPJumpLoopAnim="jumploop"
     BPJumpAttackLoopAnim="attack_jumploop"
     BPJumpLandToRunAnim="jumptorun"
     BPJumpLandToStandAnim="jumptoidle"
     BPHitAnim="attack_hitshrek"
     BPMissAnim="attack_missshrek"
     BPHitJumpAnim="attack_hitshrekjump"
     BPMissJumpAnim="attack_missshrekjump"
     BPJumpBackLoopAnim="attack_jumpbackloop"
     BPFaintAnim="faint"
     HairFlyEmitter=Class'SHGame.Hair_Fly'
     SwishSounds(0)=Sound'PussInBoots.action_swish1'
     SwishSounds(1)=Sound'PussInBoots.action_swish2'
     SwishSounds(2)=Sound'PussInBoots.action_swish3'
     SwishSounds(3)=Sound'PussInBoots.action_swish4'
     SwishSounds(4)=Sound'PussInBoots.action_swish5'
     SwishSounds(5)=Sound'PussInBoots.action_swish6'
     SwishSounds(6)=Sound'PussInBoots.action_swish7'
     SwishSounds(7)=Sound'PussInBoots.action_swish8'
     SwishSounds(8)=Sound'PussInBoots.action_swish9'
     SwishSounds(9)=Sound'PussInBoots.action_swish10'
     TrippleSwishSounds(0)=Sound'PussInBoots.action_triple_swish1'
     TrippleSwishSounds(1)=Sound'PussInBoots.action_triple_swish2'
     TrippleSwishSounds(2)=Sound'PussInBoots.action_triple_swish3'
     BodyFallSounds(0)=Sound'PussInBoots.body_fall1'
     BodyFallSounds(1)=Sound'PussInBoots.body_fall2'
     BodyFallSounds(2)=Sound'PussInBoots.body_fall3'
     BodyFallSounds(3)=Sound'PussInBoots.body_fall4'
     LandingSounds(0)=Sound'PussInBoots.landing2'
     LandingSounds(1)=Sound'PussInBoots.landing3'
     GetUpSounds(0)=Sound'PussInBoots.get_up'
     MinJumpRadius=50.000000
     DamageToPlayer=2
     DamageFromPlayer=10
     JumpTime1=1.000000
     JumpTime2=1.000000
     JumpTime3=1.000000
     MaxAttacksInARow=3
     MaxJumpsInARow=2
     LandAnims(0)="jumptoidle"
     LandAnims(1)="jumptorun"
     KnockBackAnimName="knockback"
     ControllerClass=Class'SHGame.BossPibController'
     bActorShadows=True
     Mesh=SkeletalMesh'ShrekCharacters.BossPib'
     DrawScale=1.250000
     CollisionRadius=13.000000
     CollisionHeight=24.000000
}
