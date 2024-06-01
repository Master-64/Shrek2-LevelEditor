//================================================================================
// Cherry.
//================================================================================

class Cherry extends TreeThrowObject;

var bool bLanded;

function GetBumpSets()
{
}

function Landed(Vector HitNormal)
{
}

defaultproperties
{
     DamageAmount=7
     fxImpactClass=Class'SHGame.Cherry_Bomb'
     fxRadius=300.000000
     fxTime=2.000000
     fxNumChecks=6
     sfxImpact=Sound'items.pickup_coin03'
}
