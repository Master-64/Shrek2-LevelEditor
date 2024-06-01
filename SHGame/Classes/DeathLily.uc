//================================================================================
// DeathLily.
//================================================================================

class DeathLily extends HoleInGround
  Config(User);

var() float fTimeTillFadeOutBegins;
var() float fFadeOutTime;

defaultproperties
{
     fTimeTillFadeOutBegins=3.000000
     fFadeOutTime=1.000000
	 DrawType=DT_Mesh
     Mesh=SkeletalMesh'EnvAnims.DeathLily'
     DrawScale=2.000000
}
