//================================================================================
// Cage.
//================================================================================

class Cage extends KWKarmaActor;

defaultproperties
{
     KarmaType=KTYPE_OnBumpOnly
	 ForceFromBump=100000.000000
     StaticMesh=StaticMesh'Shrek2_Karma_SM.cage_hanging'
     CollisionRadius=17.000000
     CollisionHeight=37.000000
     Begin Object Name=KarmaParams0 Class=KarmaParams
         KMass=0.75
         KLinearDamping=1
         KAngularDamping=0.8
         bHighDetailOnly=false
         KRestitution=0.1
     End Object
	 KParams=KarmaParams0
	 DrawType=DT_StaticMesh
}
