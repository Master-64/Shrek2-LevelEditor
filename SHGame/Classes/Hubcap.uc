//================================================================================
// Hubcap.
//================================================================================

class Hubcap extends HoleInGround
  Config(User);

var HoleInGroundItems stuff;
var name RollAnimName;
var name IdleAnimName;
var float fTimeTillFadeOutBegins;
var float fFadeOutTime;

defaultproperties
{
     RollAnimName="Roll"
     IdleAnimName="Static"
     fTimeTillFadeOutBegins=3.000000
     fFadeOutTime=1.000000
     bPhysicsAnimUpdate=True
     Mesh=SkeletalMesh'ShrekCharacters.knight_hubcap'
     PrePivot=(X=0,Y=0,Z=0)
	 DrawType=DT_Mesh
}
