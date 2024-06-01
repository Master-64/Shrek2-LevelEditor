//================================================================================
// SquishedEnemy.
//================================================================================

class SquishedEnemy extends ShPropsStatic
  Config(User);

defaultproperties
{
     StaticMesh=StaticMesh'Character_Props.peasant_squash'
     PrePivot=(Z=4.000000)
     bShouldBaseAtStartup=False
     CollisionRadius=15.000000
     CollisionHeight=2.000000
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
	 DrawType=DT_StaticMesh
}
