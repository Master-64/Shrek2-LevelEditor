//================================================================================
// BanditCombatController.
//================================================================================

class BanditCombatController extends CombatController;

var FakeStolenCoin stolenCoin;
var bool bNoticeDialog;
var int numCoinsToShow;
var Class<Emitter> fxSplatClass;
var Emitter eSplat;
var float cheerDistance;

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
     fxSplatClass=Class'SHGame.Ground_Splat'
}
