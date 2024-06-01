//================================================================================
// PeasantChild.
//================================================================================

class PeasantChild extends PeasantMelee
  NotPlaceable
  Config(User);

var(Enemy) array<name> TauntAnimName;
var(Enemy) array<Material> ChildSkins;

function GetBumpSets()
{
}

defaultproperties
{
     TauntAnimName(0)=cheer1
     TauntAnimName(1)=cheer2
     ReactDistance=3000.000000
     HeroEscapeDistance=3500.000000
     CombatController=Class'SHGame.PeasantChildCombatController'
     bUsePotions=False
     bCouldBeAttacked=False
     bRequireFightIdle=False
     DrawScale=0.850000
     CollisionRadius=15.000000
     CollisionHeight=28.000000
}
