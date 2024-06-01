//================================================================================
// BigRock.
//================================================================================

class BigRock extends KWKarmaActor;

defaultproperties
{
     bStopByKarmaVolume=True
	 KarmaType=KTYPE_OnTriggerOnly
     DamageAmount=1
     StaticMesh=StaticMesh'Shrek2_Karma_SM.BigrockShape'
     bNoDelete=False
     CollisionRadius=200.000000
     CollisionHeight=200.000000
     bDirectional=True
     Begin Object Name=KarmaParams0 Class=KarmaParams
         KActorGravScale=5
         bHighDetailOnly=False
         KFriction=0.5
     End Object
     KParams=KarmaParams0
	 DrawType=DT_StaticMesh
}
