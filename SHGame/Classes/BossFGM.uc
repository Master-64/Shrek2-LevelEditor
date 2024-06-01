//================================================================================
// BossFGM.
//================================================================================

class BossFGM extends BossPawn
  Placeable
  Config(User);

var() name BFGMIdleAnim;
var() name BFGMSpell1Anim;
var() name BFGMSpell2Anim;
var() name BFGMSpell3Anim;
var() name BFGMSpellKnockBack1;
var() name BFGMSpellKnockBack2;
var() name BFGMFoodKnockBack1;
var() name BFGMFoodKnockBack2;
var() name BFGMDizzy;
var() name BFGMDizzyToIdleStart;
var() name BFGMDizzyToIdleEnd;
var() name BFGMMoveAnimName;
var() float BFGMKnockBackDistance;
var() float BFGMKnockBackRate;
var() Class<Emitter> FlyEmitterClass;
var Emitter FlyEmitter;
var() name FlyEmitterBoneName;
var() Sound sfxSpell1;
var() Sound sfxSpell2;
var() Sound sfxSpell3;
var() Sound sfxThrowing1;
var() Sound sfxThrowing2;
var() Sound sfxThrowing3;
var() Class<Emitter> Spell1_AimEmitterClass;
var() Class<Emitter> Spell2_AimEmitterClass;
var() Class<Emitter> Spell3_AimEmitterClass;
var() Emitter Spell1_AimEmitter;
var() Emitter Spell2_AimEmitter;
var() Emitter Spell3_AimEmitter;
var() Class<Emitter> Spell1_CastEmitterClass;
var() Class<Emitter> Spell2_CastEmitterClass;
var() Class<Emitter> Spell3_CastEmitterClass;
var() Emitter Spell1_CastEmitter;
var() Emitter Spell2_CastEmitter;
var() Emitter Spell3_CastEmitter;
var() Class<Emitter> Spell1_ImpactEmitterClass;
var() Class<Emitter> Spell2_ImpactEmitterClass;
var() Class<Emitter> Spell3_ImpactEmitterClass;
var() Class<Emitter> Spell1_ReflectEmitterClass;
var() Class<Emitter> Spell2_ReflectEmitterClass;
var() Class<Emitter> Spell3_ReflectEmitterClass;
var() FGMThrowing Spell1_Cast;
var() FGMThrowing Spell2_Cast;
var() FGMThrowing Spell3_Cast;
var() float Spell1_ThrowTime;
var() float Spell2_ThrowTime;
var() float Spell3_ThrowTime;
var() name WandTipName;
var() int Spells_1_InARow;
var() int Spells_2_InARow;
var() int Max_Spells_1_InARow;
var() int Max_Spells_2_InARow;
var() int DamageFromFood;
var() int DamageFromPlayer;
var() int DamageToPlayer;
var() float accuracy;
var() name Percent10HealthEvent;
var() name Percent20HealthEvent;
var() name Percent30HealthEvent;
var() name Percent40HealthEvent;
var() name Percent60HealthEvent;
var() name Percent70HealthEvent;
var() name Percent80HealthEvent;
var() name Percent90HealthEvent;
var bool b10PercentHealthEvent;
var bool b20PercentHealthEvent;
var bool b30PercentHealthEvent;
var bool b40PercentHealthEvent;
var bool b50PercentHealthEvent;
var bool b60PercentHealthEvent;
var bool b70PercentHealthEvent;
var bool b80PercentHealthEvent;
var bool b90PercentHealthEvent;
var() name HalfGameEvent;
var() name EndGameEvent;
var() array<Sound> EmoteSoundPain;
var() array<Sound> EmoteSoundThrow;
var() array<Sound> EmoteSoundFaint;
var() array<Sound> EmoteSoundVictory;
var BossEncounterTrigger BossTrigger;
var Vector vNewLoc;
var() bool bCanMove;
var bool bMeshWasChanged;
var() float fAttackChance;
var() float fMoveSpeedMin;
var() float fMoveSpeedMax;
var bool bWasMovedBack;
var bool bDizzyFromSpell;

function AddAnimNotifys()
{
}

function PlayArraySound(array<Sound> sounds, float Probability)
{
}

function PlayPainSound()
{
}

function PlayThrowSound()
{
}

function PlayFaintSound()
{
}

function PlayPainVictory()
{
}

function SayAmbientBumpline()
{
}

function ChangeBFGMMesh()
{
}

function AnimNotifyCastSpell1()
{
}

function AnimNotifyCastSpell2()
{
}

function AnimNotifyCastSpell3()
{
}

function AttachFlyEmitter()
{
}

function WhatToDo()
{
}

function TakeDamageFromSpell(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function TakeDamageFromFood(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

defaultproperties
{
     BFGMIdleAnim="battleidle"
     BFGMSpell1Anim="spell1"
     BFGMSpell2Anim="spell2"
     BFGMSpell3Anim="spell3"
     BFGMSpellKnockBack1="spellknockback1"
     BFGMSpellKnockBack2="spellknockback2"
     BFGMFoodKnockBack1="foodknockback1"
     BFGMFoodKnockBack2="foodknockback2"
     BFGMDizzy="dizzy"
     BFGMDizzyToIdleStart="dizzytoidlestart"
     BFGMDizzyToIdleEnd="dizzytoidleend"
     BFGMMoveAnimName="battlefly"
     BFGMKnockBackDistance=80.000000
     BFGMKnockBackRate=1.500000
     FlyEmitterClass=Class'SHGame.FGM_Pixie'
     FlyEmitterBoneName="body_wandtip_joint"
     sfxSpell1=Sound'FGM_Battle.magic_yellow_ball'
     sfxSpell2=Sound'FGM_Battle.magic_yellow_ball'
     sfxSpell3=Sound'FGM_Battle.magic_blue_ball'
     sfxThrowing1=Sound'FGM_Battle.magic_yellow_windup'
     sfxThrowing2=Sound'FGM_Battle.magic_yellow_windup'
     sfxThrowing3=Sound'FGM_Battle.magic_blue_windup'
     Spell1_AimEmitterClass=Class'SHGame.FGM_Spell1_C'
     Spell2_AimEmitterClass=Class'SHGame.FGM_Spell2_C'
     Spell3_AimEmitterClass=Class'SHGame.FGM_Spell3_C'
     Spell1_CastEmitterClass=Class'SHGame.FGM_Spell1_A'
     Spell2_CastEmitterClass=Class'SHGame.FGM_Spell2_A'
     Spell3_CastEmitterClass=Class'SHGame.FGM_Spell3_A'
     Spell1_ImpactEmitterClass=Class'SHGame.FGM_Spell1_B'
     Spell2_ImpactEmitterClass=Class'SHGame.FGM_Spell2_B'
     Spell3_ImpactEmitterClass=Class'SHGame.FGM_Spell3_B'
     Spell1_ReflectEmitterClass=Class'SHGame.FGM_Spell1_D'
     Spell2_ReflectEmitterClass=Class'SHGame.FGM_Spell2_D'
     Spell3_ReflectEmitterClass=Class'SHGame.FGM_Spell3_D'
     Spell1_ThrowTime=1.100000
     Spell2_ThrowTime=0.900000
     Spell3_ThrowTime=1.000000
     WandTipName="body_wandtip_joint"
     Max_Spells_1_InARow=2
     Max_Spells_2_InARow=2
     DamageFromFood=1
     DamageFromPlayer=5
     DamageToPlayer=5
     Accuracy=1.000000
     EmoteSoundPain(0)=Sound'AllDialog.pc_fgm_fgmemote_22'
     EmoteSoundPain(1)=Sound'AllDialog.pc_fgm_fgmemote_8'
     EmoteSoundPain(2)=Sound'AllDialog.pc_fgm_fgmemote_12'
     EmoteSoundPain(3)=Sound'AllDialog.pc_fgm_fgmemote_14'
     EmoteSoundPain(4)=Sound'AllDialog.pc_fgm_fgmemote_2'
     EmoteSoundPain(5)=Sound'AllDialog.pc_fgm_fgmemote_30'
     EmoteSoundPain(6)=Sound'AllDialog.pc_fgm_fgmemote_32'
     EmoteSoundPain(7)=Sound'AllDialog.pc_fgm_fgmemote_36'
     EmoteSoundThrow(0)=Sound'AllDialog.pc_fgm_fgmemote_4'
     EmoteSoundThrow(1)=Sound'AllDialog.pc_fgm_fgmemote_6'
     EmoteSoundThrow(2)=Sound'AllDialog.pc_fgm_fgmemote_10'
     EmoteSoundThrow(3)=Sound'AllDialog.pc_fgm_fgmemote_40'
     EmoteSoundThrow(4)=Sound'AllDialog.pc_fgm_fgmemote_28'
     EmoteSoundThrow(5)=Sound'AllDialog.pc_fgm_fgmemote_38'
     EmoteSoundThrow(6)=Sound'AllDialog.pc_fgm_fgmemote_16'
     EmoteSoundFaint(0)=Sound'AllDialog.pc_fgm_fgmemote_20'
     EmoteSoundFaint(1)=Sound'AllDialog.pc_fgm_fgmemote_24'
     EmoteSoundFaint(2)=Sound'AllDialog.pc_fgm_fgmemote_34'
     EmoteSoundVictory(0)=Sound'AllDialog.pc_fgm_fgmemote_26'
     EmoteSoundVictory(1)=Sound'AllDialog.pc_fgm_fgmemote_18'
     fAttackChance=0.500000
     fMoveSpeedMin=150.000000
     fMoveSpeedMax=200.000000
     BossHudType=3
     bCouldBeAttacked=False
     NeckRotElement=RE_RollNeg
     HeadRotElement=RE_YawNeg
     Mesh=SkeletalMesh'ShrekCharacters.fgm'
     CollisionRadius=12.000000
     CollisionHeight=25.000000
	 Physics=PHYS_None
}
