//================================================================================
// WallSplat.
//================================================================================

class WallSplat extends ShPropsStatic
  Config(User);

var() float fTimeTillFadeOutBegins;
var() float fFadeOutTime;

defaultproperties
{
     fTimeTillFadeOutBegins=3.000000
     fFadeOutTime=1.000000
     StaticMesh=StaticMesh'Character_Props.walldecal'
     DrawScale=0.800000
     bShouldBaseAtStartup=False
     CollisionRadius=1.000000
     CollisionHeight=1.000000
     bCollideActors=False
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
	 DrawType=DT_StaticMesh
	 bAlignBottom=False
}
