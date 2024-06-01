//================================================================================
// HazMatSplat.
//================================================================================

class HazMatSplat extends HoleInGround
  Config(User);

var() HoleInGroundItems stuff;
var() name RollAnimName;
var() name IdleAnimName;
var() float fTimeTillFadeOutBegins;
var() float fFadeOutTime;
var() Material FlatSkins;

defaultproperties
{
     RollAnimName="Roll"
     IdleAnimName="Static"
     fTimeTillFadeOutBegins=3.000000
     fFadeOutTime=1.000000
     FlatSkins=Texture'ShCharacters.hazmat_flat'
     bSpawnsStuff=False
     bPhysicsAnimUpdate=True
     Mesh=SkeletalMesh'ShrekCharacters.knight_hubcap'
     PrePivot=(Z=0.000000)
     bUnlit=True
	 bAlignBottom=True
	 DrawType=DT_Mesh
}
