//================================================================================
// PunchingBag.
//================================================================================

class PunchingBag extends KarmaSpawning
  Placeable;

var() array<Sound> HitSounds;

function Bump(Actor Other)
{
}

defaultproperties
{
     HitSounds(0)=Sound'Shrek.punching_bag_hit'
     HitBeforeSpawning=2
     bDestroyAfterSpawning=True
     StaticMesh=StaticMesh'Shrek2_Karma_SM.Punch_BagShape'
     CollisionRadius=17.000000
     CollisionHeight=37.000000
	 KarmaType=KTYPE_OnPunchOrBump
     Begin Object Name=KarmaParams0 Class=KarmaParams
         KMass=0.75
         KLinearDamping=1
         KAngularDamping=0.8
         bHighDetailOnly=false
         KRestitution=0.1
     End Object
     KParams=KarmaParams0
}
