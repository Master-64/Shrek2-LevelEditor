//================================================================================
// TowerFlatMiddle.
//================================================================================

class TowerFlatMiddle extends KWKarmaActor;

defaultproperties
{
     NumberToHit=1
	 KarmaType=KTYPE_OnPunchOnly
     ForceFromHit=50000.000000
     bKarmaJustOnce=True
     StaticMesh=StaticMesh'Shrek2_Karma_SM.tower_flat_break_middle'
     CollisionRadius=130.000000
     CollisionHeight=37.000000
	 DrawType=DT_StaticMesh
     Begin Object Name=KarmaParams0 Class=KarmaParams
         KAngularDamping=0.75
         bHighDetailOnly=false
         KFriction=1
         KRestitution=0.5
     End Object
     KParams=KarmaParams0
}
