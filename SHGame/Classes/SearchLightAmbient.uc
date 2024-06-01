//================================================================================
// SearchLightAmbient.
//================================================================================

class SearchLightAmbient extends ShProps
  Config(User);

struct S_frameStatus
{
  var() float PauseTime;
  var() float rotateAmount;
  var() float rotateSpeed;
};

var name UpDownAnim;
var Rotator savedRotationRate;
var string LoadString;
var() float animSpeed;
var() S_frameStatus frameStatus[40];

function AddAnimNotifys()
{
}

function AnimNotifyLightAction()
{
}

defaultproperties
{
     UpDownAnim="Up"
     LoadString="EnvAnims.search_light"
     animSpeed=1.000000
     ControllerClass=Class'SHGame.SearchLightAmbientController'
     Mesh=SkeletalMesh'EnvAnims.search_light'
     bUnlit=True
     CollisionRadius=20.000000
     CollisionHeight=20.000000
     RotationRate=(Yaw=4096)
}
