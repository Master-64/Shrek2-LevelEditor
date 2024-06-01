//================================================================================
// SearchLight.
//================================================================================

class SearchLight extends ShProps
  Config(User);

struct S_frameStatus
{
  var() float PauseTime;
  var() float rotateAmount;
  var() float rotateSpeed;
};

var bool bHit;
var() name UpDownAnim;
var() name turretBoneName;
var() name lightBoneName;
var Vector turretBoneLocation;
var Vector lightBoneLocation;
var Rotator savedRotationRate;
var() string LoadString;
var() name GroupName;
var(sounds) array<Sound> sfxAlarm;
var() float animSpeed;
var() S_frameStatus frameStatus[40];
var SearchLightCollision playerCollision;
var() float playerCollisionRadius;
var() float playerCollisionHeight;

function OnEvent(name EventName)
{
}

function SetTraceStartLocation()
{
}

function SetTraceEndLocation()
{
}

function SearchForHero()
{
}

function CaughtAHero()
{
}

defaultproperties
{
     UpDownAnim="Up"
     turretBoneName="Light"
     lightBoneName="lightend"
     LoadString="EnvAnims.search_light"
	 sfxAlarm(0)=Sound'FGM_laboratory.alarm_loop1'
     animSpeed=1.000000
     playerCollisionRadius=115.000000
     playerCollisionHeight=100.000000
     ControllerClass=Class'SHGame.SearchLightController'
     Mesh=SkeletalMesh'EnvAnims.search_light'
     bUnlit=True
     CollisionRadius=50.000000
     CollisionHeight=20.000000
     RotationRate=(Yaw=4096)
}
