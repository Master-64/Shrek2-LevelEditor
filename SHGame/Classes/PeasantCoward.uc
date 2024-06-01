//================================================================================
// PeasantCoward.
//================================================================================

class PeasantCoward extends Peasant
  Config(User);

function GetBumpSets()
{
}

defaultproperties
{
     CombatSpeed=500.000000
     CombatController=Class'SHGame.PeasantCowardCombatController'
}
