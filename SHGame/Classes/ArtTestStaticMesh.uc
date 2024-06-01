//================================================================================
// ArtTestStaticMesh.
//================================================================================

class ArtTestStaticMesh extends ShProps
  Config(User);

var() Material testSkin;

defaultproperties
{
     StaticMesh=StaticMesh'Shrek2_Univ_SM.CoinShape'
     CollisionRadius=35.000000
     CollisionHeight=35.000000
	 DrawType=DT_StaticMesh
}
