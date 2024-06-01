//================================================================================
// CrushedObject.
//================================================================================

class CrushedObject extends ShProps
  NotPlaceable
  Config(User);

defaultproperties
{
     Physics=PHYS_Falling
	 DrawType=DT_StaticMesh
	 StaticMesh=StaticMesh'Shrek2_Univ_SM.Decal_StampShape'
     CollisionRadius=850.000000
     CollisionHeight=1.000000
     bCollideActors=False
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
}
