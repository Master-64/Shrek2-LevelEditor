//================================================================================
// SlotMachine.
//================================================================================

class SlotMachine extends ShProps
  Config(User);

struct MaxMin
{
  var() int Max;
  var() int Min;
};

enum E_SlotMachineType {
  Type_SlotMachineSmall,
  Type_SlotMachineMed,
  Type_SlotMachineBig
};

var() float SpinTime;
var() float SpinDelay;
var() int LostMin;
var() int LostMax;
var float fCurrTime;
var int MaterialIndex1;
var int MaterialIndex2;
var int MaterialIndex3;
var bool DoneSlot1;
var bool DoneSlot2;
var bool DoneSlot3;
var() Sound CoinDeposit;
var() Sound DoorClose;
var() Sound EjectPrize;
var() Sound SpinLoop1;
var() Sound SpinLoop2;
var() Sound SpinLoop3;
var() Sound SlotStart;
var() Sound SlotStop;
var() Sound TalkiePopup;
var() Sound WinFanfare;
var() array<Material> SlotMaterials;
var() array<Material> SlotSmallMaterials;
var() array<Material> SlotMedMaterials;
var() array<Material> SlotLArgeMaterials;
var() E_SlotMachineType SlotMachineSize;
var int CoinsNeededToActivate;
var int WhichTryWillSucceed;
var int WhichTryIsThis;
var SlotMachineCoin HudCoin;
var(FlyingHudCoins) float fTotalFlyTime;
var(FlyingHudCoins) float fCoinFlyTime;
var float fElapsedFlyTime;
var(FlyingHudCoins) float fNewCoinSpawnedTime;
var float fNewCoinElapsedTime;
var HudItemCoins RealHudCoin;
var Vector RealHudCoinLocation;
var int CoinsRemoved;
var(FlyingHudCoins) Class<Emitter> fxHudCoinClass;
var(FlyingHudCoins) Vector fxHudCoinOffset;
var(SlotPrize) MaxMin LoseLimits;
var(SlotPrize) float StartVelMultiplier;
var(SlotPrize) float Delay;
var int CurrentNum;
var int RandomNums;
var(Probablility) float ProbHeroBar;
var(Probablility) float ProbBoxOfHeroBars;
var(Probablility) float ProbShamrock;
var(Probablility) float ProbStrengthPotion;
var(Probablility) float ProbMicePotion;
var(Probablility) float ProbPixiePotion;
var(Probablility) float ProbWantedPoster;
var(Probablility) array<name> WantedPostersAquired;
var Class<Actor> WhatItemWillBeWon;
var() int HowManyToWin;
var() Vector PrizeSpawnOffset;
var VendingWitch TheWitch;
var(Witch) Vector WitchOffset;
var(Witch) Rotator WitchRotation;
var Sound NotEnoughCoins;
var() float TauntDistance;
var bool bWitchIsPresent;
var float MyDrawScale;

function SpawnWitch()
{
}

function int SetSlotMaterialIndex()
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function bool IsHeroInFront()
{
}

function PlayerLostGamble()
{
}

function PlayerWonGamble()
{
}

function ChooseWinningItems()
{
}

function SpawnWonItems()
{
}

function ChooseSmallItemWon()
{
}

function ChooseMedItemWon()
{
}

function ChooseBigItemWon()
{
}

function bool AWantedPosterIsMissing()
{
}

function name FindMissingWantedPoster()
{
}

function ChooseBigItemsNoPoster()
{
}

function ChooseBigItemsWithPoster()
{
}

function ChooseNeededPoster(name whichone)
{
}

function SpawnItemsWhenLost()
{
}

function SpawnCollectible(class<Actor> aClass)
{
}

function Vector StartVelocity()
{
}

function PlayCoinDeposit()
{
}

function PlayDoorClose()
{
}

function PlayEjectPrize()
{
}

function PlaySpinLoop1()
{
}

function PlaySpinLoop2()
{
}

function PlaySpinLoop3()
{
}

function StopSpinLoop()
{
}

function PlaySlotStart()
{
}

function PlaySlotStop()
{
}

function PlayTalkiePopup()
{
}

function PlayWinFanfare()
{
}

defaultproperties
{
     SpinTime=3.000000
     SpinDelay=1.000000
     LostMin=1
     LostMax=3
     CoinDeposit=Sound'items.slot_coin_deposit'
     DoorClose=Sound'items.slot_door_close'
     EjectPrize=Sound'items.slot_eject_prize'
     SpinLoop1=Sound'items.slot_spinloop1'
     SpinLoop2=Sound'items.slot_spinloop2'
     SpinLoop3=Sound'items.slot_spinloop3'
     SlotStart=Sound'items.slot_start'
     SlotStop=Sound'items.slot_stop'
     TalkiePopup=Sound'items.slot_talkie_popup'
     WinFanfare=Sound'items.slot_win_fanfare'
     SlotMaterials(0)=MaterialSequence'Shrek2_Univ_Tex.PickUps.Slot_Spin'
     SlotMaterials(1)=Texture'Shrek2_Univ_Tex.PickUps.slot1'
     SlotMaterials(2)=Texture'Shrek2_Univ_Tex.PickUps.slot2'
     SlotMaterials(3)=Texture'Shrek2_Univ_Tex.PickUps.slot3'
     SlotMaterials(4)=Texture'Shrek2_Univ_Tex.PickUps.slot4'
     SlotMaterials(5)=Texture'Shrek2_Univ_Tex.PickUps.slot5'
     SlotMaterials(6)=Texture'Shrek2_Univ_Tex.PickUps.slot7'
     fTotalFlyTime=1.000000
     fCoinFlyTime=0.400000
     fNewCoinSpawnedTime=0.200000
     fxHudCoinClass=Class'SHGame.Coin_Explod'
     LoseLimits=(Max=7,Min=2)
     StartVelMultiplier=120.000000
     Delay=0.300000
     ProbHeroBar=4.000000
     ProbBoxOfHeroBars=2.000000
     ProbShamrock=1.000000
     ProbStrengthPotion=3.000000
     ProbMicePotion=2.000000
     ProbPixiePotion=3.000000
     ProbWantedPoster=2.000000
     PrizeSpawnOffset=(Y=60.000000,Z=124.000000)
     WitchOffset=(Z=62.000000)
     WitchRotation=(Yaw=16384)
     TauntDistance=2048.000000
     bCouldBeAttacked=True
     StaticMesh=StaticMesh'Shrek2_Univ_SM.Witch_SlotShape'
     DrawScale=0.600000
     CollisionRadius=50.000000
     CollisionHeight=80.000000
	 DrawType=DT_StaticMesh
}
