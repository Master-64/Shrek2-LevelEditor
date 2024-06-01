//================================================================================
// GateKarma.
//================================================================================

class GateKarma extends KWKarmaActor;

defaultproperties
{
     NumberToHit=1
	 KarmaType=KTYPE_OnPunchOnly
     ForceFromHit=100000.000000
     bKarmaJustOnce=True
     StaticMesh=StaticMesh'Shrek2_Karma_SM.gate_2'
     CollisionRadius=130.000000
     CollisionHeight=37.000000
     Begin Object Name=KarmaParams0 Class=KarmaParams
         KAngularDamping=0.75
         bHighDetailOnly=false
         KFriction=1
         KRestitution=0.5
     End Object
     KParams=KarmaParams0
	 DrawType=DT_StaticMesh
}
