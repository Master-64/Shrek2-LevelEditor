//================================================================================
// HoleInGround.
//================================================================================

class HoleInGround extends ShPropsStatic
  Config(User);

var() HoleInGroundItems stuff;
var() bool bSpawnsStuff;

function SpawnStuff(Class typeOfStuff)
{
}

defaultproperties
{
     bSpawnsStuff=True
     StaticMesh=StaticMesh'Character_Props.hole'
     PrePivot=(Z=4.000000)
     bShouldBaseAtStartup=False
     CollisionRadius=15.000000
     CollisionHeight=2.000000
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
	 bAlignBottom=False
	 DrawType=DT_StaticMesh
}
