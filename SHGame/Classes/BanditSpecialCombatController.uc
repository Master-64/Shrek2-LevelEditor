//================================================================================
// BanditSpecialCombatController.
//================================================================================

class BanditSpecialCombatController extends CombatController;

var FakeStolenCoin stolenCoin;
var bool bNoticeDialog;
var int numCoinsToShow;
var bool bFirstTime;
var Class<Emitter> fxSplatClass;
var Emitter eSplat;

function HitSHPawn(Actor HitActor, int hitdamage, array<Sound> SoundArray, class<DamageType> DamageType)
{
}

function HitSHPawnNoBone(Actor HitActor, int hitdamage, array<Sound> SoundArray, class<DamageType> DamageType)
{
}

function HitSomebody(int hitdamage, array<Sound> SoundArray, name animseq, float AnimFrame)
{
}

function StealCoins()
{
}

function SpawnCoins()
{
}

defaultproperties
{
     bFirstTime=True
     fxSplatClass=Class'SHGame.Ground_Splat'
}
