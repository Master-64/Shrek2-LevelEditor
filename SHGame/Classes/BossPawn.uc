//================================================================================
// BossPawn.
//================================================================================

class BossPawn extends SHCharacter
  NotPlaceable
  Config(User);

var() int BossHudType;

function HeroKilled(ShHeroPawn Hero)
{
}

function Died(Controller Killer, class<DamageType> DamageType, Vector HitLocation)
{
}

defaultproperties
{
     bCouldBeAttacked=True
}
