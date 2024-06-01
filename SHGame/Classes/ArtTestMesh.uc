//================================================================================
// ArtTestMesh.
//================================================================================

class ArtTestMesh extends ShProps
  Config(User);

var() Material testSkin;
var() name testAnimation;
var() float animSpeed;
var() bool bLoop;
var() Sound testSound;
var() string LoadString;
var() int frameNumber;
var() bool LoopSound;
var float randPitch;

function AnimNotifyPlaySound()
{
}

function AnimEnd(int Channel)
{
}

defaultproperties
{
     animSpeed=1.000000
     Mesh=SkeletalMesh'EnvAnims.Cart'
     CollisionRadius=35.000000
     CollisionHeight=35.000000
	 DrawType=DT_StaticMesh
}
